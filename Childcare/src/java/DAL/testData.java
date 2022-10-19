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
        CategoryDAO categorydao = new CategoryDAO();
        PostCategory category = new PostCategory();
        category.setCateName("Sức khỏe sinh sản");
        categorydao.add(category);
        categorydao.load();
        for (PostCategory cate : categorydao.getAll()) {
            System.out.println(cate.getCateName());
        }

        //System.out.println(pdao.get(10));
    }

}
