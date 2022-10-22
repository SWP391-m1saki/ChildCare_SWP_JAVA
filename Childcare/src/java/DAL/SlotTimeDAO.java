package DAL;

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
public class SlotTimeDAO implements DAO<SlotTime>
{

    private List<SlotTime> list;
    private Connection con;
    private String status;

    public void setList(List<SlotTime> list) {
        this.list = list;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
    
    public SlotTimeDAO(){
        list = new ArrayList<SlotTime>();
    }
    @Override
    public List<SlotTime> getAll() {
        return list;
    }

    @Override
    public SlotTime get(int id) {
        for(SlotTime s: list){
            if(s.getSlotTimeId() == id) return s;
        }
        return null;
    }

    @Override
    public void load() {
        list.clear();
        String sql = "select * from SlotTime";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int slotTimeId = rs.getInt("slotTimeId");
                String startTime = rs.getString("startTime");
                String endTime = rs.getString("endTime");
                
                list.add(new SlotTime(slotTimeId, startTime, endTime));
            }
        } catch (Exception e) {
            status = "Error Load SlotTime " + e.getMessage();
            System.out.println(status);
        }
    }

    @Override
    public void add(SlotTime t) {
        String sql = "insert into SlotTime (slotTimeId, startTime, endTime) values(?,?,?)";
        try{
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, t.getSlotTimeId());
            ps.setString(2, t.getStartTime());
            ps.setString(3, t.getEndTime());
            
            ps.execute();
        }  catch(Exception e){
            status = "Error Add slotTime" + e.getMessage();
        }     
    }

    @Override
    public void update(SlotTime t) {
        String sql = "Update SlotTime set startTime=?, endTime=? where slotTimeId=?";
        try{
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, t.getStartTime());
            ps.setString(2, t.getEndTime());
            ps.setInt(3, t.getSlotTimeId());
            
            ps.execute();
        }catch(Exception e){
            status = "Error update SlotTime " + e.getMessage();
            System.out.println(status);
        }
    }

    @Override
    public void delete(SlotTime t) {
        String sql = "delete from SlotTime where slotTimeId=?";
        try{
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, t.getSlotTimeId());
        }catch(Exception e){
            status = "Error delete SlotTime " + e.getMessage();
            System.out.println(status);
        }
    }
    
}
