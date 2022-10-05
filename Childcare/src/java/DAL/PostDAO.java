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
public class PostDAO implements DAO<Post> {

    private String status;
    private Connection con;
    private final List<Post> postList;

    public PostDAO() {
        try {
            con = DBContext.getConnection();
        } catch (Exception e) {
            status = "Error connection" + e.getMessage();
        }
        postList = new ArrayList<Post>();
        load();
    }

    @Override
    public List<Post> getAll() {
        return postList;
    }

    public void load() {
        postList.clear();
        String sql = "SELECT * FROM Post";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Post p = new Post();
                p.setPostId(rs.getInt("post_id"));
                p.setTitle(rs.getNString("title"));
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
        for (Post post : postList) {
            if (post.getPostId() == id) {
                return post;
            }
        }
        return null;
    }

    @Override
    public void add(Post t) {
        String sql = "Insert into Post(title, detail, cate_id, [image]) values(?,?,?,?)";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, t.getTitle());
            ps.setString(2, t.getDetail());
            ps.setInt(3, t.getCateId());
            ps.setString(4, t.getImage());
            ps.execute();
        } catch (SQLException e) {
            status = "Error at insert Post" + e.getMessage();
        }
    }

    @Override
    public void update(Post t) {
        String sql = "update Post"
                + "set title = ?, detail = ?,"
                + "cate_id= ?, [image] = ? where post_id = ? ";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, t.getTitle());
            ps.setString(2, t.getDetail());
            ps.setInt(3, t.getCateId());
            ps.setString(4, t.getImage());
            ps.setInt(5, t.getPostId());
            ps.execute();
        } catch (SQLException e) {
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
        } catch (SQLException e) {
            status = "Error at Delete Post" + e.getMessage();
        }
    }

    /**
     * *
     * Get Post from List by CateId
     *
     * @param cateId
     * @return
     */
    public List<Post> getPostByCate(int cateId) {
        List<Post> posts = new ArrayList<Post>();
        for (Post p : postList) {
            if (p.getCateId() == cateId) {
                posts.add(p);
            }
        }
        return posts;
    }
}
