package DAL;

import Models.ChildrenProfile;
import Models.DoctorProfile;
import Models.Slot;
import Models.User;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.DayOfWeek;
import java.time.LocalDate;
import java.time.temporal.IsoFields;
import java.time.temporal.TemporalAdjusters;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Misaki
 */
public class SlotDAO implements DAO<Slot> {

    private List<Slot> list;
    private Connection con;
    private String status;

    public SlotDAO() {
        list = new ArrayList<Slot>();
        try {
            con = DBContext.getConnection();
        } catch (Exception e) {
            status = "Error connection at Department dao" + e.getMessage();
        }
    }

    @Override
    public List<Slot> getAll() {
        return list;
    }

    @Override
    public Slot get(int id) {
        for (Slot s : list) {
            if (s.getSlotId() == id) {
                return s;
            }
        }
        return null;
    }

    @Override
    public void load() {
        list.clear();
        String sql = "select * from Slot";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int slotId = rs.getInt("slot_id");
                LocalDate date = rs.getDate("date").toLocalDate();
                int slotTimeId = rs.getInt("slotTimeId");
                Boolean isExamination = rs.getBoolean("isExamination");
                int status = rs.getInt("status");
                int scheduleId = rs.getInt("scheduleId");
                //System.out.println(roleId);
                Slot s = new Slot(slotId, date, isExamination, status, slotTimeId, scheduleId);
                list.add(s);
            }
        } catch (SQLException e) {
            status = "Error Load Slot " + e.getMessage();
            System.out.println(status);
        }
    }

    @Override
    public void add(Slot t) {
        String sql = "insert into Slot (date, slotTimeId, isExamination, status, scheduleId) values(?,?,?,?,?)";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setDate(1, java.sql.Date.valueOf(t.getDate()));
            ps.setInt(2, t.getSlotTimeId());
            ps.setBoolean(3, t.isIsExamination());
            ps.setInt(4, t.getStatus());
            ps.setInt(5, t.getScheduleId());

            ps.execute();
        } catch (SQLException e) {
            status = "Error Add slot" + e.getMessage();
        }
    }

    @Override
    public void update(Slot t) {
        String sql = "Update slot set date=?, slotTimeId=?, isExamination=?, status=?, scheduleId=? where slot_id=?";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setDate(1, java.sql.Date.valueOf(t.getDate()));
            ps.setInt(2, t.getSlotTimeId());
            ps.setBoolean(3, t.isIsExamination());
            ps.setInt(4, t.getStatus());
            ps.setInt(5, t.getScheduleId());
            ps.setInt(6, t.getSlotId());

            ps.execute();
        } catch (Exception e) {
            status = "Error update Slot " + e.getMessage();
            System.out.println(status);
        }
    }

    @Override
    public void delete(Slot t) {
        String sql = "delete from Slot where slot_id=?";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, t.getSlotId());
            ps.execute();
        } catch (SQLException e) {
            status = "Error delete Slot " + e.getMessage();
            System.out.println(status);
        }
    }

    public List<Slot> getSlotsOfWeek(int week_number) {
        LocalDate start_date = Utils.Utility.getFirstDayOfWeek(week_number);
        LocalDate end_date = Utils.Utility.getLastDayOfWeek(start_date);

        List<Slot> slots = new ArrayList<>();
        for (Slot slot : list) {
            if (slot.getDate().isBefore(end_date) && slot.getDate().isAfter(start_date)) {
                slots.add(slot);
            }
        }
        return slots;
    }

    public int getNumOfWorkDoctorOfShift(List<Slot> slots, int dayOfWeek, boolean isMorningShift) {
        int countDoctor = 0;
        for (Slot slot : slots) {
            if (slot.getDate().getDayOfWeek().getValue() == dayOfWeek) {
                if (isMorningShift == slot.isMorningShift()) {
                    countDoctor++;
                }
            }
        }
        return countDoctor;
    }

//    public int[] getDoctorListOfShift(List<Slot> slots, int dayOfWeek, boolean isMorningShift) {
//        ArrayList<Integer>  = new ArrayList<>();
//        for (Slot slot : slots) {
//            if (slot.getDate().getDayOfWeek().getValue() == dayOfWeek) {
//                if (isMorningShift && slot.getSlotTimeId() == 1) {
//                    doctors.add(slot.getScheduleId());
//                } else if (!isMorningShift && slot.getSlotTimeId() == 9) {
//                    doctors.add(slot.getScheduleId());
//                }
//            }
//        }
//        return;
//    }

    public List<DoctorProfile> getDoctorListOfShift(int week_number, int dayOfWeek, boolean isMorningShift) {
        List<DoctorProfile> doctors = new ArrayList<>();
        LocalDate date = Utils.Utility.getFirstDayOfWeek(week_number).plusDays(dayOfWeek - 1);
        String sql = "SELECT id, [name], avatar, title FROM Slot s\n"
                + "INNER JOIN Schedule sch ON s.scheduleId = sch.scheduleId\n"
                + "INNER JOIN DoctorProfile d ON d.doctor_id = sch.doctorId\n"
                + "INNER JOIN [User] u ON u.id = d.doctor_id\n"
                + "WHERE date = ?\n"
                + "AND isMorningShift = ";
        if (isMorningShift) {
            sql += " 1 AND slotTimeId = 1";
        } else {
            sql += " 0 AND slotTimeId = 9";
        }
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setDate(1, java.sql.Date.valueOf(date));
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                User user = new User();
                user.setId(rs.getInt("id"));
                user.setName(rs.getNString("name"));
                user.setAvatar(rs.getNString("avatar"));
                
                DoctorProfile doctor = new DoctorProfile();
                doctor.setDoctorId(rs.getInt("id"));
                doctor.setTitle(rs.getNString("title"));
                doctor.setUser(user);
                doctors.add(doctor);   
            }
        } catch (SQLException e) {
            status = "Error Load Slot " + e.getMessage();
        }
        return doctors;
    }
}
