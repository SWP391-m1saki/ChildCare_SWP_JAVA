package DAL;

import Models.ChildrenProfile;
import Models.User;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

/**
 * @author Admin
 */
public class ChildrenProfileDAO implements DAO<ChildrenProfile> {

    private List<ChildrenProfile> list;
    private Connection con;
    private String status;

    public ChildrenProfileDAO() {
        try {
            con = DBContext.getConnection();
        } catch (Exception e) {
            status = "Error connection at ChildrenProfileDAO" + e.getMessage();
        }
    }

    @Override
    public List<ChildrenProfile> getAll() {
        return list;
    }

    @Override
    public ChildrenProfile get(int id) {
        for (ChildrenProfile c : list) {
            if (c.getChildrenId() == id) {
                return c;
            }
        }
        return null;
    }

    @Override
    public void load() {
        list = new ArrayList<ChildrenProfile>();
        String sql = "select * from ChildrenProfile c\n"
                + "INNER JOIN [USER] u ON u.id = c.children_id";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            UserDAO userDao = new UserDAO();
            while (rs.next()) {
                int childrenId = rs.getInt("children_id");
                String name = rs.getString("name");
                Boolean gender = rs.getBoolean("gender");
                LocalDate dob = rs.getDate("dob").toLocalDate();
                int parentId = rs.getInt("parent_id");
                String avatar = rs.getString("avatar");
                //System.out.println(roleId);
                ChildrenProfile c = new ChildrenProfile(childrenId, name, gender, dob, parentId, avatar, userDao.getUserByID(parentId));
                list.add(c);
            }
        } catch (SQLException e) {
            status = "Error Load Children Profile " + e.getMessage();
            System.out.println(status);
        }
    }

    @Override
    public void add(ChildrenProfile t) {
        String sql = "insert into ChildrenProfile (name, gender, dob, parent_id, avatar) values(?,?,?,?,?)";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, t.getName());
            ps.setBoolean(2, t.getGender());
            ps.setDate(3, java.sql.Date.valueOf(t.getDob()));
            ps.setInt(4, t.getParentId());
            //System.out.println(t.getParentId());
            ps.setString(5, t.getAvatar());
            ps.execute();
        } catch (SQLException ex) {
            status = "Error add Children profile " + ex.getMessage();
            System.out.println(status);
        }
    }

    @Override
    public void update(ChildrenProfile t) {
        String sql = "update ChildrenProfile set name=?, gender=?, dob=?, avatar=? where children_id=?";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, t.getName());
            ps.setBoolean(2, t.getGender());
            ps.setDate(3, java.sql.Date.valueOf(t.getDob()));
            ps.setString(4, t.getAvatar());
            ps.setInt(5, t.getChildrenId());
            ps.execute();
        } catch (SQLException ex) {
            status = "Error update Children profile " + ex.getMessage();
            System.out.println(status);
        }
    }

    @Override
    public void delete(ChildrenProfile t) {
        String sql = "delete from ChildrenProfile where children_id=?";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, t.getChildrenId());
            ps.execute();
        } catch (Exception e) {
            status = "Error at delete Children Profile";
            System.out.println(status);
        }
    }

    public ArrayList<ChildrenProfile> getChildrenOfUser(int parentId) {
        ArrayList<ChildrenProfile> list1 = new ArrayList<ChildrenProfile>();
        for (ChildrenProfile c : list) {
            if (c.getParentId() == parentId) {
                list1.add(c);
            }
        }
        return list1;
    }

}
