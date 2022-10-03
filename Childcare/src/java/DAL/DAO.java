
package DAL;

import Models.User;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

/**
 *
 * @author Misaki
 */
public class DAO {
    private ArrayList<User> uList;
    private String status;
    private Connection con;

    public ArrayList<User> getuList() {
        return uList;
    }

    public void setuList(ArrayList<User> uList) {
        this.uList = uList;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
    
    public DAO(){
        try{
            con = new DBContext().getConnection();
        } catch(Exception e){
            status = "Error connection at DAO " + e.getMessage();
        }
    }
    
    public void loadUser(){
        uList = new ArrayList<User>();
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
            } 
        }
        catch(Exception e){
            
        }
    }
}
