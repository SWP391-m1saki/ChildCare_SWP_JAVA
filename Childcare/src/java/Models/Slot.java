package Models;

import java.time.LocalDate;

/**
 *
 * @author Misaki
 */
public class Slot {
    private int slotId;
    private boolean isExamination;
    private int status;
    private int slotTimeId, shiftId;

    public Slot() {
    }

    public Slot(int slotId, boolean isExamination, int status, int slotTimeId, int shiftId) {
        this.slotId = slotId;
        this.isExamination = isExamination;
        this.status = status;
        this.slotTimeId = slotTimeId;
        this.shiftId = shiftId;
    }
    
    public Slot(boolean isExamination, int status, int slotTimeId, int shiftId) {
        this.isExamination = isExamination;
        this.status = status;
        this.slotTimeId = slotTimeId;
        this.shiftId = shiftId;
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

    public int getSlotTimeId() {
        return slotTimeId;
    }

    public void setSlotTimeId(int slotTimeId) {
        this.slotTimeId = slotTimeId;
    }

    public int getShiftId() {
        return shiftId;
    }

    public void setShiftId(int shiftId) {
        this.shiftId = shiftId;
    }

    public boolean isMorningShift(){
        return slotTimeId <=8;
    }
}
