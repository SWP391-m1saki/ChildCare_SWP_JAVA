/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;

import Models.*;
import java.sql.Date;
import java.util.List;
import java.util.Map;

/**
 *
 * @author Admin
 */
public class testData {

    public static void main(String[] args) {
      DoctorProfileDAO dao = new DoctorProfileDAO();
      List<DoctorProfile> d  = dao.getAll();
      for(DoctorProfile de : d){
        System.out.println(de.toString());  
      }
        
     
       
        //System.out.println(pdao.get(10));
    }
    
}
