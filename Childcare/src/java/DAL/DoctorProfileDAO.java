package DAL;

import Models.DoctorProfile;
import Models.PageInfo;
import Models.User;

import java.sql.*;
import java.time.LocalDate;
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
    public boolean load() {
        list.clear();
        String sql = "select * from [User] inner join DoctorProfile on [User].id = DoctorProfile.doctor_id";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                DoctorProfile doctor = new DoctorProfile();

//                add user start
                int id = rs.getInt("id");
                String email = rs.getString("email");
                String password = rs.getString("password");
                String name = rs.getString("name");
                Boolean gender = rs.getBoolean("gender");
                Date dob = rs.getDate("dob");
                int roleId = rs.getInt("role_id");
                String phone = rs.getString("phone_number");
                String address = rs.getString("address");
                String avatar = rs.getString("avatar");
                int statuss = rs.getInt("status");
                User user = new User(id, email, password, name, gender, dob == null ? null : dob.toLocalDate(), roleId, phone, address, avatar, statuss);
//                add user end

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
            return false;
        }
        return true;
    }

    public static void main(String[] args) {
        DoctorProfileDAO dao = new DoctorProfileDAO();
        dao.load();
        for (DoctorProfile doc : dao.getAll()) {
            System.out.println(doc.toString());
        }
    }

    @Override
    public boolean add(DoctorProfile t) {
        String sql = "insert into DoctorProfile(doctor_id,price,qualification,description,department_id,title)  values(?,?,?,?,?,?)";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, t.getDoctorId());
            ps.setDouble(2, t.getPrice());
            ps.setString(3, t.getQualification());
            ps.setString(4, t.getDescription());
            ps.setInt(5, t.getDepartmentId());
            ps.setString(6, t.getTitle());
            ps.execute();
        } catch (SQLException ex) {
            status = "Error add DoctorProfile " + ex.getMessage();
            return false;
        }
        return true;
    }

    @Override
    public boolean update(DoctorProfile t) {
        String sql = "update DoctorProfile set price = ?, qualification = ?,"
                + "[description] = ?, department_id = ?, title = ? where doctor_id = ?";
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
            return false;
        }
        return true;
    }

    @Override
    public boolean delete(DoctorProfile t) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    public List<DoctorProfile> getDoctorBySearchAndDepId(String searchTxt, int depId) {
        List<DoctorProfile> doctors = new ArrayList<DoctorProfile>();
        if (depId == -1) {
            if (searchTxt == null || "".equals(searchTxt)) {
                return list;
            } else {
                for (DoctorProfile d : list) {
                    if (d.getUser().getName().toLowerCase().contains(searchTxt.toLowerCase())) {  // check if post title contains(ignore case) searchTxt
                        doctors.add(d);
                    }
                }
                return doctors;
            }
        }

        for (DoctorProfile d : list) {
            if (d.getDepartmentId() == depId) {
                if (searchTxt == null || "".equals(searchTxt)) {
                    doctors.add(d);
                } else {
                    if (d.getUser().getName().toLowerCase().contains(searchTxt.toLowerCase())) {
                        doctors.add(d);
                    }
                }
            }
        }
        return doctors;
    }

    public List<DoctorProfile> getDoctorsByPage(PageInfo page, List<DoctorProfile> fullList) {
        List<DoctorProfile> doctors = new ArrayList<DoctorProfile>();
        if (fullList.isEmpty()) {
            return doctors;
        }
        int maxIndex = page.getPageindex() * page.getPagesize();
        maxIndex = (maxIndex > fullList.size()) ? fullList.size() : maxIndex;
        for (int i = (page.getPageindex() - 1) * page.getPagesize(); i < maxIndex; i++) {
            doctors.add(fullList.get(i));
        }
        return doctors;
    }

    private List<DoctorProfile> getDummyData() {
        List<DoctorProfile> doctors = new ArrayList<DoctorProfile>();
        for (int i = 1; i < 6; i++) {
            User user = new User(i, "hoangtrungkien" + i + "@gmail.com", "123456789", "Hoàng Trung Kiên ", true, LocalDate.now(), 1, "0123456789", "Hà Nội, Việt Nam", "team-" + (i % 3 == 0 ? "3" : i % 3) + ".jpg", 1);
            doctors.add(new DoctorProfile(i,
                    "Bác sĩ Tôn Thất Thanh Long bắt đầu làm việc tại Phòng khám Đa khoa Thành Công vào tháng 4/2021. Bác sĩ hiện tại đang là Bác sĩ chuyên khoa Nội tại phòng khám. Với hơn 4 năm kinh nghiệm trong ngành, Bác sĩ chuyên thăm khám và điều trị các trường hợp về Nội tiết, Tiêu hóa, Gan mật. Chuyên môn vững chắc cùng sự tận tình với bệnh nhân, Bác sĩ hy vọng có thể đem lại quá trình thăm khám và điều trị tốt nhất.",
                    "Hơn 15 năm kinh nghiệm Khám và điều trị bệnh Mắt - đã thực hiện nhiều ca chấp lẹo, mộng thịt, cũng như nhiều phẫu thuật khác về mắt Kinh nghiệm\n"
                            + "\n"
                            + "Chuyên khoa Mắt Lĩnh vực chuyên sâu\n"
                            + "\n"
                            + "Bắt đầu làm việc tại Phòng khám Đa khoa Thành Công vào tháng 2/2008\n"
                            + "",
                    120000,
                    1, "BS.CK1", user));
        }
        for (int i = 6; i < 13; i++) {
            User user = new User(i, "hoangtrungkien" + i + "@gmail.com", "123456789", "Tôn Thất Thanh Long", true, LocalDate.now(), 1, "0123456789", "Hà Nội, Việt Nam", "team-" + (i % 3 == 0 ? "3" : i % 3) + ".jpg", 1);
            doctors.add(new DoctorProfile(i,
                    "Bác sĩ Tôn Thất Thanh Long bắt đầu làm việc tại Phòng khám Đa khoa Thành Công vào tháng 4/2021. Bác sĩ hiện tại đang là Bác sĩ chuyên khoa Nội tại phòng khám. Với hơn 4 năm kinh nghiệm trong ngành, Bác sĩ chuyên thăm khám và điều trị các trường hợp về Nội tiết, Tiêu hóa, Gan mật. Chuyên môn vững chắc cùng sự tận tình với bệnh nhân, Bác sĩ hy vọng có thể đem lại quá trình thăm khám và điều trị tốt nhất.",
                    "Hơn 15 năm kinh nghiệm Khám và điều trị bệnh Mắt - đã thực hiện nhiều ca chấp lẹo, mộng thịt, cũng như nhiều phẫu thuật khác về mắt Kinh nghiệm\n"
                            + "\n"
                            + "Chuyên khoa Mắt Lĩnh vực chuyên sâu\n"
                            + "\n"
                            + "Bắt đầu làm việc tại Phòng khám Đa khoa Thành Công vào tháng 2/2008\n"
                            + "",
                    200000,
                    i % 5, "BS.CK2", user));
        }
        return doctors;
    }

    
    public DoctorProfile getDoctorByID(int doctorId){
        String sql = "select * from [User] inner join DoctorProfile on [User].id = DoctorProfile.doctor_id "
                + "WHERE doctor_id = ?";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, doctorId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                DoctorProfile doctor = new DoctorProfile();

//                add user start
                int id = rs.getInt("id");
                String email = rs.getString("email");
                String password = rs.getString("password");
                String name = rs.getString("name");
                Boolean gender = rs.getBoolean("gender");
                Date dob = rs.getDate("dob");
                int roleId = rs.getInt("role_id");
                String phone = rs.getString("phone_number");
                String address = rs.getString("address");
                String avatar = rs.getString("avatar");
                int statuss = rs.getInt("status");
                User user = new User(id, email, password, name, gender, dob == null ? null : dob.toLocalDate(), roleId, phone, address, avatar, statuss);
//                add user end

                doctor.setDoctorId(rs.getInt("doctor_id"));
                doctor.setTitle(rs.getString("title"));
                doctor.setPrice(rs.getDouble("price"));
                doctor.setQualification(rs.getString("qualification"));
                doctor.setDescription(rs.getString("description"));
                doctor.setDepartmentId(rs.getInt("department_id"));
                doctor.setUser(user);
                return doctor;
            }
        } catch (SQLException e) {
            status = "Error getAll doctorProfile " + e.getMessage();
            System.out.println(status);
        }
        return new DoctorProfile();
    }
}
