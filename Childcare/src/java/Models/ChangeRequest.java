/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Models;

import java.sql.Date;

/**
 *
 * @author Misaki
 */
public class ChangeRequest {
    private int requestId;
    private Date requestTime;
    private String description;
    private int status, doctorId;

    public ChangeRequest() {
    }

    public ChangeRequest(int requestId, Date requestTime, String description, int status, int doctorId) {
        this.requestId = requestId;
        this.requestTime = requestTime;
        this.description = description;
        this.status = status;
        this.doctorId = doctorId;
    }

    public int getRequestId() {
        return requestId;
    }

    public Date getRequestTime() {
        return requestTime;
    }

    public String getDescription() {
        return description;
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

    public void setDescription(String description) {
        this.description = description;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public void setDoctorId(int doctorId) {
        this.doctorId = doctorId;
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
