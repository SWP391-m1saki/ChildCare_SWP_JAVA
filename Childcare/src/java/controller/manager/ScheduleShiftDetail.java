/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.manager;

import DAL.DepartmentDAO;
import DAL.ShiftDAO;
import Models.DoctorProfile;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

/**
 * @author Admin
 */
public class ScheduleShiftDetail extends HttpServlet {

    ShiftDAO shiftDAO;
    DepartmentDAO departmentDAO;

    @Override
    public void init() {
        shiftDAO = new ShiftDAO();
        departmentDAO = new DepartmentDAO();
        shiftDAO.load();
    }

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request  servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException      if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ScheduleShiftDetail</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ScheduleShiftDetail at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
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
        int week_number = Utils.Utility.parseIntParameter(request.getParameter("weeknum"), Utils.Utility.getCurrentWeekNumber());
        String shift_string = request.getParameter("shift");
        if (shift_string != null) {
            int dayOfWeek = Utils.Utility.parseIntParameter(shift_string.substring(1), 1);
            boolean isMorningShift = shift_string.startsWith("S");
            int depId = Utils.Utility.parseIntParameter(request.getParameter("depId"), -1);
            if (depId != -1) {
                request.setAttribute("depId", depId);
            }
            request.setAttribute("weeknum", week_number);
            request.setAttribute("shift", shift_string);
            List<DoctorProfile> work_doctors = shiftDAO.getDoctorListOfShift(week_number, dayOfWeek, isMorningShift, depId);
            request.setAttribute("work_doctors", work_doctors);
            request.setAttribute("departments", departmentDAO.getAllHashMap());
            request.getRequestDispatcher("../../Views/manager/schedule-shift-detail.jsp").forward(request, response);
        } else {
            response.sendRedirect("../schedule");
        }
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
