package DAL;

import Models.Appointment;
import Models.ChildrenProfile;
import Models.Schedule;
import Models.Shift;
import Models.Slot;
import Models.SlotTime;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
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
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public Appointment get(int id) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    public List<Appointment> getAppointmentOfCustomer(int customerId) {
        list.clear();
//        String sql = "select Appointment.appointment_id, \n"
//                + "Slot.slot_id, slot.slotTimeId, slot.isExamination, slot.status, slot.shiftId,\n"
//                + "ChildrenProfile.children_id, ChildrenProfile.name, ChildrenProfile.dob, ChildrenProfile.gender, ChildrenProfile.avatar\n"
//                + "from Appointment\n"
//                + "inner join Slot on slot.slot_id = Appointment.slot_id\n"
//                + "inner join ChildrenProfile on ChildrenProfile.children_id = Appointment.children_id\n"
//                + "where ChildrenProfile.parent_id = ";
//        sql += customerId+"";
        String sql = "select *\n"
                + "from Appointment\n"
                + "inner join Slot on slot.slot_id = Appointment.slot_id\n"
                + "inner join ChildrenProfile on ChildrenProfile.children_id = Appointment.children_id\n"
                + "inner join SlotTime on slot.slotTimeId = SlotTime.slotTimeId\n"
                + "inner join [shift]  on slot.shiftId = [shift].shiftId\n"
                + "inner join Schedule on  [shift].scheduleId = Schedule.scheduleId\n"
                + "where ChildrenProfile.parent_id = ";
        sql += customerId+"";
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
                //System.out.println(roleId);
                Slot s = new Slot(slotId, isExamination, slot_status, new SlotTime(slotTimeId, startTime, endTime), 
                        new Shift(shiftId, date, new Schedule(scheduleId, doctorId, dayOfWeek, isMorningShift, status)));
                ChildrenProfile c = new ChildrenProfile(childrenId, childrenName, gender, dob, customerId, avatar);
                Appointment ap = new Appointment(appointmentId, c, s);
                list.add(ap);
            }
        } catch (Exception e) {
            status = "Error load Appointment for customer " + e.getMessage();
            System.out.println(status);
        }
        return list;
    }

    @Override
    public void load() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public void add(Appointment t) {
        String sql = "insert into Appointment(slot_id, children_id) values(?,?)";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, t.getSlot().getSlotId());
            ps.setInt(2, t.getChild().getChildrenId());
            ps.execute();
        } catch (Exception e) {
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
        } catch (Exception e) {
            status = "Error delete Appointment " + e.getMessage();
            System.out.println(status);
        }
    }

    public static void main(String[] args) {

    }
}
