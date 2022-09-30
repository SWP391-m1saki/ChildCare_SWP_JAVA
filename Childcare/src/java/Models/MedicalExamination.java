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
public class MedicalExamination {
    private int medId;
    private int appointmentId;
    private String result;
    private String prescription;
    private Date sendTime;

    public MedicalExamination() {
    }

    public MedicalExamination(int medId, int appointmentId, String result, String prescription, Date sendTime) {
        this.medId = medId;
        this.appointmentId = appointmentId;
        this.result = result;
        this.prescription = prescription;
        this.sendTime = sendTime;
    }

    public int getMedId() {
        return medId;
    }

    public void setMedId(int medId) {
        this.medId = medId;
    }

    public int getAppointmentId() {
        return appointmentId;
    }

    public void setAppointmentId(int appointmentId) {
        this.appointmentId = appointmentId;
    }

    public String getResult() {
        return result;
    }

    public void setResult(String result) {
        this.result = result;
    }

    public String getPrescription() {
        return prescription;
    }

    public void setPrescription(String prescription) {
        this.prescription = prescription;
    }

    public Date getSendTime() {
        return sendTime;
    }

    public void setSendTime(Date sendTime) {
        this.sendTime = sendTime;
    }
    
    
}
