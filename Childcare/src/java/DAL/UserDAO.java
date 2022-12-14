    package DAL;

import Models.PageInfo;
import Models.User;
import static java.lang.System.in;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Misaki
 */
public class UserDAO implements DAO<User> {

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
            status = "Error connection at UerDAO " + e.getMessage();
        }
    }

    @Override
    public List<User> getAll() {
        return list;
    }

    @Override
    public User get(int id) {
        for (User u : list) {
            if (u.getId() == id) {
                return u;
            }
        }
        return null;
    }

    @Override
    public void load() {
        list = new ArrayList<User>();

        list.clear();
        
        String sql = "select * from [User]";

        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {

                int id = rs.getInt("id");
                String email = rs.getString("email");
                String password = rs.getString("password");
                String name = rs.getString("name");
                Boolean gender = rs.getBoolean("gender");
                //System.out.println(email +" " +gender );
                Date dob = rs.getDate("dob");
                int roleId = rs.getInt("role_id");
                String phone = rs.getString("phone_number");
                String address = rs.getString("address");
                String avatar = rs.getString("avatar");
                int statuss = rs.getInt("status");
                //System.out.println(roleId);
                User newU = new User(id, email, password, name, gender, dob == null ? null : dob.toLocalDate(), roleId, phone, address, avatar, statuss);
                //System.out.println(newU.getEmail());
                list.add(newU);

            }
        } catch (Exception e) {
            status = "Error Load " + e.getMessage();
            System.out.println(status);
        }
    }

    public User ValidateLogin(String email, String password) {
        //System.out.println(email + " " + password);
        for (User u : list) {
            //System.out.println(u.getEmail() + " " + u.getPassword());
            if (u.getEmail().equals(email) && u.getPassword().equals(password)) {
                return u;
            }
        }
        return null;
    }

    @Override
    public void add(User t) {
        String sql = "insert into [user] (email, password, name, role_id, avatar, status) values(?,?,?,?,?,?)";
        //System.out.println(sql);

        try {
            PreparedStatement ps = con.prepareStatement(sql);
            //System.out.println(t.getName());
//            System.out.println(t.getRoleId());
//            System.out.println(t.getAvatar());
//            System.out.println(t.getStatus());

            ps.setString(1, t.getEmail());
            ps.setString(2, t.getPassword());
            ps.setString(3, t.getName());
            ps.setInt(4, t.getRoleId());
            if (t.getAvatar() == null || t.getAvatar().length() == 0) {
                ps.setString(5, "default-avatar.jpg");
            } else {
                ps.setString(5, t.getAvatar());
            }

            ps.setInt(6, t.getStatus());
            //System.out.println(ps.toString());
            ps.execute();
        } catch (SQLException ex) {
            status = "Error add user " + ex.getMessage();
            System.out.println(status);
        }

    }

    @Override
    public void update(User t) {
        String sql = "update [user] set email=?, password=?, name=?, gender=?, dob=?, phone_number=?, address=?, avatar=? where id=?";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, t.getEmail());
            ps.setString(2, t.getPassword());
            ps.setString(3, t.getName());
            ps.setBoolean(4, t.isGender());

            java.sql.Date date;
            try {
                date = java.sql.Date.valueOf(t.getDob());
            } catch (Exception e) {
                date = null;
            }
            ps.setDate(5, date);

            ps.setString(6, t.getPhoneNumber());
            ps.setString(7, t.getAddress());
            ps.setString(8, t.getAvatar());
            ps.setInt(9, t.getId());
            ps.execute();
        } catch (Exception e) {
            status = "Error update User " + e.getMessage();
            System.out.println(status);
        }
    }

    @Override
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

    public boolean EmailDuplicate(String email) {
        for (User u : list) {
            if (u.getEmail().equalsIgnoreCase(email)) {
                return true;
            }
        }
        return false;
    }

    public void ChangePassword(String email, String newPass) {
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

    public void ActiveUser(String email) {
        String sql = "update [user] set status=1 where email=?";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, email);
            ps.execute();
        } catch (Exception e) {
            status = "Error active User " + e.getMessage();
        }
    }


    public List<User> searchByMailAndName(String emailOrName){
        if(emailOrName == null ||emailOrName.length() == 0){
            return list;
        }
        List<User> userSearch = new ArrayList<>();
        for(User user : list){
            if(user.getEmail().toLowerCase().contains(emailOrName.toLowerCase()) || user.getName().toLowerCase().contains(emailOrName.toLowerCase())){
                userSearch.add(user);
            }
        }
        return  userSearch;
    }
    
    public List<User> getUserByPage(PageInfo page, List<User> fullList) {
        List<User> users = new ArrayList<User>();
        if (fullList.isEmpty()) {
            return users;
        }
        int maxIndex = page.getPageindex() * page.getPagesize();
        maxIndex = (maxIndex > fullList.size()) ? fullList.size() : maxIndex;
        for (int i = (page.getPageindex() - 1) * page.getPagesize(); i < maxIndex; i++) {
            users.add(fullList.get(i));
        }
        return users;
    }
    
    private void createUser() {
        for (int i = 20; i < 70; i++) {
            User user = new User(i, "dungmv@fpt.edu.vn", "aaa", "Mai V??n D??ng", true, LocalDate.parse("2022-07-25"), 1, "0352243473", "H?? N???i", "team-" + (i % 3 + 1) + ".jpg", 1);
            list.add(user);
        }
    }
    
    public void addDoctorDetail(User t){
        String sql = "insert into [user] (email, password, name, role_id, avatar, status,phone_number,dob,address,gender) values(?,?,?,?,?,?,?,?,?,?)";

        try {
            PreparedStatement ps = con.prepareStatement(sql);

            ps.setString(1, t.getEmail());
            ps.setString(2, t.getPassword());
            ps.setString(3, t.getName());
            ps.setInt(4, t.getRoleId());
            if (t.getAvatar() == null || t.getAvatar().length() == 0) {
                ps.setString(5, "default-avatar.jpg");
            } else {
                ps.setString(5, t.getAvatar());
            }
            ps.setInt(6, t.getStatus());
            ps.setString(7, t.getPhoneNumber());
            ps.setDate(8, Date.valueOf(t.getDob()));
            ps.setString(9, t.getAddress());
            ps.setBoolean(10, t.isGender());
            //System.out.println(ps.toString());
            ps.execute();
        } catch (SQLException ex) {
            status = "Error add user " + ex.getMessage();
            System.out.println(status);
        }
    }
    

//        //System.out.println(dao.ValidateLogin("admin", "123").toString());
//        // cc = new User(9, "lon", "Lon", "Lon", "long", 3, )
//        //dao.delete(new User);
//    }

}
