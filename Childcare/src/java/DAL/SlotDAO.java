package DAL;

import Models.*;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

/**
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

    public Slot getByShift(int shiftId, int slotTimeId) {
        for (Slot s : list) {
            if (s.getShift().getShiftId() == shiftId && s.getSlotTime().getSlotTimeId() == slotTimeId) {
                return s;
            }
        }
        return null;
    }

    public List<Slot> getSlotsByShiftID(int shiftId) {
        List<Slot> slots = new ArrayList<>();
        for (Slot s : list) {
            if (s.getShift().getShiftId() == shiftId) {
                slots.add(s);
            }
        }
        return slots;
    }

    @Override

    public void load() {
        list.clear();
        String sql = "select *\n"
                + "from slot\n"
                + "inner join [shift] on slot.shiftId = [shift].shiftId\n"
                + "inner join SlotTime on slot.slotTimeId = SlotTime.slotTimeId\n"
                + "inner join Schedule on [shift].scheduleId = Schedule.scheduleId";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
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
                list.add(s);
            }
        } catch (SQLException e) {
            status = "Error Load Slot " + e.getMessage();
            System.out.println(status);
        }
    }

    public void add(int slotTimeId, boolean isExamination, int statuss, int shiftId) {
        String sql = "insert into Slot (slotTimeId, isExamination, status, shiftId) values(?,?,?,?)";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
//            ps.setDate(1, java.sql.Date.valueOf(t.getDate()));
            ps.setInt(1, slotTimeId);
            ps.setBoolean(2, isExamination);
            ps.setInt(3, statuss);
            ps.setInt(4, shiftId);

            ps.execute();
        } catch (SQLException e) {
            status = "Error Add slot" + e.getMessage();
            System.out.println(status);
        }
    }

    public void update(int slotId, int slotTimeId, boolean isExamination, int statuss, int shiftId) {
        String sql = "Update slot set slotTimeId=?, isExamination=?, status=?, shiftId=? where slot_id=?";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
//            ps.setDate(1, java.sql.Date.valueOf(t.getDate()));
            ps.setInt(1, slotTimeId);
            ps.setBoolean(2, isExamination);
            ps.setInt(3, statuss);
            ps.setInt(4, shiftId);
            ps.setInt(5, slotId);

            ps.execute();
        } catch (SQLException e) {
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

    
    @Override
    public void add(Slot t) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public void update(Slot t) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    public void updateStatus(int slotId, int i) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }
}
