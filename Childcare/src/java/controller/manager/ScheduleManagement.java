/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.manager;

import DAL.ShiftDAO;
import Models.Shift;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

/**
 * @author Admin
 */
public class ScheduleManagement extends HttpServlet {

    ShiftDAO shiftDAO;

    @Override
    public void init() {
        shiftDAO = new ShiftDAO();
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
        int selectedWeek = Utils.Utility.parseIntParameter(request.getParameter("selectWeek"), Utils.Utility.getCurrentWeekNumber());
        request.setAttribute("selectedWeek", selectedWeek);

        List<Shift> shiftsOfWeek = shiftDAO.getShiftsOfWeek(selectedWeek);

        //CHECK if the week has been schedule
        if (!shiftsOfWeek.isEmpty()) { // IF TRUE
            request.setAttribute("hadScheduled", "true");
            ArrayList<String> morningShifts = new ArrayList<>();
            for (int i = 1; i <= 7; i++) {
                morningShifts.add(String.valueOf(shiftDAO.numOfWorkDoctorOfShift(shiftsOfWeek, i, true)));
            }
            ArrayList<String> afternoonShifts = new ArrayList<>();
            for (int i = 1; i <= 7; i++) {
                afternoonShifts.add(String.valueOf(shiftDAO.numOfWorkDoctorOfShift(shiftsOfWeek, i, false)));
            }
            request.setAttribute("morningShifts", morningShifts);
            request.setAttribute("afternoonShifts", afternoonShifts);
        }

        request.getRequestDispatcher("../Views/manager/doctor-scheduling.jsp").forward(request, response);
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
        processRequest(request, response);
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
        int selectedWeek = Utils.Utility.parseIntParameter(request.getParameter("selectWeek"), Utils.Utility.getCurrentWeekNumber());
        request.setAttribute("selectedWeek", selectedWeek);

        String isMappingSchedule = request.getParameter("mapping-schedule");
        if (isMappingSchedule != null && isMappingSchedule.equalsIgnoreCase("true")) {
            shiftDAO.mappingDoctorScheduleToWeek(selectedWeek);
        }

        List<Shift> shiftsOfWeek = shiftDAO.getShiftsOfWeek(selectedWeek);

        //CHECK if the week has been schedule
        if (!shiftsOfWeek.isEmpty()) { // IF TRUE
            request.setAttribute("hadScheduled", true);
            ArrayList<String> morningShifts = new ArrayList<>();
            for (int i = 1; i <= 7; i++) {
                morningShifts.add(String.valueOf(shiftDAO.numOfWorkDoctorOfShift(shiftsOfWeek, i, true)));
            }
            ArrayList<String> afternoonShifts = new ArrayList<>();
            for (int i = 1; i <= 7; i++) {
                afternoonShifts.add(String.valueOf(shiftDAO.numOfWorkDoctorOfShift(shiftsOfWeek, i, false)));
            }
            request.setAttribute("morningShifts", morningShifts);
            request.setAttribute("afternoonShifts", afternoonShifts);
        }
        request.getRequestDispatcher("../Views/manager/doctor-scheduling.jsp").forward(request, response);
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