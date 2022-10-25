/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;

import Models.*;
import java.sql.Date;
import java.time.DayOfWeek;
import java.time.LocalDate;
import java.time.Year;
import java.time.temporal.IsoFields;
import java.time.temporal.TemporalAdjusters;
import java.time.temporal.WeekFields;
import java.util.Calendar;
import java.util.List;
import java.util.Locale;

/**
 *
 * @author Admin
 */
@SuppressWarnings("WriteOnlyObject")
public class testData {

    public static void main(String[] args) {
        SlotDAO dao = new SlotDAO();
        for(DoctorProfile d : dao.getDoctorListOfShift(44, 2, true)) {
            System.out.println(d);
        }
    }
    
    private static void getSlotData(){
        SlotDAO dao = new SlotDAO();
        dao.add(new Slot(LocalDate.now().plusDays(1), true, 0, 1, 39));
        dao.add(new Slot(LocalDate.now().plusDays(1), true, 0, 1, 50));
        dao.add(new Slot(LocalDate.now().plusDays(1), true, 0, 9, 40));
        dao.add(new Slot(LocalDate.now().plusDays(2), true, 0, 9, 52));
        dao.load();
        for(Slot s : dao.getAll()) {
            System.out.println(s);
        }
    }
    
    private static void getSlotTimeData(){
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
