/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Models;

import java.time.LocalDate;

/**
 *
 * @author Misaki
 */
public class Slot {
    private int slotId;
    private LocalDate date;
    private int index;
    private boolean isExamination;
    private int status, doctorId;

    public Slot() {
    }

    public Slot(int slotId, LocalDate date, int index, boolean isExamination, int status, int doctorId) {
        this.slotId = slotId;
        this.date = date;
        this.index = index;
        this.isExamination = isExamination;
        this.status = status;
        this.doctorId = doctorId;
    }

    public int getSlotId() {
        return slotId;
    }
    
//    public Time getStartTime(){
//        
//    }

    public void setSlotId(int slotId) {
        this.slotId = slotId;
    }

    public LocalDate getDate() {
        return date;
    }

    public void setDate(LocalDate date) {
        this.date = date;
    }

    public int getIndex() {
        return index;
    }

    public void setIndex(int index) {
        this.index = index;
    }

    public boolean isIsExamination() {
        return isExamination;
    }

    public void setIsExamination(boolean isExamination) {
        this.isExamination = isExamination;
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
