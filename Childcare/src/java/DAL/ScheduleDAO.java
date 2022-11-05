package DAL;

import Models.Schedule;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 * @author Misaki
 */
public class ScheduleDAO implements DAO<Schedule> {

    private List<Schedule> list;
    private Connection con;
    private String status;

    public void setList(List<Schedule> list) {
        this.list = list;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public ScheduleDAO() {
        list = new ArrayList<Schedule>();
        try {
            con = DBContext.getConnection();
        } catch (Exception e) {
            status = "Error connection at UerDAO " + e.getMessage();
        }
    }

    @Override
    public List<Schedule> getAll() {
        return list;
    }

    @Override
    public Schedule get(int id) {
        for (Schedule s : list) {
            if (s.getScheduleId() == id) {
                return s;
            }
        }
        return null;
    }

    public int getScheduleId(int doctorId, int dayOfWeek, boolean isMorningShift) {
        for (Schedule s : list) {
            if (s.getDayOfWeek() == dayOfWeek && s.getIsMorningShift() == isMorningShift && s.getDoctorId() == doctorId) {
                return s.getScheduleId();
            }
        }
        return -1;
    }

    public List<Schedule> getScheduleOfDoctor(int doctorId) {
        List<Schedule> shifts = new ArrayList<Schedule>();
        for (Schedule s : list) {
            if (s.getDoctorId() == doctorId && s.isWorked()) {
                shifts.add(s);
            }
        }
        return shifts;
    }

    public List<Schedule> getAllWorkSchedule(int doctorId) {
        List<Schedule> shifts = new ArrayList<Schedule>();
        for (Schedule s : list) {
            if (s.isWorked()) {
                shifts.add(s);
            }
        }
        return shifts;
    }

    @Override
    public void load() {
        list.clear();
        String sql = "select * from Schedule";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int scheduleId = rs.getInt("scheduleId");
                int doctorId = rs.getInt("doctorId");
                int dayOfWeek = rs.getInt("dayOfWeek");
                Boolean isMorningShift = rs.getBoolean("isMorningShift");
                boolean isWork = rs.getBoolean("status");

                list.add(new Schedule(scheduleId, doctorId, dayOfWeek, isMorningShift, isWork));
            }
        } catch (SQLException e) {
            status = "Error Load Schedule " + e.getMessage();
            System.out.println(status);
        }
    }

    @Override
    public void add(Schedule t) {
        String sql = "insert into Schedule (doctorId, dayOfWeek, isMorningShift, [status]) values(?,?,?,?)";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, t.getDoctorId());
            ps.setInt(2, t.getDayOfWeek());
            ps.setBoolean(3, t.getIsMorningShift());
            ps.setBoolean(4, t.isWorked());

            ps.execute();
        } catch (SQLException e) {
            status = "Error Add Schedule" + e.getMessage();
        }
    }

    @Override
    public void update(Schedule t) {
        String sql = "Update Schedule set doctorId= ?, dayOfWeek= ?, isMorningShift= ?, [status] = ? where scheduleId=?";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, t.getDoctorId());
            ps.setInt(2, t.getDayOfWeek());
            ps.setBoolean(3, t.getIsMorningShift());
            ps.setBoolean(4, t.isWorked());
            ps.setInt(5, t.getScheduleId());
            ps.execute();
        } catch (SQLException e) {
            status = "Error update Schedule " + e.getMessage();
            System.out.println(status);
        }
    }

    @Override
    public void delete(Schedule t) {
        String sql = "delete from Schedule where scheduleId=?";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, t.getScheduleId());
            ps.execute();
        } catch (SQLException e) {
            status = "Error delete Schedule " + e.getMessage();
            System.out.println(status);
        }
    }

    public void updateSchedule(Schedule t) {
        String sql = "Update Schedule set [status] = 1\n"
                + "				where doctorId = ?\n"
                + "				AND [dayOfWeek] = ?\n"
                + "				AND isMorningShift = ?";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, t.getDoctorId());
            ps.setInt(2, t.getDayOfWeek());
            ps.setBoolean(3, t.getIsMorningShift());
            ps.execute();
        } catch (SQLException e) {
            status = "Error delete Schedule " + e.getMessage();
            System.out.println(status);
        }
    }

    public void clearDoctorScheduleStatus(int doctorId) {
        String sql = "Update Schedule set [status] = 0\n"
                + "				where doctorId = ?";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, doctorId);
            ps.execute();
        } catch (SQLException e) {
            status = "Error delete Schedule " + e.getMessage();
            System.out.println(status);
        }
    }

    public void addNewDoctorSchedule(int doctorId) {
        for (int i = 1; i <= 7; i++) {
            Schedule s = new Schedule(doctorId, i, Boolean.TRUE, false);
            add(s);
            list.add(s);
        }
        for (int i = 1; i <= 7; i++) {
            Schedule s = new Schedule(doctorId, i, Boolean.FALSE, false);
            add(s);
            list.add(s);
        }
    }

    public boolean checkExistSchedule(int doctorId) {
        for (Schedule s : list) {
            if (s.getDoctorId() == doctorId) {
                return true;
            }
        }
        return false;
    }

}
