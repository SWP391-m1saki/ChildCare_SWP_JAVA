package Models;

/**
 *
 * @author Misaki
 */
public class Schedule {
    private int ScheduleId, doctorId;
    private String dayOfWeek;
    private Boolean isMorningShift;

    public Schedule() {
    }

    public Schedule(int ScheduleId, int doctorId, String dayOfWeek, Boolean isMorningShift) {
        this.ScheduleId = ScheduleId;
        this.doctorId = doctorId;
        this.dayOfWeek = dayOfWeek;
        this.isMorningShift = isMorningShift;
    }

    public int getScheduleId() {
        return ScheduleId;
    }

    public void setScheduleId(int ScheduleId) {
        this.ScheduleId = ScheduleId;
    }

    public int getDoctorId() {
        return doctorId;
    }

    public void setDoctorId(int doctorId) {
        this.doctorId = doctorId;
    }

    public String getDayOfWeek() {
        return dayOfWeek;
    }

    public void setDayOfWeek(String dayOfWeek) {
        this.dayOfWeek = dayOfWeek;
    }

    public Boolean getIsMorningShift() {
        return isMorningShift;
    }

    public void setIsMorningShift(Boolean isMorningShift) {
        this.isMorningShift = isMorningShift;
    }
    
    public String getDayOfWeekNumber(){
        return dayOfWeek.substring(1);
    }

    @Override
    public String toString() {
        return "Schedule{" + "ScheduleId=" + ScheduleId + ", doctorId=" + doctorId + ", dayOfWeek=" + dayOfWeek + ", isMorningShift=" + isMorningShift + '}';
    }
}
