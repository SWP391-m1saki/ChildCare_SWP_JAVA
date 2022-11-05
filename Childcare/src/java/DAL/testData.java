/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;

import Models.DoctorProfile;
import Models.Schedule;
import Models.*;

/**
 * @author Admin
 */
@SuppressWarnings("WriteOnlyObject")
public class testData {

    public static void main(String[] args) {
        testAppointment();
    }

    private static void getSchedule() {
//        ShiftDAO dao = new ShiftDAO();
//        dao.addDoctorToShift(45, 1, true, 2);
//        ScheduleDAO scheduleDAO = new ScheduleDAO();
//        scheduleDAO.load();
//        int scheduleId = scheduleDAO.getScheduleId(2, 2, true);
//        System.out.println(scheduleId);

    }

    private static void testShift() {
        ShiftDAO dao = new ShiftDAO();
        dao.load();
        for (DoctorProfile doc : dao.getDoctorsNotWorkInShift(45, 1, true, -1)) {
            System.out.println(doc);
        }
    }
    
    private static void testAppointment() {
        AppointmentDAO dao = new AppointmentDAO();
        dao.load();
//        Slot s = new Slot();
//        s.setSlotId(8);
        for (Appointment doc : dao.filterAppointmentExtended(" ", "con", "", "581", 6, -1)) {
            System.out.println(doc);
        }
    }

    private static void testSlot() {
        SlotDAO dao = new SlotDAO();
        dao.load();
//        for (int i = 148; i <= 150; i++) {
//            for (int j = 1; j <= 8; j++) {
////                dao.add(new Slot(true, 1, j, i));
//            }
//        }
//        for (Slot slot : dao.getByShift(2, 0)) {
            System.out.println(dao.getByShift(148, 6));
//        }
    }

    //    private static void getSlotData(){
//        SlotDAO dao = new SlotDAO();
//        dao.add(new Slot(LocalDate.now().plusDays(1), true, 0, 1, 39));
//        dao.add(new Slot(LocalDate.now().plusDays(1), true, 0, 1, 50));
//        dao.add(new Slot(LocalDate.now().plusDays(1), true, 0, 9, 40));
//        dao.add(new Slot(LocalDate.now().plusDays(2), true, 0, 9, 52));
//        dao.load();
//        for(Slot s : dao.getAll()) {
//            System.out.println(s);
//        }
//    }
    private static void getSlotTimeData() {
        SlotTimeDAO dao = new SlotTimeDAO();
        dao.add(new SlotTime(1, "7:30", "8:00"));
        dao.add(new SlotTime(2, "8:00", "8:30"));
        dao.add(new SlotTime(3, "8:30", "9:00"));
        dao.add(new SlotTime(4, "9:00", "9:30"));
        dao.add(new SlotTime(5, "9:30", "10:00"));
        dao.add(new SlotTime(6, "10:00", "10:30"));
        dao.add(new SlotTime(7, "10:30", "11:00"));
        dao.add(new SlotTime(8, "11:00", "11:30"));
        dao.add(new SlotTime(9, "13:00", "13:30"));
        dao.add(new SlotTime(10, "13:30", "14:00"));
        dao.add(new SlotTime(11, "14:00", "14:30"));
        dao.add(new SlotTime(12, "14:30", "15:00"));
        dao.add(new SlotTime(13, "15:00", "15:30"));
        dao.add(new SlotTime(14, "15:30", "16:00"));
        dao.load();
        for (SlotTime s : dao.getAll()) {
            System.out.println(s);
        }
    }

}
