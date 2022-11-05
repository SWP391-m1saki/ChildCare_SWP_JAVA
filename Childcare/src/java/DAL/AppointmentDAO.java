package DAL;

import Models.Appointment;
import Models.ChildrenProfile;
import Models.PageInfo;
import Models.Schedule;
import Models.Shift;
import Models.Slot;
import Models.SlotTime;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Misaki
 */
public class AppointmentDAO implements DAO<Appointment> {

    private List<Appointment> list;
    private Connection con;
    private String status;

    public AppointmentDAO() {
        list = new ArrayList<Appointment>();
        try {
            con = DBContext.getConnection();
        } catch (Exception e) {
            status = "Error connection at Department dao" + e.getMessage();
        }
    }

    @Override
    public List<Appointment> getAll() {
        return list;
    }

    @Override
    public Appointment get(int id) {
        for(Appointment app : list){
            if(app.getAppointmentId() ==id){
                return app;
            }
        }
        return null;
    }

    public List<Appointment> getAppointmentOfCustomer(int customerId) {
        list.clear();
        String sql = "select *\n"
                + "from Appointment\n"
                + "inner join Slot on slot.slot_id = Appointment.slot_id\n"
                + "inner join ChildrenProfile on ChildrenProfile.children_id = Appointment.children_id\n"
                + "inner join SlotTime on slot.slotTimeId = SlotTime.slotTimeId\n"
                + "inner join [shift]  on slot.shiftId = [shift].shiftId\n"
                + "inner join Schedule on  [shift].scheduleId = Schedule.scheduleId\n"
                + "where ChildrenProfile.parent_id = ";
        sql += customerId + "";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int appointmentId = rs.getInt("appointment_id");
                int childrenId = rs.getInt("children_id");
                String childrenName = rs.getString("name");
                LocalDate dob = rs.getDate("dob").toLocalDate();
                Boolean gender = rs.getBoolean("gender");
                String avatar = rs.getString("avatar");

                int slotId = rs.getInt("slot_id");
                int slotTimeId = rs.getInt("slotTimeId");
                Boolean isExamination = rs.getBoolean("isExamination");
                int slot_status = rs.getInt("status");
                int shiftId = rs.getInt("shiftId");
                LocalDate date = rs.getDate("date").toLocalDate();
                int scheduleId = rs.getInt("scheduleId");
                int doctorId = rs.getInt("doctorId");
                int dayOfWeek = rs.getInt("dayOfWeek");
                Boolean isMorningShift = rs.getBoolean("isMorningShift");
                boolean status = rs.getBoolean("status");
                String startTime = rs.getString("startTime");
                String endTime = rs.getString("endTime");
                int appointmentStatus = rs.getInt("appointmentStatus");
                //System.out.println(roleId);
                Slot s = new Slot(slotId, isExamination, slot_status, new SlotTime(slotTimeId, startTime, endTime),
                        new Shift(shiftId, date, new Schedule(scheduleId, doctorId, dayOfWeek, isMorningShift, status)));
                ChildrenProfile c = new ChildrenProfile(childrenId, childrenName, gender, dob, customerId, avatar);
                Appointment ap = new Appointment(appointmentId, c, s, appointmentStatus);
                list.add(ap);
            }
        } catch (SQLException e) {
            status = "Error load Appointment for customer " + e.getMessage();
            System.out.println(status);
        }
        return list;
    }
    
    public List<Appointment> getAppointmentOfDoctor(int doctorId) {
        list.clear();
        String sql = "select *\n"
                + "from Appointment\n"
                + "inner join Slot on slot.slot_id = Appointment.slot_id\n"
                + "inner join ChildrenProfile on ChildrenProfile.children_id = Appointment.children_id\n"
                + "inner join SlotTime on slot.slotTimeId = SlotTime.slotTimeId\n"
                + "inner join [shift]  on slot.shiftId = [shift].shiftId\n"
                + "inner join Schedule on  [shift].scheduleId = Schedule.scheduleId\n"
                + "where Schedule.doctorId = ";
        sql += doctorId + "";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int appointmentId = rs.getInt("appointment_id");
                int childrenId = rs.getInt("children_id");
                String childrenName = rs.getString("name");
                LocalDate dob = rs.getDate("dob").toLocalDate();
                Boolean gender = rs.getBoolean("gender");
                String avatar = rs.getString("avatar");

                int slotId = rs.getInt("slot_id");
                int slotTimeId = rs.getInt("slotTimeId");
                Boolean isExamination = rs.getBoolean("isExamination");
                int slot_status = rs.getInt("status");
                int shiftId = rs.getInt("shiftId");
                LocalDate date = rs.getDate("date").toLocalDate();
                int scheduleId = rs.getInt("scheduleId");
                int dayOfWeek = rs.getInt("dayOfWeek");
                Boolean isMorningShift = rs.getBoolean("isMorningShift");
                boolean status = rs.getBoolean("status");
                String startTime = rs.getString("startTime");
                String endTime = rs.getString("endTime");
                int parentId = rs.getInt("parent_id");
                int appointmentStatus = rs.getInt("appointmentStatus");
                //System.out.println(roleId);
                Slot s = new Slot(slotId, isExamination, slot_status, new SlotTime(slotTimeId, startTime, endTime),
                        new Shift(shiftId, date, new Schedule(scheduleId, doctorId, dayOfWeek, isMorningShift, status)));
                ChildrenProfile c = new ChildrenProfile(childrenId, childrenName, gender, dob, parentId, avatar);
                Appointment ap = new Appointment(appointmentId, c, s, appointmentStatus);
                list.add(ap);
            }
        } catch (Exception e) {
            status = "Error load Appointment for customer " + e.getMessage();
            System.out.println(status);
        }
        return list;
    }

    public List<Appointment> filterAppointmentByWeek(List<Appointment> appointments, int week_num) {
        LocalDate start_date = Utils.Utility.getFirstDayOfWeek(week_num);
        LocalDate end_date = Utils.Utility.getLastDayOfWeek(start_date);

        appointments.removeIf(a -> a.getSlot().getShift().getDate().compareTo(end_date) > 0
                || a.getSlot().getShift().getDate().compareTo(start_date) < 0);
        return appointments;
    }

    public List<Appointment> getAppointmentOfSlot(Slot slot) {
        list.clear();
        String sql = "select *\n"
                + "from Appointment\n"
                + "inner join Slot on slot.slot_id = Appointment.slot_id\n"
                + "inner join ChildrenProfile on ChildrenProfile.children_id = Appointment.children_id\n"
                + "inner join SlotTime on slot.slotTimeId = SlotTime.slotTimeId\n"
                + "inner join [shift]  on slot.shiftId = [shift].shiftId\n"
                + "inner join Schedule on  [shift].scheduleId = Schedule.scheduleId\n"
                + "where slot.slot_id = ";
        sql += slot.getSlotId() + "";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int appointmentId = rs.getInt("appointment_id");
                int childrenId = rs.getInt("children_id");
                String childrenName = rs.getString("name");
                LocalDate dob = rs.getDate("dob").toLocalDate();
                Boolean gender = rs.getBoolean("gender");
                String avatar = rs.getString("avatar");

                int slotId = rs.getInt("slot_id");
                int slotTimeId = rs.getInt("slotTimeId");
                Boolean isExamination = rs.getBoolean("isExamination");
                int slot_status = rs.getInt("status");
                int shiftId = rs.getInt("shiftId");
                LocalDate date = rs.getDate("date").toLocalDate();
                int scheduleId = rs.getInt("scheduleId");
                int doctorId = rs.getInt("doctorId");
                int dayOfWeek = rs.getInt("dayOfWeek");
                Boolean isMorningShift = rs.getBoolean("isMorningShift");
                boolean status = rs.getBoolean("status");
                String startTime = rs.getString("startTime");
                String endTime = rs.getString("endTime");
                int parentId = rs.getInt("parent_id");
                int appointmentStatus = rs.getInt("appointmentStatus");
                //System.out.println(roleId);
                Slot s = new Slot(slotId, isExamination, slot_status, new SlotTime(slotTimeId, startTime, endTime),
                        new Shift(shiftId, date, new Schedule(scheduleId, doctorId, dayOfWeek, isMorningShift, status)));
                ChildrenProfile c = new ChildrenProfile(childrenId, childrenName, gender, dob, parentId, avatar);
                Appointment ap = new Appointment(appointmentId, c, s, appointmentStatus);
                list.add(ap);
            }
        } catch (SQLException e) {
            status = "Error load Appointment for customer " + e.getMessage();
            System.out.println(status);
        }
        return list;
    }

    public List<Appointment> filterAppointmentBySlot(List<Appointment> appointments, int slotId) {
        appointments.removeIf(a -> a.getSlot().getSlotId() != slotId);
        return appointments;
    }

    public Appointment getAppointmentById(int appId) {
        String sql = "select *\n"
                + "from Appointment\n"
                + "inner join Slot on slot.slot_id = Appointment.slot_id\n"
                + "inner join ChildrenProfile on ChildrenProfile.children_id = Appointment.children_id\n"
                + "inner join SlotTime on slot.slotTimeId = SlotTime.slotTimeId\n"
                + "inner join [shift]  on slot.shiftId = [shift].shiftId\n"
                + "inner join Schedule on  [shift].scheduleId = Schedule.scheduleId\n"
                + "where Appointment.appointment_id = ";
        sql += appId + "";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int appointmentId = rs.getInt("appointment_id");
                int childrenId = rs.getInt("children_id");
                String childrenName = rs.getString("name");
                LocalDate dob = rs.getDate("dob").toLocalDate();
                Boolean gender = rs.getBoolean("gender");
                String avatar = rs.getString("avatar");

                int slotId = rs.getInt("slot_id");
                int slotTimeId = rs.getInt("slotTimeId");
                Boolean isExamination = rs.getBoolean("isExamination");
                int slot_status = rs.getInt("status");
                int shiftId = rs.getInt("shiftId");
                LocalDate date = rs.getDate("date").toLocalDate();
                int scheduleId = rs.getInt("scheduleId");
                int doctorId = rs.getInt("doctorId");
                int dayOfWeek = rs.getInt("dayOfWeek");
                Boolean isMorningShift = rs.getBoolean("isMorningShift");
                boolean status = rs.getBoolean("status");
                String startTime = rs.getString("startTime");
                String endTime = rs.getString("endTime");
                int parentId = rs.getInt("parent_id");
                int appointmentStatus = rs.getInt("appointmentStatus");
                //System.out.println(roleId);
                Slot s = new Slot(slotId, isExamination, slot_status, new SlotTime(slotTimeId, startTime, endTime),
                        new Shift(shiftId, date, new Schedule(scheduleId, doctorId, dayOfWeek, isMorningShift, status)));
                ChildrenProfile c = new ChildrenProfile(childrenId, childrenName, gender, dob, parentId, avatar);
                Appointment ap = new Appointment(appointmentId, c, s, appointmentStatus);
                return ap;
            }
        } catch (Exception e) {
            status = "Error load Appointment for customer " + e.getMessage();
            System.out.println(status);
        }
        return null;
    }
    @Override
    public void load() {
        list.clear();
        String sql = "select *\n"
                + "from Appointment\n"
                + "inner join Slot on slot.slot_id = Appointment.slot_id\n"
                + "inner join ChildrenProfile on ChildrenProfile.children_id = Appointment.children_id\n"
                + "inner join SlotTime on slot.slotTimeId = SlotTime.slotTimeId\n"
                + "inner join [shift]  on slot.shiftId = [shift].shiftId\n"
                + "inner join Schedule on  [shift].scheduleId = Schedule.scheduleId\n";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            UserDAO userDAO = new UserDAO();
            userDAO.load();
            DoctorProfileDAO doctorDAO = new DoctorProfileDAO();
            while (rs.next()) {
                int appointmentId = rs.getInt("appointment_id");
                int childrenId = rs.getInt("children_id");
                String childrenName = rs.getString("name");
                LocalDate dob = rs.getDate("dob").toLocalDate();
                Boolean gender = rs.getBoolean("gender");
                String avatar = rs.getString("avatar");

                int slotId = rs.getInt("slot_id");
                int slotTimeId = rs.getInt("slotTimeId");
                Boolean isExamination = rs.getBoolean("isExamination");
                int slot_status = rs.getInt("status");
                int shiftId = rs.getInt("shiftId");
                int doctorId = rs.getInt("doctorId");
                LocalDate date = rs.getDate("date").toLocalDate();
                int scheduleId = rs.getInt("scheduleId");
                int dayOfWeek = rs.getInt("dayOfWeek");
                Boolean isMorningShift = rs.getBoolean("isMorningShift");
                boolean status = rs.getBoolean("status");
                String startTime = rs.getString("startTime");
                String endTime = rs.getString("endTime");
                int parentId = rs.getInt("parent_id");
                int appointmentStatus = rs.getInt("appointmentStatus");
                //System.out.println(roleId);
                Slot s = new Slot(slotId, isExamination, slot_status, new SlotTime(slotTimeId, startTime, endTime),
                        new Shift(shiftId, date, new Schedule(scheduleId, doctorId, dayOfWeek, isMorningShift, status, doctorDAO.getDoctorByID(doctorId))));
                ChildrenProfile c = new ChildrenProfile(childrenId, childrenName, gender, dob, parentId, avatar, userDAO.get(parentId));
                Appointment ap = new Appointment(appointmentId, c, s, appointmentStatus);
                list.add(ap);
            }
        } catch (SQLException e) {
            status = "Error load Appointment for customer " + e.getMessage();
            System.out.println(status);
        }
    }

    @Override
    public void add(Appointment t) {
        String sql = "insert into Appointment(slot_id, children_id, appointmentStatus) values(?,?,?)";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, t.getSlot().getSlotId());
            ps.setInt(2, t.getChild().getChildrenId());
            ps.setInt(3, t.getStatus());
            ps.execute();
        } catch (SQLException e) {
            status = "Error add appointment " + e.getMessage();
            System.out.println(status);
        }
    }

    @Override
    public void update(Appointment t) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public void delete(Appointment t) {
        String sql = "delete from Appointment where appointment_id=?";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, t.getAppointmentId());
            ps.execute();
        } catch (SQLException e) {
            status = "Error delete Appointment " + e.getMessage();
            System.out.println(status);
        }
    }

    public void updateStatus(int appointmentId, int newStatus) {
        String sql = "update appointment set appointmentStatus=" + newStatus + " where appointment_id=" + appointmentId;
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.execute();
        } catch (SQLException e) {
            status = "error update status of appointment: " + e.getMessage();
            System.out.println(status);
        }
    }

    public static void main(String[] args) {
        AppointmentDAO dao = new AppointmentDAO();
        for (Appointment app : dao.getAppointmentOfDoctor(14)) {
            System.out.println(app.getStatus());
        }
    }

    public List<Appointment> filterAppointmentExtended(String customer_name, String child_name, String doctor_name, String phone_email, int depId, int appStatus) {
        List<Appointment> appointments = new ArrayList<>();
        if (appStatus != -1) {
                list.removeIf(a -> a.getStatus() != appStatus);
            }
            if (depId != -1) {
                list.removeIf(a -> a.getSlot().getShift().getSchedule().getDoctor().getDepartmentId() != depId);
            }
        for (Appointment appointment : list) {
            if (appointment.getChild().getName().toLowerCase().contains(child_name.toLowerCase())
                    && appointment.getChild().getParent().getName().toLowerCase().contains(customer_name.toLowerCase())
                    && appointment.getSlot().getShift().getSchedule().getDoctor().getUser().getName().toLowerCase().contains(doctor_name.toLowerCase())
                    && (appointment.getChild().getParent().getPhoneNumber().contains(phone_email)
                    || appointment.getChild().getParent().getEmail().contains(phone_email))) {
                appointments.add(appointment);
            }
        }
        return appointments;
    }
    
    public List<Appointment> getAppointmentsByPage(PageInfo page, List<Appointment> fullList) {
        List<Appointment> appointments = new ArrayList<>();
        if (fullList.isEmpty()) {
            return appointments;
        }
        int maxIndex = page.getPageindex() * page.getPagesize();
        maxIndex = (maxIndex > fullList.size()) ? fullList.size() : maxIndex;
        for (int i = (page.getPageindex() - 1) * page.getPagesize(); i < maxIndex; i++) {
            appointments.add(fullList.get(i));
        }
        return appointments;
    }
}
