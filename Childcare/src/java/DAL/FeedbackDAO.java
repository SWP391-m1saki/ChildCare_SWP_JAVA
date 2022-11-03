package DAL;

import Models.Feedback;
import Models.Post;
import java.sql.Connection;
import java.sql.Date;
import java.util.List;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class FeedbackDAO implements DAO<Feedback> {

    private String status;
    private Connection con;
    private final List<Feedback> feedbackList;

    public FeedbackDAO() {
        try {
            con = DBContext.getConnection();
        } catch (Exception e) {
            status = "Error connection" + e.getMessage();
        }
        feedbackList = new ArrayList<Feedback>();
        load();
    }

    @Override
    public List<Feedback> getAll() {
        return feedbackList;
    }

    @Override
    public Feedback get(int id) {
        for (Feedback feedback : feedbackList) {
            if (feedback.getFeedbackId() == id) {
                return feedback;
            }
        }
        return null;
    }

    public List<Feedback> getByDoctorId(int id) {
        List<Feedback> fb = new ArrayList<Feedback>(); 
        for (Feedback feedback : feedbackList) {
            if (feedback.getDoctorId()== id) {
                fb.add(feedback);
            }
        }
        return fb;
    }

    UserDAO dao = new UserDAO();

    @Override
    public void load() {
        feedbackList.clear();
        dao.load();
        String sql = "select feedback_id,discription,doctor_id,customer_id,created_at from Feedback";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Feedback p = new Feedback();
                p.setFeedbackId(rs.getInt("feedback_id"));
                p.setDescription(rs.getString("discription"));
                p.setDoctorId(rs.getInt("doctor_id"));
                p.setCustomerId(rs.getInt("customer_id"));
                p.setCreatedAt(rs.getDate("created_at"));
                p.setUser(dao.get(rs.getInt("customer_id")));
                feedbackList.add(p);
            }
        } catch (Exception e) {
            status = "Error connection" + e.getMessage();
        }
    }

    public static void main(String[] args) {
        FeedbackDAO dao = new FeedbackDAO();
        dao.load();
        for (Feedback f : dao.getAll()) {
            System.out.println(f.toString());
        }
    }

    @Override
    public void add(Feedback t) {
        String sql = "Insert into Feedback(discription,doctor_id, customer_id, created_at) values(?,?,?,?)";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, t.getDescription());
            ps.setInt(2, t.getDoctorId());
            ps.setInt(3, t.getCustomerId());
            ps.setDate(4, t.getCreatedAt());
            ps.executeUpdate();
            //load list again
            load();
        } catch (SQLException e) {
            status = "Error at insert Post" + e.getMessage();
        }
    }

    @Override
    public void update(Feedback t) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void delete(Feedback t) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

}
