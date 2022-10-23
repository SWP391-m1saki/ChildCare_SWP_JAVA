package DAL;

import Models.Schedule;
import Models.SlotTime;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Misaki
 */
public class ScheduleDAO implements DAO<Schedule>
{

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
    
    public ScheduleDAO(){
        list = new ArrayList<Schedule>();
        try {
            con = new DBContext().getConnection();
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
        for(Schedule s:list){
            if(s.getScheduleId() == id) return s;
        }
        return null;
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
                String dayOfWeek = rs.getString("dayOfWeek");
                Boolean isMorningShift = rs.getBoolean("isMorningShift");
                
                list.add(new Schedule(scheduleId, doctorId, dayOfWeek, isMorningShift));
            }
        } catch (Exception e) {
            status = "Error Load Schedule " + e.getMessage();
            System.out.println(status);
        }
    }

    @Override
    public void add(Schedule t) {
        String sql = "insert into Schedule (doctorId, dayOfWeek, isMorningShift) values(?,?,?)";
        try{
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, t.getDoctorId());
            ps.setString(2, t.getDayOfWeek());
            ps.setBoolean(3, t.getIsMorningShift());
            
            ps.execute();
        }  catch(Exception e){
            status = "Error Add Schedule" + e.getMessage();
            System.out.println(status);
        }     
    }

    @Override
    public void update(Schedule t) {
        String sql = "Update Schedule set doctorId=?, dayOfWeek=?, isMorningShift=? where scheduleId=?";
        try{
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, t.getDoctorId());
            ps.setString(2, t.getDayOfWeek());
            ps.setBoolean(3, t.getIsMorningShift());
            ps.setInt(4, t.getScheduleId());
            
            ps.execute();
        }catch(Exception e){
            status = "Error update Schedule " + e.getMessage();
            System.out.println(status);
        }
    }

    @Override
    public void delete(Schedule t) {
        String sql = "delete from Schedule where scheduleId=?";
        try{
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, t.getScheduleId());
            ps.execute();
        }catch(Exception e){
            status = "Error delete Schedule " + e.getMessage();
            System.out.println(status);
        }
    }
    
}
