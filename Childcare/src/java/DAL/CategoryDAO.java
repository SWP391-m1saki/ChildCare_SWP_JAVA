/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;

import Models.PostCategory;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 * @author ADMIN
 */
public class CategoryDAO implements DAO<PostCategory> {

    private String status;
    private Connection con;
    private final List<PostCategory> postCategoryList;

    public CategoryDAO() {
        try {
            con = DBContext.getConnection();
        } catch (Exception e) {
            status = "Error connection" + e.getMessage();
        }
        postCategoryList = new ArrayList<PostCategory>();
        load();
    }

    @Override
    public List<PostCategory> getAll() {
        return postCategoryList;
    }

    @Override
    public PostCategory get(int id) {
        for (PostCategory postCategory : postCategoryList) {
            if (postCategory.getCateId() == id) {
                return postCategory;
            }
        }
        return null;
    }

    @Override
    public void load() {
        postCategoryList.clear();
        String sql = "select * from PostCategory";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                PostCategory pC = new PostCategory();
                pC.setCateId(rs.getInt("cate_id"));
                pC.setCateName(rs.getNString("cate_name"));
                postCategoryList.add(pC);
            }
        } catch (Exception e) {
            status = "Error connection" + e.getMessage();
        }
    }

    @Override
    public void add(PostCategory t) {
        String sql = "Insert into PostCategory values(?)";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, t.getCateName());
            ps.execute();
        } catch (Exception e) {
            status = "Error at insert PostCategory" + e.getMessage();
        }
    }

    @Override
    public void update(PostCategory t) {
        String sql = "update PostCategory set cate_name = ? where cate_id = ? ";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, t.getCateName());
            ps.setInt(2, t.getCateId());
            ps.execute();
        } catch (Exception e) {
            status = "Error at Update PostCategory" + e.getMessage();
        }
    }

    @Override
    public void delete(PostCategory t) {
        String sql = "delete from PostCategory where cate_id = ?";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, t.getCateId());
            ps.execute();
        } catch (Exception e) {
            status = "Error at Delete PostCategory" + e.getMessage();
        }

    }

}
