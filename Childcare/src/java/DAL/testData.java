/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;

import Models.*;
import java.sql.Date;
import java.time.LocalDate;
import java.util.List;
import java.util.Map;

/**
 *
 * @author Admin
 */
@SuppressWarnings("WriteOnlyObject")
public class testData {

    public static void main(String[] args) {
        ScheduleDAO dao = new ScheduleDAO();
        Schedule shift = new Schedule();
        shift.setDoctorId(2);
        shift.setIsMorningShift(true);
        shift.setDayOfWeek("T2");
        dao.add(shift);
        System.out.println(dao.getAll().size());

    }

}
