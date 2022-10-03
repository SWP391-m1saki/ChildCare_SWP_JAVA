/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;

import Models.Post;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Admin
 */
public class PostDAO implements DAO<Post>{

    private String status;
    private Connection con;
    private List<Post> postList;

    public PostDAO() {
        try {
            con = DBContext.getConnection();
        } catch (Exception e) {
            status = "Error connection" + e.getMessage();
        }
        postList = new ArrayList<Post>();
    }


    @Override
    public List<Post> getAll() {
        return null;
    }
    
    public void load() {
        String sql = "SELECT * FROM Post";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Post p = new Post();
                p.setPostId(rs.getInt("post_id"));
                p.setTitle(rs.getNString("title"));
                p.setDescription(rs.getNString("description"));
                p.setDetail(rs.getNString("detail"));
                p.setCreatedAt(rs.getDate("created_at"));
                p.setCateId(rs.getInt("cate_id"));
                p.setImage(rs.getString("image"));
                postList.add(p);
            }
        } catch (SQLException e) {
            status = "Error connection" + e.getMessage();
        }
    }

    @Override
    public Post get(int id) {
        for(Post post : postList){
            if(post.getPostId() == id) {
                return post;
            }
        }
        return null;
    }

    @Override
    public void add(Post t) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void update(Post t) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void delete(Post t) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }
    
}
