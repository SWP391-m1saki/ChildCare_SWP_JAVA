package DAL;

import Models.DoctorProfile;
import Models.PageInfo;
import Models.User;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
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
    public void load() {
        list.clear();
        String sql = "select * from [User] inner join DoctorProfile on [User].id = DoctorProfile.doctor_id";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                User user = new User();
                DoctorProfile doctor = new DoctorProfile();
                user.setName(rs.getString("name"));
                user.setAvatar(rs.getString("avatar"));
                user.setAddress(rs.getString("address"));
                //! DOB va gmail
                Date dob = rs.getDate("dob");
                user.setDob(dob == null ? null : dob.toLocalDate());
                user.setEmail("gmail");
                user.setRoleId(rs.getInt("role_id"));
                user.setPhoneNumber(rs.getString("phone_number"));
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
        String sql = "insert into DoctorProfile(doctor_id,price,qualification,description,department_id,title)  values(?,?,?,?,?,?)";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, t.getDoctorId());
            ps.setDouble(2, 0);
            ps.setString(3, "1");
            ps.setString(4, "2");
            ps.setInt(5, 1);
            ps.setString(6, "3");
            ps.execute();
        } catch (Exception ex) {
            status = "Error add DoctorProfile " + ex.getMessage();
        }
    }

    @Override
    public void update(DoctorProfile t) {
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
        }
    }

    @Override
    public void delete(DoctorProfile t) {
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
            User user = new User(i, "hoangtrungkien" + i + "@gmail.com", "123456789", "Ho??ng Trung Ki??n ", true, LocalDate.now(), 1, "0123456789", "H?? N???i, Vi???t Nam", "team-" + (i % 3 == 0 ? "3" : i % 3) + ".jpg", 1);
            doctors.add(new DoctorProfile(i,
                    "B??c s?? T??n Th???t Thanh Long b???t ?????u l??m vi???c t???i Ph??ng kh??m ??a khoa Th??nh C??ng v??o th??ng 4/2021. B??c s?? hi???n t???i ??ang l?? B??c s?? chuy??n khoa N???i t???i ph??ng kh??m. V???i h??n 4 n??m kinh nghi???m trong ng??nh, B??c s?? chuy??n th??m kh??m v?? ??i???u tr??? c??c tr?????ng h???p v??? N???i ti???t, Ti??u h??a, Gan m???t. Chuy??n m??n v???ng ch???c c??ng s??? t???n t??nh v???i b???nh nh??n, B??c s?? hy v???ng c?? th??? ??em l???i qu?? tr??nh th??m kh??m v?? ??i???u tr??? t???t nh???t.",
                    "H??n 15 n??m kinh nghi???m Kh??m v?? ??i???u tr??? b???nh M???t - ???? th???c hi???n nhi???u ca ch???p l???o, m???ng th???t, c??ng nh?? nhi???u ph???u thu???t kh??c v??? m???t Kinh nghi???m\n"
                    + "\n"
                    + "Chuy??n khoa M???t L??nh v???c chuy??n s??u\n"
                    + "\n"
                    + "B???t ?????u l??m vi???c t???i Ph??ng kh??m ??a khoa Th??nh C??ng v??o th??ng 2/2008\n"
                    + "",
                    120000,
                    1, "BS.CK1", user));
        }
        for (int i = 6; i < 13; i++) {
            User user = new User(i, "hoangtrungkien" + i + "@gmail.com", "123456789", "T??n Th???t Thanh Long", true, LocalDate.now(), 1, "0123456789", "H?? N???i, Vi???t Nam", "team-" + (i % 3 == 0 ? "3" : i % 3) + ".jpg", 1);
            doctors.add(new DoctorProfile(i,
                    "B??c s?? T??n Th???t Thanh Long b???t ?????u l??m vi???c t???i Ph??ng kh??m ??a khoa Th??nh C??ng v??o th??ng 4/2021. B??c s?? hi???n t???i ??ang l?? B??c s?? chuy??n khoa N???i t???i ph??ng kh??m. V???i h??n 4 n??m kinh nghi???m trong ng??nh, B??c s?? chuy??n th??m kh??m v?? ??i???u tr??? c??c tr?????ng h???p v??? N???i ti???t, Ti??u h??a, Gan m???t. Chuy??n m??n v???ng ch???c c??ng s??? t???n t??nh v???i b???nh nh??n, B??c s?? hy v???ng c?? th??? ??em l???i qu?? tr??nh th??m kh??m v?? ??i???u tr??? t???t nh???t.",
                    "H??n 15 n??m kinh nghi???m Kh??m v?? ??i???u tr??? b???nh M???t - ???? th???c hi???n nhi???u ca ch???p l???o, m???ng th???t, c??ng nh?? nhi???u ph???u thu???t kh??c v??? m???t Kinh nghi???m\n"
                    + "\n"
                    + "Chuy??n khoa M???t L??nh v???c chuy??n s??u\n"
                    + "\n"
                    + "B???t ?????u l??m vi???c t???i Ph??ng kh??m ??a khoa Th??nh C??ng v??o th??ng 2/2008\n"
                    + "",
                    200000,
                    i % 5, "BS.CK2", user));
        }
        return doctors;
    }

}
