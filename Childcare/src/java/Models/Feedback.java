package Models;

import java.sql.Date;

public class Feedback {

    private int feedbackId;
    private String description;
    private int doctorId, customerId;
    private Date createdAt;
    private User user;
    public Feedback() {
    }

    public Feedback(int feedbackId, String description, int doctorId, int customerId, Date createdAt,User user) {
        this.feedbackId = feedbackId;
        this.description = description;
        this.doctorId = doctorId;
        this.customerId = customerId;
        this.createdAt = createdAt;
        this.user = user;
    }

    public int getFeedbackId() {
        return feedbackId;
    }

    public void setFeedbackId(int feedbackId) {
        this.feedbackId = feedbackId;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public int getDoctorId() {
        return doctorId;
    }

    public void setDoctorId(int doctorId) {
        this.doctorId = doctorId;
    }

    public int getCustomerId() {
        return customerId;
    }

    public void setCustomerId(int customerId) {
        this.customerId = customerId;
    }

    public Date getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(Date createdAt) {
        this.createdAt = createdAt;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    

}
