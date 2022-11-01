/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Models;

public class DoctorProfile {
    private int doctorId;
    private String description;
    private String qualification;
    private double price;
    private int departmentId;
    private String title;  //-- vd BS, TS, BS.CK1
    private User user;
    //

    public DoctorProfile() {

    }

    public DoctorProfile(int doctorId, String description, String qualification, double price, int departmentId, String title, User user) {
        this.doctorId = doctorId;
        this.description = description;
        this.qualification = qualification;
        this.price = price;
        this.departmentId = departmentId;
        this.title = title;
        this.user = user;
    }

    public DoctorProfile(String description, String qualification, double price, int departmentId, String title, User user) {
        this.description = description;
        this.qualification = qualification;
        this.price = price;
        this.departmentId = departmentId;
        this.title = title;
        this.user = user;
    }

    public int getDoctorId() {
        return doctorId;
    }

    public void setDoctorId(int doctorId) {
        this.doctorId = doctorId;
    }


    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public int getDepartmentId() {
        return departmentId;
    }

    public void setDepartmentId(int departmentId) {
        this.departmentId = departmentId;
    }

    public String getQualification() {
        return qualification;
    }

    public void setQualification(String qualification) {
        this.qualification = qualification;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    @Override
    public String toString() {
        return "DoctorProfile{" + "doctorId=" + doctorId + ", description=" + description + ", qualification=" + qualification + ", price=" + price + ", departmentId=" + departmentId + ", title=" + title + ", user=" + user + '}';
    }


}
