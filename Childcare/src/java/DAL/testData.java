/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;

import Models.*;
import java.sql.Date;

/**
 *
 * @author Admin
 */
public class testData {

    public static void main(String[] args) {
        PostDAO pdao = new PostDAO();

       for(Post p1: pdao.getAll()){
           System.out.println(p1);
       }
       Post p  = new Post();
       p.setPostId(10);
       
        //System.out.println(pdao.get(10));
    }
    
}
