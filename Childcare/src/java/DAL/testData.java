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
       p.setPostId(9);
       p.setCateId(3);
       p.setTitle("Nha no");
       p.setDetail("123456");
       p.setImage("123456");
        //pdao.update(p);
        System.out.println(pdao.get(9));
    }
    
}
