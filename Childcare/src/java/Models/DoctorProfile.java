/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Models;

public class DoctorProfile {
    private int doctorId;
    private String title;
    private double price;
    private String qualification;
    private String description;
    private int departmentId;
    private User user;

    public DoctorProfile() {
    }

    public DoctorProfile(int doctorId, String title, double price, String qualification, String description, int departmentId, User user) {
        this.doctorId = doctorId;
        this.title = title;
        this.price = price;
        this.qualification = qualification;
        this.description = description;
        this.departmentId = departmentId;
        this.user = user;
    }

    public int getDoctorId() {
        return doctorId;
    }

    public void setDoctorId(int doctorId) {
        this.doctorId = doctorId;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getQualification() {
        return qualification;
    }

    public void setQualification(String qualification) {
        this.qualification = qualification;
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

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    @Override
    public String toString() {
        return "DoctorProfile{" + "doctorId=" + doctorId + ", title=" + title + ", price=" + price + ", qualification=" + qualification + ", description=" + description + ", departmentId=" + departmentId + ", user=" + user.getName() + '}';
    }

}
