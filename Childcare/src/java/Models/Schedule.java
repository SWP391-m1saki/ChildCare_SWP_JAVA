package Models;

/**
 *
 * @author Misaki
 */
public class Schedule {

    private int scheduleId, doctorId;
    private int dayOfWeek;
    private Boolean isMorningShift;
    private boolean isWorked;

    public Schedule() {
    }

    public Schedule(int scheduleId, int doctorId, int dayOfWeek, Boolean isMorningShift, boolean isWorked) {
        this.scheduleId = scheduleId;
        this.doctorId = doctorId;
        this.dayOfWeek = dayOfWeek;
        this.isMorningShift = isMorningShift;
        this.isWorked = isWorked;
    }
    
    public Schedule(int doctorId, int dayOfWeek, Boolean isMorningShift, boolean isWorked) {
        this.doctorId = doctorId;
        this.dayOfWeek = dayOfWeek;
        this.isMorningShift = isMorningShift;
        this.isWorked = isWorked;
    }

    public int getScheduleId() {
        return scheduleId;
    }

    public void setScheduleId(int scheduleId) {
        this.scheduleId = scheduleId;
    }

    public int getDoctorId() {
        return doctorId;
    }

    public void setDoctorId(int doctorId) {
        this.doctorId = doctorId;
    }

    public int getDayOfWeek() {
        return dayOfWeek;
    }

    public void setDayOfWeek(int dayOfWeek) {
        this.dayOfWeek = dayOfWeek;
    }

    public Boolean getIsMorningShift() {
        return isMorningShift;
    }

    public void setIsMorningShift(Boolean isMorningShift) {
        this.isMorningShift = isMorningShift;
    }

    public boolean isWorked() {
        return isWorked;
    }

    public void setIsWorked(boolean isWorked) {
        this.isWorked = isWorked;
    }


    @Override
    public String toString() {
        return "Schedule{" + "ScheduleId=" + scheduleId + ", doctorId=" + doctorId + ", dayOfWeek=" + dayOfWeek + ", isMorningShift=" + isMorningShift + ", status=" + isWorked + '}';
    }
}
