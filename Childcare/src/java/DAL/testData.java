/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;

import Models.*;
import java.sql.Date;
import java.util.Map;

/**
 *
 * @author Admin
 */
public class testData {

    public static void main(String[] args) {
      DoctorProfileDAO dao = new DoctorProfileDAO();
      DoctorProfile d = new DoctorProfile(14, "KonoHoho", "KonoShiaba", Utils.Utility.parseDoubleParameter("30000", 0),2, "Tiến sĩ",null);
     dao.update(d);
     
       
        //System.out.println(pdao.get(10));
    }
    
}
