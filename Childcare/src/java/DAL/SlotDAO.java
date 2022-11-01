package DAL;

import Models.Slot;

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
                int slot_status = rs.getInt("status");
                int shiftId = rs.getInt("shiftId");
                //System.out.println(roleId);
                Slot s = new Slot(slotId, isExamination, slot_status, slotTimeId, shiftId);
                list.add(s);
            }
        } catch (SQLException e) {
            status = "Error Load Slot " + e.getMessage();
            System.out.println(status);
        }
    }

    @Override
    public void add(Slot t) {
        String sql = "insert into Slot (date, slotTimeId, isExamination, status, shiftId) values(?,?,?,?,?)";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
//            ps.setDate(1, java.sql.Date.valueOf(t.getDate()));
            ps.setInt(2, t.getSlotTimeId());
            ps.setBoolean(3, t.isIsExamination());
            ps.setInt(4, t.getStatus());
            ps.setInt(5, t.getShiftId());

            ps.execute();
        } catch (SQLException e) {
            status = "Error Add slot" + e.getMessage();
        }
    }

    @Override
    public void update(Slot t) {
        String sql = "Update slot set date=?, slotTimeId=?, isExamination=?, status=?, shiftId=? where slot_id=?";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
//            ps.setDate(1, java.sql.Date.valueOf(t.getDate()));
            ps.setInt(2, t.getSlotTimeId());
            ps.setBoolean(3, t.isIsExamination());
            ps.setInt(4, t.getStatus());
            ps.setInt(5, t.getShiftId());
            ps.setInt(6, t.getSlotId());

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

//    public int getNumOfWorkDoctorOfShift(List<Slot> slots, int dayOfWeek, boolean isMorningShift) {
//        int countDoctor = 0;
//        for (Slot slot : slots) {
//            if (slot.getDate().getDayOfWeek().getValue() == dayOfWeek) {
//                if (isMorningShift == slot.isMorningShift()) {
//                    countDoctor++;
//                }
//            }
//        }
//        return countDoctor;
//    }


}
