/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;

import Models.Department;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

/**
 *
 * @author ADMIN
 */
public class DepartmentDAO{

    private String status;
    private Connection con;
    
    private HashMap<Integer, Department> departments;

    public DepartmentDAO() {
         try {
            con = DBContext.getConnection();
        } catch (Exception e) {
            status = "Error connection" + e.getMessage();
        }
        departments = new HashMap<>();
        load();
    }
    
    public HashMap<Integer,Department> getAllHasMap() {
        return departments;
    }
    
    //@Override
    public HashMap<Integer,Department> getAll() {
        return departments;
    }

    //@Override
    public Department get(int id) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    //@Override
    public void load() {
        departments.clear();
        String sql = "SELECT * FROM Department";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Department department = new Department();
                department.setDepartmentName(rs.getString("department_name"));
                int departmentId = rs.getInt("department_id");
                departments.put(departmentId, department);
            }
        } catch (SQLException e) {
            status = "Error connection" + e.getMessage();
        }
    }

    //@Override
    public void add(Department t) {
        String sql = "Insert into Department values(?)";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, t.getDepartmentName());
            ps.executeUpdate();

            //load list again
            load();
        } catch (SQLException e) {
            status = "Error at insert Department" + e.getMessage();
        }
    }

    //@Override
    public void update(Department t) {
        String sql = "update Department set department_name = ? where department_id = ?";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, t.getDepartmentName());
            ps.setInt(2, t.getDepartmentId());
            
            ps.executeUpdate();
            load();
        } catch (SQLException e) {
            System.out.println("UPdate that bai!");
            status = "Error at Update Department" + e.getMessage();
        }
    }

    //@Override
    public void delete(Department t) {
        String sql = "delete from Department where department_id = ?";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, t.getDepartmentId());
            ps.executeUpdate();
            load();
        } catch (SQLException e) {
            status = "Error at Delete Department" + e.getMessage();
        }
    }
}
