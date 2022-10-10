/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;

import Models.DoctorProfile;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author ADMIN
 */
//Chua xong
public class DoctorProfileDAO implements DAO<DoctorProfile>{
    
    private String status;
    private Connection con;
    private List<DoctorProfile> doctorProfileList;

    public DoctorProfileDAO() {
         try {
            con = DBContext.getConnection();
        } catch (Exception e) {
            status = "Error connection" + e.getMessage();
        }
        doctorProfileList= new ArrayList<DoctorProfile>();
        load();
    }
    
    
    
    @Override
    public List<DoctorProfile> getAll() {
        return  doctorProfileList;
    }

    @Override
    public DoctorProfile get(int id) {
        for (DoctorProfile doctorProfile : doctorProfileList) {
            if (doctorProfile.getDoctorId()== id) {
                return doctorProfile;
            }
        }
        return null;
    }

    @Override
    public void load() {
        String sql = "select * from DoctorProfile";
        String sql2 = "select * from User where ";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                DoctorProfile docProfile = new DoctorProfile();
                docProfile.setDoctorId(rs.getInt("doctor_id"));
                docProfile.setPrice(rs.getDouble("price"));
                docProfile.setQualification(rs.getString("qualification"));
                docProfile.setDescription(rs.getString("description"));
                docProfile.setTitle(rs.getString("title"));
                docProfile.setDepartmentId(rs.getInt("department_id"));
//                PreparedStatement ps2 = con.prepareStatement(sql)
//                postCategoryList.add(pC);
            }
        } catch (Exception e) {
            status = "Error connection" + e.getMessage();
        }
    }

    @Override
    public void add(DoctorProfile t) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void update(DoctorProfile t) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void delete(DoctorProfile t) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }
    
}
