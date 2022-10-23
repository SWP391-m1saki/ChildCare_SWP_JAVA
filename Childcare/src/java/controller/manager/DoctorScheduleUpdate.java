/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.manager;

import DAL.DoctorProfileDAO;
import DAL.ScheduleDAO;
import Models.DoctorProfile;
import Models.Schedule;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 *
 * @author Admin
 */
public class DoctorScheduleUpdate extends HttpServlet {

    DoctorProfileDAO doctorDAO;
    ScheduleDAO scheduleDAO;

    @Override
    public void init() {
        doctorDAO = new DoctorProfileDAO();
        scheduleDAO = new ScheduleDAO();
        scheduleDAO.load();
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
        int doctorId = Utils.Utility.parseIntParameter(request.getParameter("id"), -1);
        DoctorProfile doctor = doctorDAO.get(doctorId);
        if (doctor != null) {
            request.setAttribute("doctor", doctor);
            request.getRequestDispatcher("../../Views/manager/doctor-schedule-update.jsp").forward(request, response);
        } else {
            request.getRequestDispatcher("../../Views/manager/doctor-schedule-update.jsp").forward(request, response);
        }
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
        int doctorId = Utils.Utility.parseIntParameter(request.getParameter("id"), -1);
        String[] work_shifts = request.getParameterValues("work-shift");
        for (int i = 0; i < work_shifts.length; i++) {
            Schedule shift = new Schedule();
            shift.setDoctorId(doctorId);
            shift.setIsMorningShift(work_shifts[i].endsWith("S"));
            shift.setDayOfWeek("T" + work_shifts[i].charAt(0));
            scheduleDAO.add(shift);
        }
        request.getRequestDispatcher("../../Views/manager/doctor-schedule-update.jsp").forward(request, response);

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
