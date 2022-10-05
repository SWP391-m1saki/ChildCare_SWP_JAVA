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
        pdao.update(new Post(9, "123", "123456", new Date(1000), 4, "123456"));
        System.out.println(pdao.get(9));
    }
    
}
