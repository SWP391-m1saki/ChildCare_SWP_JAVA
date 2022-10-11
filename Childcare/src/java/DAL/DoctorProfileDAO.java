package DAL;

import Models.DoctorProfile;
import Models.User;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class DoctorProfileDAO implements DAO<DoctorProfile> {

    private List<DoctorProfile> list;
    private Connection con;
    private String status;

    @Override
    public List<DoctorProfile> getAll() {
        return list;
    }

    @Override
    public DoctorProfile get(int id) {
        for (DoctorProfile d : list) {
            if (d.getDoctorId() == id) {
                return d;
            }
        }
        return null;
    }

    public DoctorProfileDAO() {
        try {
            con = DBContext.getConnection();
        } catch (Exception e) {
        }
        list = new ArrayList<DoctorProfile>();
        load();
    }

    @Override
    public void load() {
//        List<DoctorProfile> list = new ArrayList<DoctorProfile>();
//        list.clear();

        String sql = "select * from [User] full outer join DoctorProfile \n"
                + "  on [User].id = DoctorProfile.doctor_id";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                User user = new User();
                DoctorProfile doctor = new DoctorProfile();
                user.setName(rs.getString("name"));
                user.setAvatar(rs.getString("avatar"));
                doctor.setDoctorId(rs.getInt("doctor_id"));
                doctor.setTitle(rs.getString("title"));
                doctor.setPrice(rs.getDouble("price"));
                doctor.setQualification(rs.getString("qualification"));
                doctor.setDescription(rs.getString("description"));
                doctor.setDepartmentId(rs.getInt("department_id"));
                doctor.setUser(user);
                list.add(doctor);
            }
        } catch (Exception e) {
            status = "Error getAll doctorProfile " + e.getMessage();
        }
    }

    public static void main(String[] args) {
        DoctorProfileDAO dao = new DoctorProfileDAO();
        dao.load();
        for (DoctorProfile doc : dao.getAll()) {
            System.out.println(doc.toString());
        }
    }

    @Override
    public void add(DoctorProfile t) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void update(DoctorProfile t) {
        String sql = "update DoctorProfile set price = ?, qualification = ?,"
                + "description = ?, department_id = ?, title = ? where department_id = ?";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setDouble(1, t.getPrice());
            ps.setString(2, t.getQualification());
            ps.setString(3, t.getDescription());
            ps.setInt(4, t.getDepartmentId());
            ps.setString(5, t.getTitle());
            ps.setInt(6, t.getDoctorId());
            ps.executeUpdate();
            load();
        } catch (SQLException e) {
            status = "Error at Update DoctorProfile" + e.getMessage();
        }
    }

    @Override
    public void delete(DoctorProfile t) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

}