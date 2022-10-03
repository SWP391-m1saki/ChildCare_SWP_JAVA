/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;

import Models.Post;

/**
 *
 * @author Admin
 */
public class testData {
    public static void main(String[] args) {
        PostDAO pdao = new PostDAO();
       Post p = new Post();
       p.setCateId(1);
       p.setDetail("123456");
       p.setDescription("123456");
       p.setImage("123456");
       p.setTitle("123456");
       pdao.add(p);
       pdao.load();
       for(Post p1: pdao.getAll()){
           System.out.println(p1);
       }
    }
    
}
