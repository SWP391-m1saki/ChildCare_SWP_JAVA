/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.manager;

import DAL.ChangeRequestDAO;
import DAL.DoctorProfileDAO;
import Models.ChangeRequest;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.Date;
import java.time.LocalDate;

/**
 *
 * @author ADMIN
 */
public class ChangeShiftDoctor extends HttpServlet {

    ChangeRequestDAO changeRequestDAO;
    DoctorProfileDAO doctorProfileDAO;

    @Override
    public void init() {
        changeRequestDAO = new ChangeRequestDAO();
        doctorProfileDAO = new DoctorProfileDAO();
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
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ChangeShiftDoctor</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ChangeShiftDoctor at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
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
        changeRequestDAO.load();
        doctorProfileDAO.load();
        int id = Utils.Utility.parseIntParameter(request.getParameter("id"), -1);
        request.setAttribute("changeRequest", changeRequestDAO.get(id));
        request.setAttribute("doctor", doctorProfileDAO.get(changeRequestDAO.get(id).getDoctorId()));
        request.getRequestDispatcher("../../../Views/manager/process-change-shift.jsp").forward(request, response);
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
        changeRequestDAO.load();
        doctorProfileDAO.load();
        String description = request.getParameter("reponse");
        int status = Utils.Utility.parseIntParameter(request.getParameter("status"), 1);
        int id = Utils.Utility.parseIntParameter(request.getParameter("id"), -1);
        if(description.length() > 500){
            request.setAttribute("mess", "Thông tin xin nghỉ quá dài, độ dài không được vượt quá 500 kí tự");
            doGet(request, response);
        }else{
            ChangeRequest cR = new ChangeRequest();
            cR.setRequestId(id);
            cR.setReponseDescription(description);
            cR.setReponseTime(Date.valueOf(LocalDate.now()));
            cR.setStatus(status);
            changeRequestDAO.update(cR);
            response.sendRedirect("../../../manager/doctor/shift/list");
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
