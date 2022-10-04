/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAL;

import Models.User;
import static java.lang.System.in;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Admin
 */
public class UserDAO implements DAO<User>{

    private List<User> list;
    private Connection con;
    private String status;

    public void setList(List<User> list) {
        this.list = list;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
    
    
    @Override
    public List<User> getAll() {
        return list;
    }

    @Override
    public User get(int id) {
        for(User u : list){
            if(u.getId() == id) return u;
        }
        return null;
    }

    @Override
    public void load() {
        List<User> list = new ArrayList<User>();
        String sql = "select * from User";
        try{
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                int id = rs.getInt(1);
                String username = rs.getString(2);
                String password = rs.getString(3);
                String gmail = rs.getString(4);
                String phone = rs.getString(5);
                int roleId = rs.getInt(6);
                Date dob = rs.getDate(7);
                String name = rs.getString(8);
                String address = rs.getString(9);
                String avatar = rs.getString(10);
                int status = rs.getInt(11);
                boolean gender = rs.getBoolean(12);
                list.add(new User(id, username, password, gmail, phone, roleId, dob.toLocalDate(), name, address, avatar, status, gender));
            } 
        }
        catch(Exception e){
            status = "Error getAll student " + e.getMessage();
        }
    }

    public User ValidateLogin(String username, String password){
        for(User u: list){
            if(u.getUsername().equals(username) && u.getPassword().equals(password))
                return u;
        }
        return null;
    }
    @Override
    public void add(User t) {
        String sql = "insert into User values(?,?,?,?,?,?,?,?,?,?,?)";
        try{
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1,t.getUsername());
            ps.setString(2, t.getPassword());
            ps.setString(3, t.getGmail());
            ps.setString(4, t.getPhoneNumber());
            ps.setInt(5, t.getRoleId());
            
            java.sql.Date date = java.sql.Date.valueOf(t.getDob());
            ps.setDate(6, date);
            ps.setString(7, t.getName());
            ps.setString(8, t.getAddress());
            ps.setString(9, t.getAvatar());
            ps.setInt(10, t.getStatus());
            ps.setBoolean(11, t.isGender());
            ps.execute();
        } 
        catch (SQLException ex) {
            status = "Error add user " + ex.getMessage();
        }
        
    }

    @Override
    public void update(User t) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public void delete(User t) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
    
}
