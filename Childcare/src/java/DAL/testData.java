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
       UserDAO dao = new UserDAO();
       dao.load();
       for(User di : dao.getAll()){
           System.out.println(di.toString());
       }

        //System.out.println(pdao.get(10));
    }

}
