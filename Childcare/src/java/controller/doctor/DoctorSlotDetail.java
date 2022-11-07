/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.doctor;

import DAL.AppointmentDAO;
import DAL.DepartmentDAO;
import Models.Appointment;
import Models.Slot;
import Models.User;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;

/**
 *
 * @author Admin
 */
public class DoctorSlotDetail extends HttpServlet {

    AppointmentDAO appointmentDAO;

    @Override
    public void init() {
        appointmentDAO = new AppointmentDAO();
    }

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
        User loggedInUser = (User) request.getSession().getAttribute("UserLogined");
        if (loggedInUser != null) {
            int slotId = Utils.Utility.parseIntParameter(request.getParameter("id"), -1);
            Slot slot = new Slot();
            slot.setSlotId(slotId);
            List<Appointment> appointments = appointmentDAO.getAppointmentOfSlot(slot);
            if (appointments.isEmpty()) {
                response.sendRedirect("../schedule");
            } else {
                request.setAttribute("appointments", appointments);
                request.getRequestDispatcher("../../Views/doctor/doctor-slot-detail.jsp").forward(request, response);
            }

        } else {
            response.sendRedirect("../../loadHomePage");
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
        User loggedInUser = (User) request.getSession().getAttribute("UserLogined");
        if (loggedInUser != null) {
            int appId = Utils.Utility.parseIntParameter(request.getParameter("appId"), -1);
            appointmentDAO.updateStatus(appId, 1);
            int slotId = Utils.Utility.parseIntParameter(request.getParameter("id"), -1);
            response.sendRedirect("detail?id=" + slotId);
        } else {
            response.sendRedirect("../../loadHomePage");
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