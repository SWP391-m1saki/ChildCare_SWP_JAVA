package Models;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

/**
 * @author Misaki
 */
public class Slot {

    private int slotId;
    private boolean isExamination;
    private int status;
    private SlotTime slotTime;
    private Shift shift;
    private List<Appointment> appointments = new ArrayList<>();

    public Slot() {
    }

    public Slot(int slotId, boolean isExamination, int status, SlotTime slotTime, Shift shift) {
        this.slotId = slotId;
        this.isExamination = isExamination;
        this.status = status;
        this.slotTime = slotTime;
        this.shift = shift;
    }

    public Slot(boolean isExamination, int status, SlotTime slotTime, Shift shift) {
        this.isExamination = isExamination;
        this.status = status;
        this.slotTime = slotTime;
        this.shift = shift;
    }

    public Slot(int status) {
        this.status = status;
    }

    public int getSlotId() {
        return slotId;
    }

    public void setSlotId(int slotId) {
        this.slotId = slotId;
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

    public SlotTime getSlotTime() {
        return slotTime;
    }

    public void setSlotTime(SlotTime slotTime) {
        this.slotTime = slotTime;
    }

    public Shift getShift() {
        return shift;
    }

    public void setShift(Shift shift) {
        this.shift = shift;
    }

    public List<Appointment> getAppointments() {
        return appointments;
    }

    public void setAppointments(List<Appointment> appointments) {
        this.appointments = appointments;
    }

    @Override
    public String toString() {
        return "Slot{" + "slotId=" + slotId + ", isExamination=" + isExamination + ", status=" + status + ", slotTime=" + slotTime + ", shift=" + shift + ", appointments=" + appointments + '}';
    }

    // status = -2 : dont work  : -
    //status = -1 : not has app : Empty
    //status = 0 : slot has waiting : Empty
    // status = 1: slot no sucess, no waiting: Empty
    // status = 2: slot no success in past: Canceled
    // status = 3: slot has success: Success
    public String getStatusLable() {
        if (status < 0 || appointments.isEmpty()) {
            return "Đang trống";
        }

        //search the appointment
        for (Appointment appointment : appointments) {
            if (appointment.getStatus() == 1) {
                return "Hoàn thành";
            } else if (appointment.getStatus() == 0) {
                return "Đã đầy";
            }

        }
        // if no success appointment
        if (shift.getDate().isBefore(LocalDate.now())) {
            return "Đang trống";
        } else {
            return "Đã hủy";
        }
    }

    public int getSlotStatusExtended() {
        if (status < 0) {
            return status;
        }

        if(appointments.isEmpty()){
            return -1;
        }
        
        //search the appointment
        for (Appointment appointment : appointments) {
            if (appointment.getStatus() == 1) {
                return 3;
            } else if (appointment.getStatus() == 0) {
                return 0;
            }
        }
        // if no success appointment
        if (shift.getDate().isBefore(LocalDate.now())) {
            return 1;
        } else {
            return 2;
        }
    }

}
