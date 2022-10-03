/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Models;

import java.util.Date;


/**
 *
 * @author Admin
 */
public class Post {
    private int postId;
    private String title, description, detail, image;
    private Date createdAt;
    private int cateId;

    public Post() {
    }

    public Post(int postId, String title, String description, String detail, Date createdAt, int cateId, String image) {
        this.postId = postId;
        this.title = title;
        this.description = description;
        this.detail = detail;
        this.createdAt = createdAt;
        this.cateId = cateId;
        this.image = image;
    }

    public int getPostId() {
        return postId;
    }

    public void setPostId(int postId) {
        this.postId = postId;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getDetail() {
        return detail;
    }

    public void setDetail(String detail) {
        this.detail = detail;
    }

    public Date getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(Date createdAt) {
        this.createdAt = createdAt;
    }

    public int getCateId() {
        return cateId;
    }

    public void setCateId(int cateId) {
        this.cateId = cateId;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }
    
}
