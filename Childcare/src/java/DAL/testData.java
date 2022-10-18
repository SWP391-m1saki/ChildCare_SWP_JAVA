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
      PostDAO dao = new PostDAO();
      
      for(Post p: dao.loadMoreWithFilter(0, 3, "", 1)){
          System.out.println(p);
      }
     
       
        //System.out.println(pdao.get(10));
    }
    
}
