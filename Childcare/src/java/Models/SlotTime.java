package Models;

/**
 *
 * @author Misaki
 */
public class SlotTime {
    private int slotTimeId;
    private String startTime, endTime;

    public SlotTime() {
    }

    public SlotTime(int slotTimeId, String startTime, String endTime) {
        this.slotTimeId = slotTimeId;
        this.startTime = startTime;
        this.endTime = endTime;
    }

    public int getSlotTimeId() {
        return slotTimeId;
    }

    public void setSlotTimeId(int slotTimeId) {
        this.slotTimeId = slotTimeId;
    }

    public String getStartTime() {
        return startTime;
    }

    public void setStartTime(String startTime) {
        this.startTime = startTime;
    }

    public String getEndTime() {
        return endTime;
    }

    public void setEndTime(String endTime) {
        this.endTime = endTime;
    }
    
    
}
