/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;

import Models.*;
import java.sql.Date;
import java.time.LocalDate;
import java.util.Map;

/**
 *
 * @author Admin
 */
public class testData {

    public static void main(String[] args) {
        UserDAO userdao = new UserDAO();
      DoctorProfileDAO dao = new DoctorProfileDAO();
      
//      DoctorProfile d = new DoctorProfile(14, "KonoHoho", "KonoShiaba", Utils.Utility.parseDoubleParameter("30000", 0),2, "Tiến sĩ",null);
//     dao.update(d);
     dao.load();
     for(DoctorProfile d : dao.getAll()){
         System.out.println(d);
     }
     for(int i = 1; i < 3; i++){
         userdao.add(new User(0, "hoangtrungkien" + i + "@gmail.com", "123456789", "Hoàng Trung Kiên ", true, LocalDate.now(), 1, "0123456789", "Hà Nội, Việt Nam", "team-2.jpg", 1));
     }
        //System.out.println(pdao.get(10));
    }
    
}
