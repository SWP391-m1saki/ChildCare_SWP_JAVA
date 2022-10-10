package DAL;

import Models.User;
import static java.lang.System.in;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Misaki
 */
public class UserDAO implements DAO<User>{

    private List<User> list;
    private Connection con;
    private String status;

    public void setList(List<User> list) {
        this.list = list;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
    
     public UserDAO() {
        try {
            con = new DBContext().getConnection();
        } catch (Exception e) {
            status = "Error connection at NewsDAO " + e.getMessage();
        }
    }
    
    @Override
    public List<User> getAll() {
        return list;
    }

    @Override
    public User get(int id) {
        for(User u : list){
            if(u.getId() == id) return u;
        }
        return null;
    }

    @Override
    public void load() {
        list = new ArrayList<User>();
        String sql = "select * from [User]";
        try{
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){          
                int id = rs.getInt(1);
                String password = rs.getString(3);
                String gmail = rs.getString(4);
                String phone = rs.getString(5);
                int roleId = rs.getInt(6);
                Date dob = rs.getDate(7);
                String name = rs.getString(8);
                String address = rs.getString(9);
                String avatar = rs.getString(10);
                int status = rs.getInt(11);
                boolean gender = rs.getBoolean(12);
                list.add(new User(id, password, gmail, phone, roleId, dob.toLocalDate(), name, address, avatar, status, gender));
            } 
        }
        catch(Exception e){
            status = "Error getAll student " + e.getMessage();
        }
    }

//    public User ValidateLogin(String username, String password){
//        for(User u: list){
//            if(u.getUsername().equals(username) && u.getPassword().equals(password))
//                return u;
//        }
//        return null;
//    }
    @Override
    public void add(User t) {
        String sql = "insert into User values(?,?,?,?,?,?,?,?,?,?,?)";
//        try{
//            PreparedStatement ps = con.prepareStatement(sql);
//            ps.setString(1,t.getUsername());
//            ps.setString(2, t.getPassword());
//            ps.setString(3, t.getGmail());
//            ps.setString(4, t.getPhoneNumber());
//            ps.setInt(5, t.getRoleId());
//            
//            java.sql.Date date = java.sql.Date.valueOf(t.getDob());
//            ps.setDate(6, date);
//            ps.setString(7, t.getName());
//            ps.setString(8, t.getAddress());
//            ps.setString(9, t.getAvatar());
//            ps.setInt(10, t.getStatus());
//            ps.setBoolean(11, t.isGender());
//            ps.execute();
//        } 
//        catch (SQLException ex) {
//            status = "Error add user " + ex.getMessage();
//        }
        
    }

    @Override
    public void update(User t) {
        String sql = "update [user] set username=?, password=?, gmail=?, phonenumber=?, "
                + "roleid=?, dob=?, name=?, address=?,avatar=?, status=?, gender=? where id=?,";
//        try{
//            PreparedStatement ps = con.prepareStatement(sql);
//            ps.setString(1, t.getUsername());
//            ps.setString(2, t.getPassword());
//            ps.setString(3, t.getGmail());
//            ps.setString(4, t.getPhoneNumber());
//            ps.setInt(5, t.getRoleId());
//            
//            java.sql.Date date = java.sql.Date.valueOf(t.getDob());
//            ps.setDate(6, date);
//            ps.setString(7, t.getName());
//            ps.setString(8, t.getAddress());
//            ps.setString(9, t.getAvatar());
//            ps.setInt(10, t.getStatus());
//            ps.setBoolean(11, t.isGender());
//            ps.setInt(12, t.getId());
//            ps.execute();
//            
//        }
//        catch(Exception e){
//            status = "Error update User " + e.getMessage();
//        }
    }

    @Override
    public void delete(User t) {
        String sql = "delete from [user] where id=?";
        try{
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, t.getId());
            ps.execute();
        }
        catch(Exception e){
            status = "Error at delete User " + e.getMessage();
        }
    }
    
    
}
