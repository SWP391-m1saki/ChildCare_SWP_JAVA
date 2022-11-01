/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;

import Models.PageInfo;
import Models.Post;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 * @author Admin
 */

public class PostDAO implements DAO<Post> {

    private String status;
    private Connection con;
    private final List<Post> postList;

    @SuppressWarnings("Convert2Diamond")
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

    @Override
    public void load() {
        postList.clear();
        String sql = "SELECT * FROM Post ORDER BY created_at DESC";
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
        for (Post post : postList) {
            if (post.getPostId() == id) {
                return post;
            }
        }
        return null;
    }

    public List<Post> loadMoreWithFilter(int currentSize, int numberOfFetch, String searchTxt, int cateId) {
        List<Post> fullList = getPostBySearchAndCategory(searchTxt, cateId);
        List<Post> posts = new ArrayList<Post>();
        if (currentSize >= fullList.size()) {
            return posts;
        }
        int end = Math.min(fullList.size(), currentSize + numberOfFetch);
        return fullList.subList(currentSize, end);
    }


    @Override
    public void add(Post t) {
        String sql = "Insert into Post(title,description, detail, cate_id, [image]) values(?,?,?,?,?)";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, t.getTitle());
            ps.setString(2, t.getDescription());
            ps.setString(3, t.getDetail());
            ps.setInt(4, t.getCateId());
            ps.setString(5, t.getImage());
            ps.executeUpdate();

            //load list again
            load();
        } catch (SQLException e) {
            status = "Error at insert Post" + e.getMessage();
        }
    }

    @Override
    public void update(Post t) {
        String sql = "update Post set title = ?, description = ?,detail = ?,cate_id= ?,[image] = ? where post_id = ?";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, t.getTitle());
            ps.setString(2, t.getDescription());
            ps.setString(3, t.getDetail());
            ps.setInt(4, t.getCateId());
            ps.setString(5, t.getImage());
            ps.setInt(6, t.getPostId());
            ps.executeUpdate();
            load();
        } catch (SQLException e) {
            System.out.println("UPdate that bai!");
            status = "Error at Update Post" + e.getMessage();
        }
    }

    @Override
    public void delete(Post t) {
        String sql = "delete from Post where post_id = ?";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, t.getPostId());
            ps.executeUpdate();
            load();
        } catch (SQLException e) {
            status = "Error at Delete Post" + e.getMessage();
        }
    }

    // Get posts by pageindex
    public List<Post> getPostsByPage(PageInfo page, List<Post> fullList) {
        List<Post> posts = new ArrayList<Post>();
        if (fullList.isEmpty()) {
            return posts;
        }
        int maxIndex = page.getPageindex() * page.getPagesize();
        maxIndex = (maxIndex > fullList.size()) ? fullList.size() : maxIndex;
        for (int i = (page.getPageindex() - 1) * page.getPagesize(); i < maxIndex; i++) {
            posts.add(fullList.get(i));
        }
        return posts;
    }

    // Get post filter by search bar
    public List<Post> getPostBySearch(String searchText) {
        if (searchText == null || "".equals(searchText)) {
            return postList;
        } else {
            List<Post> posts = new ArrayList<Post>();
            for (Post p : postList) {
                if (p.getTitle().toLowerCase().contains(searchText.toLowerCase())) {  // check if post title contains(ignore case) searchTxt
                    posts.add(p);
                }
            }
            return posts;
        }
    }

    @SuppressWarnings("JavadocDeclaration")
    /**
     * *
     * Get Post from List by CateId
     *
     * @param cateId to get category
     * @return
     */
    public List<Post> getPostByCate(int cateId) {
        if (cateId == -1) {
            return postList;
        }
        List<Post> posts = new ArrayList<Post>();
        for (Post p : postList) {
            if (p.getCateId() == cateId) {
                posts.add(p);
            }
        }
        return posts;
    }

    public List<Post> getPostBySearchAndCategory(String searchTxt, int cateId) {
        List<Post> posts = new ArrayList<Post>();
        if (cateId == -1) {
            if (searchTxt == null || "".equals(searchTxt)) {
                return postList;
            } else {
                for (Post p : postList) {
                    if (p.getTitle().toLowerCase().contains(searchTxt.toLowerCase())) {  // check if post title contains(ignore case) searchTxt
                        posts.add(p);
                    }
                }
                return posts;
            }
        }

        for (Post p : postList) {
            if (p.getCateId() == cateId) {
                if (searchTxt == null || "".equals(searchTxt)) {
                    posts.add(p);
                } else {
                    if (p.getTitle().toLowerCase().contains(searchTxt.toLowerCase())) {
                        posts.add(p);
                    }
                }
            }
        }
        return posts;
    }
}
