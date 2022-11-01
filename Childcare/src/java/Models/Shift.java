/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Models;

import java.time.LocalDate;

/**
 * @author Admin
 */
public class Shift {
    private int shiftId;
    private LocalDate date;
    private Schedule schedule;

    public Shift() {
    }

    public Shift(int shiftId, LocalDate date, Schedule schedule) {
        this.shiftId = shiftId;
        this.date = date;
        this.schedule = schedule;
    }

    public int getShiftId() {
        return shiftId;
    }

    public void setShiftId(int shiftId) {
        this.shiftId = shiftId;
    }

    public LocalDate getDate() {
        return date;
    }

    public void setDate(LocalDate date) {
        this.date = date;
    }

    public Schedule getSchedule() {
        return schedule;
    }

    public void setSchedule(Schedule schedule) {
        this.schedule = schedule;
    }

    @Override
    public String toString() {
        return "Shift{" + "shiftId=" + shiftId + ", date=" + date + ", schedule=" + schedule + '}';
    }

}
