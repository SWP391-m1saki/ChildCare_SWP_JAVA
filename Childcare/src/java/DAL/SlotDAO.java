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

    public Slot getByShift(int shiftId, int slotTimeId){
        for(Slot s: list){
            if(s.getShiftId() == shiftId && s.getSlotTimeId() == slotTimeId) return s;
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
            //System.out.println("Helloooooo");
        }
    }

    @Override
    public void add(Slot t) {
        String sql = "insert into Slot (slotTimeId, isExamination, status, shiftId) values(?,?,?,?)";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
//            ps.setDate(1, java.sql.Date.valueOf(t.getDate()));
            ps.setInt(1, t.getSlotTimeId());
            ps.setBoolean(2, t.isIsExamination());
            ps.setInt(3, t.getStatus());
            ps.setInt(4, t.getShiftId());

            ps.execute();
        } catch (SQLException e) {
            status = "Error Add slot" + e.getMessage();
            System.out.println(status);
        }
    }

    @Override
    public void update(Slot t) {
        String sql = "Update slot set slotTimeId=?, isExamination=?, status=?, shiftId=? where slot_id=?";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
//            ps.setDate(1, java.sql.Date.valueOf(t.getDate()));
            ps.setInt(1, t.getSlotTimeId());
            ps.setBoolean(2, t.isIsExamination());
            ps.setInt(3, t.getStatus());
            ps.setInt(4, t.getShiftId());
            ps.setInt(5, t.getSlotId());

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

//    public static void main(String[] args) {
//           SlotDAO dao = new SlotDAO();
//           dao.load();
//           for(Slot s: dao.getAll()){
//               System.out.println(s.getSlotId() + " " + s.getSlotTimeId());
//           }
//    }
}
