/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;

import Models.*;
import java.sql.Date;
import java.time.LocalDate;
import java.util.List;
import java.util.Map;

/**
 *
 * @author Admin
 */
@SuppressWarnings("WriteOnlyObject")
public class testData {

    public static void main(String[] args) {
       ChangeRequestDAO cr = new ChangeRequestDAO();
       cr.load();
       List<ChangeRequest> cR = cr.getChangeRequestListByStatusAndSearch(-1, "Đức");
       for(ChangeRequest c: cR){
           System.out.println(c.getDoctor());
       } 
        //System.out.println(pdao.get(10));
    }

}
