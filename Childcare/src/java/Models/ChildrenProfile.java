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
public class ChildrenProfile {
    private int childrenId;
    private String name;
    private Date dob;
    private int parentId;

    public ChildrenProfile() {
    }

    public ChildrenProfile(int childrenId, String name, Date dob, int parentId) {
        this.childrenId = childrenId;
        this.name = name;
        this.dob = dob;
        this.parentId = parentId;
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

    public Date getDob() {
        return dob;
    }

    public void setDob(Date dob) {
        this.dob = dob;
    }

    public int getParentId() {
        return parentId;
    }

    public void setParentId(int parentId) {
        this.parentId = parentId;
    }
    
    
}
