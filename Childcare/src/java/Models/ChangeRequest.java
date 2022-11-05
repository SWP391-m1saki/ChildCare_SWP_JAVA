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
public class ChangeRequest {
    private int requestId;
    private Date requestTime,reponseTime;
    private String description,reponseDescription;
    private int status, doctorId;
    private DoctorProfile doctor;
    public ChangeRequest() {
    }

    public ChangeRequest(int requestId, Date requestTime, Date reponseTime, String description, String reponseDescription, int status, int doctorId) {
        this.requestId = requestId;
        this.requestTime = requestTime;
        this.reponseTime = reponseTime;
        this.description = description;
        this.reponseDescription = reponseDescription;
        this.status = status;
        this.doctorId = doctorId;
    }

    public ChangeRequest(int requestId, Date requestTime, Date reponseTime, String description, String reponseDescription, int status, int doctorId, DoctorProfile doctor) {
        this.requestId = requestId;
        this.requestTime = requestTime;
        this.reponseTime = reponseTime;
        this.description = description;
        this.reponseDescription = reponseDescription;
        this.status = status;
        this.doctorId = doctorId;
        this.doctor = doctor;
    }

    
    public int getRequestId() {
        return requestId;
    }

    public Date getRequestTime() {
        return requestTime;
    }

    public Date getReponseTime() {
        return reponseTime;
    }

    public String getDescription() {
        return description;
    }

    public String getReponseDescription() {
        return reponseDescription;
    }

    public int getStatus() {
        return status;
    }

    public int getDoctorId() {
        return doctorId;
    }

    public void setRequestId(int requestId) {
        this.requestId = requestId;
    }

    public void setRequestTime(Date requestTime) {
        this.requestTime = requestTime;
    }

    public void setReponseTime(Date reponseTime) {
        this.reponseTime = reponseTime;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public void setReponseDescription(String reponseDescription) {
        this.reponseDescription = reponseDescription;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public void setDoctorId(int doctorId) {
        this.doctorId = doctorId;
    }

    public DoctorProfile getDoctor() {
        return doctor;
    }

    public void setDoctor(DoctorProfile doctor) {
        this.doctor = doctor;
    }
    
    
    
    public String getStatusLable(){
        switch (this.status) {
            case 1:
                return "Chưa xử lý";
            case 2:
                return "Chấp nhận";
            case 3:
                return "Từ chối";
            default:
                return "";
        }
    }
}
