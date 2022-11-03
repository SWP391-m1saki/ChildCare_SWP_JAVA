/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.manager;

import DAL.ChangeRequestDAO;
import DAL.DoctorProfileDAO;
import Models.ChangeRequest;
import Models.PageInfo;
import Models.User;
import Utils.Utility;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;

/**
 *
 * @author ADMIN
 */
public class ChangeShiftListDoctor extends HttpServlet {

    ChangeRequestDAO changeRequestDAO;
    DoctorProfileDAO doctorProfileDAO;

    @Override
    public void init() {
        changeRequestDAO = new ChangeRequestDAO();
        doctorProfileDAO = new DoctorProfileDAO();
        changeRequestDAO.load();
        doctorProfileDAO.load();
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
        changeRequestDAO.load();
        doctorProfileDAO.load();
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        // get depID of the current  selected filter
        int status = Utility.parseIntParameter(request.getParameter("status"), -1);
        String search = request.getParameter("search");
        
        //PAGING
        int[] nrppArr = {5, 10, 20};
        List<ChangeRequest> filteredList = changeRequestDAO.getChangeRequestListByStatusAndSearch(status, search);
        PageInfo page = new PageInfo();
        page.pagination(request, filteredList, nrppArr);

        request.setAttribute("search", search);
        request.setAttribute("status", status);
        request.setAttribute("changeRequestList", changeRequestDAO.getChangeRequestByPage(page, filteredList));

        request.getRequestDispatcher("../../../Views/manager/change-shift-list.jsp").forward(request, response);
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
