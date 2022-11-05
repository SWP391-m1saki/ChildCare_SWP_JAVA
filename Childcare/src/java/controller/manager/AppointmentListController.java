/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.manager;

import DAL.AppointmentDAO;
import DAL.DepartmentDAO;
import DAL.ShiftDAO;
import DAL.SlotDAO;
import Models.Appointment;
import Models.PageInfo;
import Utils.Utility;
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
public class AppointmentListController extends HttpServlet {

    AppointmentDAO appointmentDAO;
    DepartmentDAO depDAO;

    @Override
    public void init() {
        appointmentDAO = new AppointmentDAO();
        depDAO = new DepartmentDAO();
        appointmentDAO.load();
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
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        /* DEPARTMENT */
        // get depID of the current  selected filter
        int depId = Utility.parseIntParameter(request.getParameter("depId"), -1);
        int appStatus = Utility.parseIntParameter(request.getParameter("appStatus"), -1);
        request.setAttribute("depId", depId);
        request.setAttribute("appStatus", appStatus);
        // send list of department
        request.setAttribute("departments", depDAO.getAll());

        //PAGING
        int[] nrppArr = {5, 10, 20};
        //loc tim kiem
        String customer_name = request.getParameter("customer_name");
        String child_name = request.getParameter("child_name");
        String doctor_name = request.getParameter("doctor_name");
        String phone_email = request.getParameter("phone_email");
        customer_name = customer_name != null ? customer_name : "";
        child_name = child_name != null ? child_name : "";
        doctor_name = doctor_name != null ? doctor_name : "";
        phone_email = phone_email != null ? phone_email : "";

        request.setAttribute("customer_name", customer_name);
        request.setAttribute("child_name", child_name);
        request.setAttribute("doctor_name", doctor_name);
        request.setAttribute("phone_email", phone_email);

        List<Appointment> filteredList = appointmentDAO.filterAppointmentExtended(customer_name, child_name, doctor_name, phone_email, depId, appStatus);
        PageInfo page = new PageInfo();
        page.pagination(request, filteredList, nrppArr);

        request.setAttribute("appointments", appointmentDAO.getAppointmentsByPage(page, filteredList));
        request.getRequestDispatcher("../Views/manager/appointment-list-manager.jsp").forward(request, response);
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
        appointmentDAO.load();
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        /* DEPARTMENT */
        // get depID of the current  selected filter
        int depId = Utility.parseIntParameter(request.getParameter("depId"), -1);
        int appStatus = Utility.parseIntParameter(request.getParameter("appStatus"), -1);
        request.setAttribute("depId", depId);
        request.setAttribute("appStatus", appStatus);
        // send list of department
        request.setAttribute("departments", depDAO.getAll());

        //PAGING
        int[] nrppArr = {5, 10, 20};
        //loc tim kiem
        String customer_name = request.getParameter("customer_name");
        String child_name = request.getParameter("child_name");
        String doctor_name = request.getParameter("doctor_name");
        String phone_email = request.getParameter("phone_email");
        customer_name = customer_name != null ? customer_name : "";
        child_name = child_name != null ? child_name : "";
        doctor_name = doctor_name != null ? doctor_name : "";
        phone_email = phone_email != null ? phone_email : "";

        request.setAttribute("customer_name", customer_name);
        request.setAttribute("child_name", child_name);
        request.setAttribute("doctor_name", doctor_name);
        request.setAttribute("phone_email", phone_email);

        List<Appointment> filteredList = appointmentDAO.filterAppointmentExtended(customer_name, child_name, doctor_name, phone_email, depId, appStatus);
        PageInfo page = new PageInfo();
        page.pagination(request, filteredList, nrppArr);

        request.setAttribute("appointments", appointmentDAO.getAppointmentsByPage(page, filteredList));
        request.getRequestDispatcher("../Views/manager/appointment-list-manager.jsp").forward(request, response);
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
