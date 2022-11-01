/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;

import Models.DoctorProfile;
import Models.Schedule;
import Models.Shift;
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
public class ShiftDAO implements DAO<Shift> {

    private List<Shift> list;
    private Connection con;
    private String status;

    public ShiftDAO() {
        list = new ArrayList<Shift>();
        try {
            con = DBContext.getConnection();
        } catch (Exception e) {
            status = "Error connection at Department dao" + e.getMessage();
        }
    }

    @Override
    public List<Shift> getAll() {
        return list;
    }

    @Override
    public Shift get(int id) {
        for (Shift s : list) {
            if (s.getShiftId() == id) {
                return s;
            }
        }
        return null;
    }

    @Override
    public void load() {
        list.clear();
        String sql = "select s.shift_id, date, s.scheduleId, doctorId, dayOfWeek, isMorningShift, [status] \n"
                + "	from Shift s\n"
                + "	INNER JOIN Schedule sch ON s.scheduleId = sch.scheduleId";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int shiftId = rs.getInt("shift_id");
                LocalDate date = rs.getDate("date").toLocalDate();
                int scheduleId = rs.getInt("scheduleId");
                Schedule schedule = new Schedule(scheduleId, rs.getInt("doctorId"), rs.getInt("dayOfWeek"), rs.getBoolean("isMorningShift"), rs.getBoolean("status"));
                Shift s = new Shift(shiftId, date, schedule);
                list.add(s);
            }
        } catch (SQLException e) {
            status = "Error Load Slot " + e.getMessage();
            System.out.println(status);
        }
    }

    @Override
    public void add(Shift t) {
        String sql = "INSERT INTO Shift([date], scheduleId) values(?,?)";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setDate(1, java.sql.Date.valueOf(t.getDate()));
            ps.setInt(2, t.getSchedule().getScheduleId());
            ps.execute();
        } catch (SQLException e) {
            status = "Error Add slot" + e.getMessage();
        }
    }

    @Override
    public void update(Shift t) {
        String sql = "Update Shift set date= ?, scheduleId=? where shift_id = ?";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setDate(1, java.sql.Date.valueOf(t.getDate()));
            ps.setInt(2, t.getSchedule().getScheduleId());
            ps.setInt(3, t.getShiftId());
            ps.execute();
        } catch (SQLException e) {
            status = "Error update Slot " + e.getMessage();
            System.out.println(status);
        }
    }

    @Override
    public void delete(Shift t) {
        String sql = "delete from Shift where shift_id=?";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, t.getShiftId());
            ps.execute();
        } catch (SQLException e) {
            status = "Error delete Slot " + e.getMessage();
            System.out.println(status);
        }
    }

    public List<Shift> getShiftsOfWeek(int week_number) {
        LocalDate start_date = Utils.Utility.getFirstDayOfWeek(week_number);
        LocalDate end_date = Utils.Utility.getLastDayOfWeek(start_date);

        List<Shift> shifts = new ArrayList<>();
        for (Shift shift : list) {
            if (shift.getDate().compareTo(end_date) <= 0 && shift.getDate().compareTo(start_date) >= 0) {
                shifts.add(shift);
            }
        }
        return shifts;
    }

    public List<DoctorProfile> getDoctorListOfShift(int week_number, int dayOfWeek, boolean isMorningShift) {
        List<DoctorProfile> doctors = new ArrayList<>();
        LocalDate date = Utils.Utility.getFirstDayOfWeek(week_number).plusDays(dayOfWeek - 1);
        String sql = "SELECT id, [name], avatar, title, email FROM [Shift] s\n"
                + "                INNER JOIN Schedule sch ON s.scheduleId = sch.scheduleId\n"
                + "                INNER JOIN DoctorProfile d ON d.doctor_id = sch.doctorId\n"
                + "                INNER JOIN [User] u ON u.id = d.doctor_id\n"
                + "                WHERE date = ?\n"
                + "                AND isMorningShift = ?";

        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setDate(1, java.sql.Date.valueOf(date));
            ps.setBoolean(2, isMorningShift);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                User user = new User();
                user.setId(rs.getInt("id"));
                user.setName(rs.getString("name"));
                user.setAvatar(rs.getString("avatar"));
                user.setEmail(rs.getString("email"));

                DoctorProfile doctor = new DoctorProfile();
                doctor.setDoctorId(rs.getInt("id"));
                doctor.setTitle(rs.getString("title"));
                doctor.setUser(user);
                doctors.add(doctor);
            }
        } catch (SQLException e) {
            status = "Error " + e.getMessage();
            System.out.println(status);
        }
        return doctors;
    }

    public List<DoctorProfile> getDoctorListOfShift(int week_number, int dayOfWeek, boolean isMorningShift, int depId) {
        if (depId == -1) {
            return getDoctorListOfShift(week_number, dayOfWeek, isMorningShift);
        }

        List<DoctorProfile> doctors = new ArrayList<>();
        LocalDate date = Utils.Utility.getFirstDayOfWeek(week_number).plusDays(dayOfWeek - 1);
        String sql = "SELECT id, [name], avatar, title, email FROM [Shift] s\n"
                + "                INNER JOIN Schedule sch ON s.scheduleId = sch.scheduleId\n"
                + "                INNER JOIN DoctorProfile d ON d.doctor_id = sch.doctorId\n"
                + "                INNER JOIN [User] u ON u.id = d.doctor_id\n"
                + "                WHERE date = ?\n"
                + "                AND isMorningShift = ?\n"
                + "                AND d.department_id = ?";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setDate(1, java.sql.Date.valueOf(date));
            ps.setBoolean(2, isMorningShift);
            ps.setInt(3, depId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                System.out.println("Okay");
                User user = new User();
                user.setId(rs.getInt("id"));
                user.setName(rs.getString("name"));
                user.setAvatar(rs.getString("avatar"));
                user.setEmail(rs.getString("email"));

                DoctorProfile doctor = new DoctorProfile();
                doctor.setDoctorId(rs.getInt("id"));
                doctor.setTitle(rs.getString("title"));
                doctor.setUser(user);
                doctors.add(doctor);
            }
        } catch (SQLException e) {
            status = "Error " + e.getMessage();
            System.out.println(status);
        }
        return doctors;
    }

    public int numOfWorkDoctorOfShift(List<Shift> shifts, int dayOfWeek, boolean isMorningShift) {
        int countDoctor = 0;
        for (Shift shift : shifts) {
            if (shift.getDate().getDayOfWeek().getValue() == dayOfWeek) {
                if (isMorningShift == shift.getSchedule().getIsMorningShift()) {
                    countDoctor++;
                }
            }
        }
        return countDoctor;
    }

    public void mappingDoctorScheduleToWeek(int week_number) {
        ScheduleDAO scheduleDAO = new ScheduleDAO();
        scheduleDAO.load();
        for (Schedule s : scheduleDAO.getAll()) {
            if (s.isWorked()) {
                Shift shift = new Shift();
                shift.setSchedule(s);
                shift.setDate(Utils.Utility.getFirstDayOfWeek(week_number).plusDays(s.getDayOfWeek() - 1));
                add(shift);
                list.add(shift);
            }
        }
    }

    public boolean removeDoctorOfShift(int week_number, int dayOfWeek, boolean isMorningShift, int doctorId) {
        for (Shift shift : list) {
            if (shift.getDate().equals(Utils.Utility.getFirstDayOfWeek(week_number).plusDays(dayOfWeek - 1))) {
                if (shift.getSchedule().getDoctorId() == doctorId) {
                    if (shift.getDate().getDayOfWeek().getValue() == dayOfWeek && isMorningShift == shift.getSchedule().getIsMorningShift()) {
                        list.remove(shift);
                        delete(shift);
                        return true;
                    }
                }
            }
        }
        return false;
    }
}
