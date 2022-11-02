package Models;

/**
 * @author Misaki
 */
public class Slot {
    private int slotId;
    private boolean isExamination;
    private int status;
    private SlotTime slotTime;
    private Shift shift;

    public Slot() {
    }

    public Slot(int slotId, boolean isExamination, int status, SlotTime slotTime, Shift shift) {
        this.slotId = slotId;
        this.isExamination = isExamination;
        this.status = status;
        this.slotTime = slotTime;
        this.shift = shift;
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

    public boolean isMorningShift(){
        return slotTime.getSlotTimeId() <= 8;
    }
}
