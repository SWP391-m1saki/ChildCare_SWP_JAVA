/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;

import Models.Department;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
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
 * @author ADMIN
 */
public class DepartmentDAO{

    private String status;
    private Connection con;
    
    private HashMap<Integer, Department> departments;

    public DepartmentDAO() {
         try {
            con = DBContext.getConnection();
        } catch (Exception e) {
            status = "Error connection" + e.getMessage();
        }
        departments = new HashMap<>();
        load();
    }
    
    public HashMap<Integer,Department> getAllHasMap() {
        return departments;
    }
    
    //@Override
    public HashMap<Integer,Department> getAll() {
        return departments;
    }

    //@Override
    public Department get(int id) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    //@Override
    public void load() {
        departments.clear();
        String sql = "SELECT * FROM Department";
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
