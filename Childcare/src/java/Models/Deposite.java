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
public class Deposite {
    private int depositeId, status;
    private Date payDate;
    private String type;
    private int appointmentId;

    public Deposite() {
    }

    public Deposite(int depositeId, int status, Date payDate, String type, int appointmentId) {
        this.depositeId = depositeId;
        this.status = status;
        this.payDate = payDate;
        this.type = type;
        this.appointmentId = appointmentId;
    }

    public int getDepositeId() {
        return depositeId;
    }

    public void setDepositeId(int depositeId) {
        this.depositeId = depositeId;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public Date getPayDate() {
        return payDate;
    }

    public void setPayDate(Date payDate) {
        this.payDate = payDate;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public int getAppointmentId() {
        return appointmentId;
    }

    public void setAppointmentId(int appointmentId) {
        this.appointmentId = appointmentId;
    }


}
