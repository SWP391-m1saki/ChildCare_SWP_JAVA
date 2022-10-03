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
        String sql = "Insert into Post values(?,?,?,?,?,?)";
        try{
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, t.getTitle());
            ps.setString(2, t.getDescription());
            ps.setString(3, t.getDetail());
            ps.setDate(4, t.getCreatedAt());
            ps.setInt(5, t.getCateId());
            ps.setString(6, t.getImage());
            ps.execute();
        }catch(Exception e){
            status = "Error at insert Post" + e.getMessage();
        }
    }

    @Override
    public void update(Post t) {
        String sql = "update Post set title = ?, description = ?, detail = ?,"
                + "created_at = ?, cate_id= ?, [image] = ? where post_id = ? ";
        try{
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, t.getTitle());
            ps.setString(2, t.getDescription());
            ps.setString(3, t.getDetail());
            ps.setDate(4, t.getCreatedAt());
            ps.setInt(5, t.getCateId());
            ps.setString(6, t.getImage());
            ps.setInt(7, t.getPostId());
            ps.execute();
        }catch(Exception e){
            status = "Error at Update Post" + e.getMessage();
        }
    }

    @Override
    public void delete(Post t) {
        String sql = "delete from Post where post_id = ?";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, t.getPostId());
            ps.execute();
        } catch (Exception e) {
            status = "Error at Delete Post" + e.getMessage();
        }
    }
    
}
