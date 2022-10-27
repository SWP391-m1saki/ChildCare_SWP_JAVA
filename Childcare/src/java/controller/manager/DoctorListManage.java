/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.manager;

import DAL.DepartmentDAO;
import DAL.DoctorProfileDAO;
import Models.User;
import Models.DoctorProfile;
import Models.PageInfo;
import Models.Post;
import Utils.Utility;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Admin
 */
public class DoctorListManage extends HttpServlet {

    DoctorProfileDAO doctorDAO;
    DepartmentDAO departmentDAO;

    @Override
    public void init() {
        doctorDAO = new DoctorProfileDAO();
        departmentDAO = new DepartmentDAO();
        doctorDAO.load();
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
	request.setCharacterEncoding("UTF-8");
        /* DEPARTMENT */
        // get depID of the current  selected filter
        int depId = Utility.parseIntParameter(request.getParameter("depId"), -1);
        // send list of department
        request.setAttribute("departments", departmentDAO.getAllHashMap());

        //PAGING
        int[] nrppArr = {5, 10, 20};
        String searchTxt = request.getParameter("search");
        List<DoctorProfile> filteredList = doctorDAO.getDoctorBySearchAndDepId(searchTxt, depId);
        PageInfo page = new PageInfo();
        page.pagination(request, filteredList, nrppArr);

        request.setAttribute("depId", depId);
        request.setAttribute("search", searchTxt);
        request.setAttribute("doctorList", doctorDAO.getDoctorsByPage(page, filteredList));

        request.getRequestDispatcher("../../Views/manager/doctor-profile-list-manager.jsp").forward(request, response);
    }

    /**
     * Get current paging info from request, calculate, send back to request
     *
     * @param request servlet request
     * @param filteredList list to paging
     * @return PageInfo
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
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws java.io.IOException
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        /* DEPARTMENT */
        // get depID of the current  selected filter
        int depId = Utility.parseIntParameter(request.getParameter("depId"), -1);
        // send list of department
        request.setAttribute("departments", departmentDAO.getAllHashMap());

//        //PAGING
        int[] nrppArr = {5, 10, 20};
        String searchTxt = request.getParameter("search");
        List<DoctorProfile> filteredList = doctorDAO.getDoctorBySearchAndDepId(searchTxt, depId);
        PageInfo page = new PageInfo();
        page.pagination(request, filteredList, nrppArr);

        request.setAttribute("depId", depId);
        request.setAttribute("search", searchTxt);
        List<DoctorProfile> doctorList = doctorDAO.getDoctorsByPage(page, filteredList);
        request.setAttribute("doctorList", doctorList);

        request.getRequestDispatcher("../../Views/manager/doctor-profile-list-manager.jsp").forward(request, response);
        
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
