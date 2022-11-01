/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;

import Models.ChangeRequest;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 *
 * @author ADMIN
 */
public class ChangeRequestDAO implements DAO<ChangeRequest> {

    private String status;
    private Connection con;
    private List<ChangeRequest> changeRequestList;

    public ChangeRequestDAO() {
        try {
            con = DBContext.getConnection();
        } catch (Exception e) {
            status = "Error connection" + e.getMessage();
        }
        changeRequestList = new ArrayList<ChangeRequest>();
        load();
    }

    @Override
    public List<ChangeRequest> getAll() {
        return changeRequestList;
    }

    @Override
    public ChangeRequest get(int id) {
        for (ChangeRequest changeRequest : changeRequestList) {
            if (changeRequest.getRequestId() == id) {
                return changeRequest;
            }
        }
        return null;
    }

    @Override
    public void load() {
        changeRequestList.clear();
        String sql = "select * from ChangeRequest";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                ChangeRequest cR = new ChangeRequest();
                cR.setRequestId(rs.getInt("request_id"));
                cR.setDescription(rs.getNString("description"));
                cR.setRequestTime(rs.getDate("request_time"));
                cR.setStatus(rs.getInt("status"));
                cR.setDoctorId(rs.getInt("doctor_id"));
                cR.setReponseTime(rs.getDate("reponse_time"));
                cR.setReponseDescription(rs.getString("reponse_description"));
                changeRequestList.add(cR);
            }
        } catch (Exception e) {
            status = "Error connection" + e.getMessage();
        }
    }

    @Override
    public void add(ChangeRequest cR) {
        String sql = "Insert into ChangeRequest values(?,?,?,?)";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, cR.getDescription());
            ps.setDate(2, cR.getRequestTime());
            ps.setInt(3, cR.getStatus());
            ps.setInt(4, cR.getDoctorId());
            ps.execute();
        } catch (Exception e) {
            status = "Error at insert changeRequest" + e.getMessage();
        }
    }

    @Override
    public void update(ChangeRequest t) {
        String sql = "update ChangeRequest set reponse_time = ?, reponse_description = ?, [status] = ? where request_id = ?";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setDate(1, t.getReponseTime());
            ps.setString(2, t.getReponseDescription());
            ps.setInt(3, t.getStatus());
            ps.setInt(4, t.getRequestId());
            ps.executeUpdate();
            System.out.println("UPdate ok!");

            load();
        } catch (SQLException e) {
            System.out.println("UPdate that bai!");
            status = "Error at Update Post" + e.getMessage();
        }
    }

    @Override
    public void delete(ChangeRequest t) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    public List<ChangeRequest> getChangeRequestListByDoctorID(int doctorId) {
        List<ChangeRequest> cR = new ArrayList<>();
        for (ChangeRequest c : changeRequestList) {
            if (c.getDoctorId() == doctorId) {
                cR.add(c);
            }
        }
        return cR;
    }
}
