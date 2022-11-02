/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Models;

/**
 * @author Misaki
 */
public class Appointment {
    private int appointmentId;
    private ChildrenProfile child;
    private Slot slot;

    public Appointment() {
    }

    public Appointment(int appointmentId, ChildrenProfile child, Slot slot) {
        this.appointmentId = appointmentId;
        this.child = child;
        this.slot = slot;
    }

    public int getAppointmentId() {
        return appointmentId;
    }

    public void setAppointmentId(int appointmentId) {
        this.appointmentId = appointmentId;
    }

    public ChildrenProfile getChild() {
        return child;
    }

    public void setChild(ChildrenProfile child) {
        this.child = child;
    }

    public Slot getSlot() {
        return slot;
    }

    public void setSlot(Slot slot) {
        this.slot = slot;
    }

    @Override
    public String toString() {
        return "Appointment{" + "appointmentId=" + appointmentId + ", child=" + child + ", slot=" + slot + '}';
    }
    


}
