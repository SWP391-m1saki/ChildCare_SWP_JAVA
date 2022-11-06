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
    public boolean load() {
        list.clear();
        String sql = "select s.shiftId, date, s.scheduleId, doctorId, dayOfWeek, isMorningShift, [status] \n"
                + "	from Shift s\n"
                + "	INNER JOIN Schedule sch ON s.scheduleId = sch.scheduleId";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int shiftId = rs.getInt("shiftId");
                LocalDate date = rs.getDate("date").toLocalDate();
                int scheduleId = rs.getInt("scheduleId");
                Schedule schedule = new Schedule(scheduleId, rs.getInt("doctorId"), rs.getInt("dayOfWeek"), rs.getBoolean("isMorningShift"), rs.getBoolean("status"));
                Shift s = new Shift(shiftId, date, schedule);
                list.add(s);
            }
        } catch (SQLException e) {
            status = "Error Load Slot " + e.getMessage();
            System.out.println(status);
            return false;
        }
        return true;
    }

    @Override
    public boolean add(Shift t) {
        String sql = "INSERT INTO Shift([date], scheduleId) values(?,?)";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setDate(1, java.sql.Date.valueOf(t.getDate()));
            ps.setInt(2, t.getSchedule().getScheduleId());
            ps.execute();
        } catch (SQLException e) {
            status = "Error Add slot" + e.getMessage();
            return false;
        }
        return true;
    }

    @Override
    public boolean update(Shift t) {
        String sql = "Update Shift set date= ?, scheduleId=? where shiftId = ?";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setDate(1, java.sql.Date.valueOf(t.getDate()));
            ps.setInt(2, t.getSchedule().getScheduleId());
            ps.setInt(3, t.getShiftId());
            ps.execute();
        } catch (SQLException e) {
            status = "Error update Slot " + e.getMessage();
            System.out.println(status);
            return false;
        }
        return true;
    }

    @Override
    public boolean delete(Shift t) {
        String sql = "delete from Shift where shiftId=?";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, t.getShiftId());
            ps.execute();
        } catch (SQLException e) {
            status = "Error delete Slot " + e.getMessage();
            System.out.println(status);
            return false;
        }
        return true;
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
    
    public List<Shift> getShiftsOfWeekOfDoctor(int week_number, int doctorId) {
        LocalDate start_date = Utils.Utility.getFirstDayOfWeek(week_number);
        LocalDate end_date = Utils.Utility.getLastDayOfWeek(start_date);

        List<Shift> shifts = new ArrayList<>();
        for (Shift shift : list) {
            if (shift.getSchedule().getDoctorId() == doctorId && shift.getDate().compareTo(end_date) <= 0 && shift.getDate().compareTo(start_date) >= 0) {
                shifts.add(shift);
            }
        }
        return shifts;
    }
    
    public Shift getShiftByDay(List<Shift> shifts, int dayOfWeek, boolean isMorning) {
        for (Shift shift : shifts) {
            if (shift.getSchedule().getDayOfWeek() == dayOfWeek && shift.getSchedule().getIsMorningShift() == isMorning) {
                return shift;
            }
        }
        return null;
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
        String sql = "SELECT id, [name], avatar, title, email FROM [User] u\n"
                + "                INNER JOIN DoctorProfile d ON u.id = d.doctor_id\n "
                + "                INNER JOIN Schedule sch ON d.doctor_id = sch.doctorId\n"
                + "                FULL JOIN [Shift] s ON s.scheduleId = sch.scheduleId\n"
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

    public List<DoctorProfile> getDoctorsNotWorkInShift(int week_number, int dayOfWeek, boolean isMorningShift, int depId) {
        List<DoctorProfile> doctors = new ArrayList<>();
        LocalDate date = Utils.Utility.getFirstDayOfWeek(week_number).plusDays(dayOfWeek - 1);
        String sql = "SELECT id, [name], avatar, title, email \n"
                + "		FROM (\n"
                + "			SELECT DISTINCT id, [name], avatar, title, email, department_id FROM [User] u\n"
                + "			INNER JOIN DoctorProfile d ON u.id = d.doctor_id\n"
                + (depId > 0 ? "WHERE department_id = ?" : "") + "\n"
                + "		) doctor\n"
                + "LEFT JOIN (SELECT shiftId, sch.scheduleId, doctorId FROM [Shift] s\n"
                + "			INNER JOIN Schedule sch ON s.scheduleId = sch.scheduleId\n"
                + "			WHERE s.[date] = ?\n"
                + "			AND isMorningShift = ?\n"
                + "		   ) s1 ON s1.doctorId = doctor.id\n"
                + "WHERE s1.shiftId IS NULL";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            if (depId == -1) {
                ps.setDate(1, java.sql.Date.valueOf(date));
                ps.setBoolean(2, isMorningShift);
            } else {
                ps.setInt(1, depId);
                ps.setDate(2, java.sql.Date.valueOf(date));
                ps.setBoolean(3, isMorningShift);
            }
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

    public void addDoctorToShift(int week_number, int dayOfWeek, boolean morningShift, int doctorId) {
        ScheduleDAO scheduleDAO = new ScheduleDAO();
        scheduleDAO.load();
        int scheduleId = scheduleDAO.getScheduleId(doctorId, dayOfWeek, morningShift);
        if (scheduleId >= 0) {
            Schedule schedule = new Schedule();
            schedule.setScheduleId(scheduleId);
            add(new Shift(scheduleId, Utils.Utility.getFirstDayOfWeek(week_number).plusDays(dayOfWeek - 1), schedule));
        }
    }
}
