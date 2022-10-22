package DAL;

import Models.ChildrenProfile;
import Models.Slot;
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
public class SlotDAO implements DAO<Slot>
{

    private List<Slot> list;
    private Connection con;
    private String status;

    public void setList(List<Slot> list) {
        this.list = list;
    }

    public Connection getCon() {
        return con;
    }

    public void setCon(Connection con) {
        this.con = con;
    }
    
    public SlotDAO(){
        list = new ArrayList<Slot>();
    }
    @Override
    public List getAll() {
        return list;
    }

    @Override
    public Slot get(int id) {
        for(Slot s: list){
            if(s.getSlotId() == id) return s;
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
        } catch (Exception e) {
            status = "Error Load Slot " + e.getMessage();
            System.out.println(status);
        }
    }

    @Override
    public void add(Slot t) {
        String sql = "insert into Slot (date, slotTimeId, isExamination, status, scheduleId) values(?,?,?,?,?)";
        try{
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setDate(1, java.sql.Date.valueOf(t.getDate()));
            ps.setInt(2, t.getSlotTimeId());
            ps.setBoolean(3,t.isIsExamination());
            ps.setInt(4, t.getStatus());
            ps.setInt(5, t.getScheduleId());
            
            ps.execute();
        }  catch(Exception e){
            status = "Error Add slot" + e.getMessage();
        }     
    }

    @Override
    public void update(Slot t) {
        String sql = "Update slot set date=?, slotTimeId=?, isExamination=?, status=?, scheduleId=? where slot_id=?";
        try{
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setDate(1, java.sql.Date.valueOf(t.getDate()));
            ps.setInt(2, t.getSlotTimeId());
            ps.setBoolean(3,t.isIsExamination());
            ps.setInt(4, t.getStatus());
            ps.setInt(5, t.getScheduleId());
            ps.setInt(6, t.getSlotId());
            
            ps.execute();
        }catch(Exception e){
            status = "Error update Slot " + e.getMessage();
            System.out.println(status);
        }
    }

    

    @Override
    public void delete(Slot t) {
        String sql = "delete from Slot where slot_id=?";
        try{
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, t.getSlotId());
        }catch(Exception e){
            status = "Error delete Slot " + e.getMessage();
            System.out.println(status);
        }
    }
    
}
