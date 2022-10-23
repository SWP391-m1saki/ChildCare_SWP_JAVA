package DAL;

import Models.Department;
import Models.Slot;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Misaki
 */
public class DepartmentDAO implements DAO<Department>
{

    private List<Department> list ;
    private Connection con;
    private String status;

    public void setList(List<Department> list) {
        this.list = list;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
    
    public DepartmentDAO(){
        list = new ArrayList<Department>();
        try{
            con = new DBContext().getConnection();
        }catch(Exception e){
            status = "Error connection at Department dao" + e.getMessage();
        }
    }
    @Override
    public List<Department> getAll() {
        return list;
    }

    @Override
    public Department get(int id) {
        for(Department d: list){
            if(d.getDepartmentId() == id){
                return d;
            }
        }
        return null;
    }

    @Override
    public void load() {
        list.clear();
        String sql = "select * from Department";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int departmentId = rs.getInt("department_id");  
                String departmentName =rs.getString("department_name");
                String image = rs.getString("image");
                list.add(new Department(departmentId, departmentName, image));
            }
        } catch (Exception e) {
            status = "Error Load Department " + e.getMessage();
            System.out.println(status);
        }
    }

    @Override
    public void add(Department t) {
        String sql = "insert into Department (department_name, image) values(?,?)";
        try{
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, t.getDepartmentName());
            ps.setString(2, t.getImage());
            ps.execute();
        }  catch(Exception e){
            status = "Error Add Department" + e.getMessage();
            System.out.println(status);
        }     
    }

    @Override
    public void update(Department t) {
        String sql = "Update department set department_name=?, image=? where department_id=?";
        try{
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, t.getDepartmentName());
            ps.setString(2, t.getImage());
            ps.setInt(3, t.getDepartmentId());
            ps.execute();
        }  catch(Exception e){
            status = "Error update Department" + e.getMessage();
            System.out.println(status);
        }     
    }

    @Override
    public void delete(Department t) {
        String sql = "delete from Department where department_id=?";
        //System.out.println(sql);
        try{
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1,t.getDepartmentId());
            ps.execute();
        }catch(Exception e){
            status = "Error delete Department " + e.getMessage();
            System.out.println(status);
        }
    }
    
}
