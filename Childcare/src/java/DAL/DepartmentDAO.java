/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;

import Models.Department;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

/**
 * @author Misaki
 */
public class DepartmentDAO {

    private List<Department> list;
    private Connection con;
    private String status;
    private HashMap<Integer, Department> departments;

    public DepartmentDAO() {
        list = new ArrayList<Department>();
        departments = new HashMap<>();
        try {
            con = DBContext.getConnection();
        } catch (Exception e) {
            status = "Error connection at Department dao" + e.getMessage();
        }
        load();
    }

    public Department get(int id) {
        for (Department d : list) {
            if (d.getDepartmentId() == id) {
                return d;
            }
        }
        return null;
    }

    public HashMap<Integer, Department> getAllHashMap() {
        return departments;
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
                int departmentId = rs.getInt("department_id");
                department.setDepartmentId(departmentId);
                department.setDepartmentName(rs.getString("department_name"));
//                String image = rs.getString("image");
//                departments.put(departmentId, new Department(departmentId, departmentName, image));
                departments.put(departmentId, department);
            }
        } catch (Exception e) {
            status = "Error Load Department " + e.getMessage();
            System.out.println(status);
        }
    }

    public void add(Department t) {
        String sql = "insert into Department (department_name, image) values(?,?)";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, t.getDepartmentName());
            ps.setString(2, t.getImage());
            ps.execute();
        } catch (Exception e) {
            status = "Error Add Department" + e.getMessage();
            System.out.println(status);
        }
    }

    public void update(Department t) {
        String sql = "Update department set department_name=?, image=? where department_id=?";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, t.getDepartmentName());
            ps.setString(2, t.getImage());
            ps.setInt(3, t.getDepartmentId());
            ps.execute();
        } catch (Exception e) {
            status = "Error update Department" + e.getMessage();
            System.out.println(status);
        }
    }

    public void delete(Department t) {
        String sql = "delete from Department where department_id=?";
        //System.out.println(sql);
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, t.getDepartmentId());
            ps.execute();
        } catch (Exception e) {
            status = "Error delete Department " + e.getMessage();
            System.out.println(status);
        }
    }

}
