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
public class UserDAO  {

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

    //@Override
    public List<User> getAll() {
        return list;
    }

    //@Override
    public User get(int id) {
        for (User u : list) {
            if (u.getId() == id) {
                return u;
            }
        }
        return null;
    }

   // @Override
    public void load() {
        list = new ArrayList<User>();
        String sql = "select id,gmail,[password],[name],gender,dob,role_id,phone_number,[address],avatar,status from [User]";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int id = rs.getInt(1);
                String email = rs.getString(2);
                String password = rs.getString(3);
                String name = rs.getString(4);
                boolean gender = rs.getBoolean(5);
                Date dob = rs.getDate(6);
                int roleId = rs.getInt(7);
                String phone = rs.getString(8);
                String address = rs.getString(9);
                String avatar = rs.getString(10);
                int status = rs.getInt(11);
                list.add(new User(id, email, password, name, gender, dob.toLocalDate(), roleId, phone, address, avatar, status));
            }
        } catch (Exception e) {
            status = "Error getAll student " + e.getMessage();
        }
    }

    public User ValidateLogin(String email, String password) {
        for (User u : list) {
            if (u.getEmail().equals(email) && u.getPassword().equals(password)) {
                return u;
            }
        }
        return null;
    }

    //@Override
    public void add(User t) {
        String sql = "insert into [user] values(?,?,?,?,?,?,?,?,?,?)";
        System.out.println(sql);

        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, t.getEmail());
            ps.setString(2, t.getPassword());
            ps.setString(3, t.getName());
            ps.setBoolean(4, t.isGender());

            java.sql.Date date = java.sql.Date.valueOf(t.getDob());
            ps.setDate(5, date);

            ps.setInt(6, t.getRoleId());
            ps.setString(7, t.getPhoneNumber());
            ps.setString(8, t.getAddress());
            ps.setString(9, t.getAvatar());
            ps.setInt(10, t.getStatus());

            ps.execute();
        } catch (SQLException ex) {
            status = "Error add user " + ex.getMessage();
            System.out.println(status);
        }

    }

    //@Override
    public void update(User t) {
        String sql = "update [user] set gmail=?, password=?, name=?, gender=?, dob=?, phone_number=?, address=?, avatar=? where id=?";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, t.getEmail());
            ps.setString(2, t.getPassword());
            ps.setString(3, t.getName());
            ps.setBoolean(4, t.isGender());

            java.sql.Date date = java.sql.Date.valueOf(t.getDob());
            ps.setDate(5, date);

            ps.setString(6, t.getPhoneNumber());
            ps.setString(7, t.getAddress());
            ps.setString(8, t.getAvatar());
            ps.setInt(9, t.getId());
            ps.execute();
        } catch (Exception e) {
            status = "Error update User " + e.getMessage();
        }
    }

   // @Override
    public void delete(User t) {
        String sql = "delete from [user] where id=?";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, t.getId());
            ps.execute();
        } catch (Exception e) {
            status = "Error at delete User " + e.getMessage();
        }
    }

    public boolean EmailDuplicate(String email){
        for (User u : list){
            if(u.getEmail().equalsIgnoreCase(email)) return true;
        }
        return false;
    }
    
    public void ChangePassword(String email, String newPass){
        String sql = "update [user] set password=? where email=?";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, newPass);
            ps.setString(2, email);
            
            ps.execute();
        } catch (Exception e) {
            status = "Error update Password " + e.getMessage();
        }
        
    }
    public void ActiveUser(String email){
        String sql = "update [user] set status=1 where email=?";
        try{
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, email);
            ps.execute();
        } catch(Exception e){
            status = "Error active User " + e.getMessage();
        }
    }
     public static void main(String[] args) throws Exception {
        UserDAO dao = new UserDAO();
        dao.load();
         for(User u : dao.getAll()) {
             System.out.println(u.toString());;
         }
        //System.out.println(dao.ValidateLogin("admin", "123").toString());
        // cc = new User(9, "lon", "Lon", "Lon", "long", 3, )
        //dao.delete(new User);
    }
}
