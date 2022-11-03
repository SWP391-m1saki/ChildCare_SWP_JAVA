/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;

import Models.ChangeRequest;
import Models.DoctorProfile;
import Models.PageInfo;
import Models.User;
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
        String sql = "select c.*, title, avatar, name from ChangeRequest c\n"
                + "inner join DoctorProfile d on c.doctor_id = d.doctor_id\n"
                + "inner join [User] u on u.id = d.doctor_id\n"
                + "order by request_time desc";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                ChangeRequest cR = new ChangeRequest();
                User us = new User();
                us.setName(rs.getString("name"));
                us.setAvatar(rs.getString("avatar"));
                DoctorProfile doctor = new DoctorProfile();
                doctor.setTitle(rs.getString("title"));
                doctor.setUser(us);
                cR.setDoctor(doctor);
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

    public List<ChangeRequest> getChangeRequestListByStatus(int status, int doctorId) {
        if (status == -1) {
            return getChangeRequestListByDoctorID(doctorId);
        }
        List<ChangeRequest> cR = new ArrayList<>();
        for (ChangeRequest c : changeRequestList) {
            if (c.getStatus() == status && c.getDoctorId() == doctorId) {
                cR.add(c);
            }
        }
        return cR;
    }

    public List<ChangeRequest> getChangeRequestListByStatusAndSearch(int status, String search) {
        if (status == -1) {
            if (search == null || search.length() == 0) {
                return getAll();
            } else {
                List<ChangeRequest> cR = new ArrayList<>();
                for (ChangeRequest c : changeRequestList) {
                    if (c.getDoctor().getUser().getName().toLowerCase().contains(search.toLowerCase())) {
                        cR.add(c);
                    }
                }
                return cR;
            }
        }
        search = search == null ? "" : search;
        List<ChangeRequest> cR = new ArrayList<>();
        for (ChangeRequest c : changeRequestList) {
            if (c.getStatus() == status && c.getDoctor().getUser().getName().toLowerCase().contains(search.toLowerCase())) {
                cR.add(c);
            }
        }
        return cR;
    }

    public List<ChangeRequest> getChangeRequestByPage(PageInfo page, List<ChangeRequest> fullList) {
        List<ChangeRequest> cR = new ArrayList<>();
        if (fullList.isEmpty()) {
            return cR;
        }
        int maxIndex = page.getPageindex() * page.getPagesize();
        maxIndex = (maxIndex > fullList.size()) ? fullList.size() : maxIndex;
        for (int i = (page.getPageindex() - 1) * page.getPagesize(); i < maxIndex; i++) {
            cR.add(fullList.get(i));
        }
        return cR;
    }
}
