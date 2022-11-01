/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.manager;

import DAL.ShiftDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

/**
 * @author Admin
 */
public class AjaxScheduleRemoveDoctor extends HttpServlet {

    ShiftDAO shiftDAO;

    @Override
    public void init() {
        shiftDAO = new ShiftDAO();
        shiftDAO.load();
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">

    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request  servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException      if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request  servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException      if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int doctorId = Utils.Utility.parseIntParameter(request.getParameter("doctorId"), -1);
        int week_number = Utils.Utility.parseIntParameter(request.getParameter("weeknum"), Utils.Utility.getCurrentWeekNumber());
        String shift_string = request.getParameter("shift");
        if (shift_string != null) {
            int dayOfWeek = Utils.Utility.parseIntParameter(shift_string.substring(1), 1);
            boolean isMorningShift = shift_string.startsWith("S");
            shiftDAO.removeDoctorOfShift(week_number, dayOfWeek, isMorningShift, doctorId);
        }
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
