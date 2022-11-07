/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Models;

import java.sql.Date;


/**
 * @author Misaki
 */
public class Post {
    private int postId;
    private String title, detail, image, description;
    private Date createdAt;
    private int cateId;

    public Post() {
    }

    public Post(int postId, String title, String detail, String image, String description, Date createdAt, int cateId) {
        this.postId = postId;
        this.title = title;
        this.detail = detail;
        this.image = image;
        this.description = description;
        this.createdAt = createdAt;
        this.cateId = cateId;
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

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }


    @Override
    public String toString() {
        return "Post{" + "postId=" + postId + ", title=" + title + ", image=" + image + ", createdAt=" + createdAt + ", cateId=" + cateId + '}';
    }

    @Override
    public boolean equals(Object obj) {
        if(this.getPostId() == ((Post)obj).getPostId()){
            return true;
        }
        return false;
    }
    
    
    
    
}
