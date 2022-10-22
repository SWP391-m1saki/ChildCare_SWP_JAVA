package Models;

import java.time.LocalDate;

/**
 *
 * @author Misaki
 */
public class Slot {
    private int slotId;
    private LocalDate date;
    private boolean isExamination;
    private int status;
    private int slotTimeId, scheduleId;

    public Slot() {
    }

    public Slot(int slotId, LocalDate date, boolean isExamination, int status, int slotTimeId, int scheduleId) {
        this.slotId = slotId;
        this.date = date;
        this.isExamination = isExamination;
        this.status = status;
        this.slotTimeId = slotTimeId;
        this.scheduleId = scheduleId;
    }

    public int getSlotId() {
        return slotId;
    }

    public void setSlotId(int slotId) {
        this.slotId = slotId;
    }

    public LocalDate getDate() {
        return date;
    }

    public void setDate(LocalDate date) {
        this.date = date;
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

    public int getSlotTimeId() {
        return slotTimeId;
    }

    public void setSlotTimeId(int slotTimeId) {
        this.slotTimeId = slotTimeId;
    }

    public int getScheduleId() {
        return scheduleId;
    }

    public void setScheduleId(int scheduleId) {
        this.scheduleId = scheduleId;
    }

    

   
    
    
}
