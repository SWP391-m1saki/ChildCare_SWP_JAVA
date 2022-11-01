/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Models;

import java.util.Date;

/**
 * @author Misaki
 */
public class ChangeRequest {
    private int requestId;
    private Date requestTime;
    private int status, doctorId;

    public ChangeRequest() {
    }

    public ChangeRequest(int requestId, Date requestTime, int status, int doctorId) {
        this.requestId = requestId;
        this.requestTime = requestTime;
        this.status = status;
        this.doctorId = doctorId;
    }

    public int getRequestId() {
        return requestId;
    }

    public void setRequestId(int requestId) {
        this.requestId = requestId;
    }

    public Date getRequestTime() {
        return requestTime;
    }

    public void setRequestTime(Date requestTime) {
        this.requestTime = requestTime;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public int getDoctorId() {
        return doctorId;
    }

    public void setDoctorId(int doctorId) {
        this.doctorId = doctorId;
    }


}
