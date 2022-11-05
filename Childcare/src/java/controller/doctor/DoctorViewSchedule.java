/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.doctor;

import DAL.AppointmentDAO;
import DAL.ShiftDAO;
import DAL.SlotDAO;
import Models.Appointment;
import Models.Shift;
import Models.Slot;
import Models.User;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Admin
 */
public class DoctorViewSchedule extends HttpServlet {

    ShiftDAO shiftDAO;
    SlotDAO slotDAO;
    AppointmentDAO appointmentDAO;

    @Override
    public void init() {
        shiftDAO = new ShiftDAO();
        slotDAO = new SlotDAO();
        appointmentDAO = new AppointmentDAO();
        appointmentDAO.load();
        shiftDAO.load();
        slotDAO.load();
    }

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        int selectedWeek = Utils.Utility.parseIntParameter(request.getParameter("selectWeek"), Utils.Utility.getCurrentWeekNumber());
        request.setAttribute("selectedWeek", selectedWeek);

        //fix doctorid = ? || update using session
        User loggedInUser = (User) request.getSession().getAttribute("UserLogined");
        if (loggedInUser != null) {
            int doctorId = loggedInUser.getId();

            List<Shift> shiftsOfWeek = shiftDAO.getShiftsOfWeekOfDoctor(selectedWeek, doctorId);
            List<Appointment> appointmentsOfWeek = appointmentDAO.filterAppointmentByWeek(
                    appointmentDAO.getAppointmentOfDoctor(doctorId), selectedWeek);

            //CHECK if the week has been schedule
            if (!shiftsOfWeek.isEmpty()) { // IF TRUE
                Slot[][] slotsOfWeek = new Slot[7][14];
                //morning
                for (int i = 1; i <= 7; i++) {
                    Shift shift = shiftDAO.getShiftByDay(shiftsOfWeek, i, true);
                    for (int j = 1; j <= 8; j++) {
                        if (shift == null) {
                            slotsOfWeek[i - 1][j - 1] = new Slot(-2);
                        } else {
                            //get shift status
                            Slot slot = slotDAO.getByShift(shift.getShiftId(), j);
                            if (slot != null) {
                                slot.setAppointments(appointmentDAO.filterAppointmentBySlot(appointmentsOfWeek, slot.getSlotId()));
                                slotsOfWeek[i - 1][j - 1] = slot;
                            } else {
                                slotsOfWeek[i - 1][j - 1] = new Slot(-1);
                            }
                        }
                    }
                }
                //afternoon
                for (int i = 1; i <= 7; i++) {
                    Shift shift = shiftDAO.getShiftByDay(shiftsOfWeek, i, false);
                    for (int j = 9; j <= 14; j++) {
                        if (shift == null) {
                            slotsOfWeek[i - 1][j - 1] = new Slot(-2);
                        } else {
                            //get shift status
                            Slot slot = slotDAO.getByShift(shift.getShiftId(), j);
                            if (slot != null) {
                                slot.setAppointments(appointmentDAO.filterAppointmentBySlot(appointmentsOfWeek, slot.getSlotId()));
                                slotsOfWeek[i - 1][j - 1] = slot;
                            } else {
                                slotsOfWeek[i - 1][j - 1] = new Slot(-1);
                            }
                        }
                    }
                }
                request.setAttribute("slots", slotsOfWeek);
            }
            request.getRequestDispatcher("../Views/doctor/doctor-schedule-detail.jsp").forward(request, response);
        } else {
            response.sendRedirect("../loadHomePage");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
