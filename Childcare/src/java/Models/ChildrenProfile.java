/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Models;

import java.time.LocalDate;

/**
 * @author Misaki
 */
public class ChildrenProfile {
    private int childrenId;
    private String name;
    private Boolean gender;
    private LocalDate dob;
    private int parentId;
    private String avatar;
    private User parent;

    public ChildrenProfile() {
    }

    public ChildrenProfile(int childrenId, String name, Boolean gender, LocalDate dob, int parentId, String avatar) {
        this.childrenId = childrenId;
        this.name = name;
        this.gender = gender;
        this.dob = dob;
        this.parentId = parentId;
        this.avatar = avatar;
    }
    
    public ChildrenProfile(int childrenId, String name, Boolean gender, LocalDate dob, int parentId, String avatar, User parent) {
        this.childrenId = childrenId;
        this.name = name;
        this.gender = gender;
        this.dob = dob;
        this.parentId = parentId;
        this.avatar = avatar;
        this.parent = parent;
    }

    public int getChildrenId() {
        return childrenId;
    }

    public void setChildrenId(int childrenId) {
        this.childrenId = childrenId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public LocalDate getDob() {
        return dob;
    }

    public void setDob(LocalDate dob) {
        this.dob = dob;
    }

    public int getParentId() {
        return parentId;
    }

    public void setParentId(int parentId) {
        this.parentId = parentId;
    }

    public Boolean getGender() {
        return gender;
    }

    public void setGender(Boolean gender) {
        this.gender = gender;
    }

    public String getAvatar() {
        return avatar;
    }

    public void setAvatar(String avatar) {
        this.avatar = avatar;
    }

    public User getParent() {
        return parent;
    }

    public void setParent(User parent) {
        this.parent = parent;
    }

    @Override
    public String toString() {
        return "ChildrenProfile{" + "childrenId=" + childrenId + ", name=" + name + ", gender=" + gender + ", dob=" + dob + ", parentId=" + parentId + ", avatar=" + avatar + ", parent=" + parent + '}';
    }

}
