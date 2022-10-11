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
        DepartmentDAO dp = new DepartmentDAO();
        dp.load();
        for(Map.Entry<Integer,Department> entry : dp.getAllHasMap().entrySet()){
            System.out.println(entry.getKey() + "-");
        }
        
       
        //System.out.println(pdao.get(10));
    }
    
}
