/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controllers;

import DAL.DepartmentDAO;
import DAL.DoctorProfileDAO;
import Models.DoctorProfile;
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
public class UpdateDoctorProfile extends HttpServlet {

    DepartmentDAO departmentDAO;
    DoctorProfileDAO doctorProfileDAO;

    @Override
    public void init() {
        departmentDAO = new DepartmentDAO();
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
            out.println("<title>Servlet UpdateDoctorProfile</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet UpdateDoctorProfile at " + request.getContextPath() + "</h1>");
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
        departmentDAO.load();
        doctorProfileDAO.load();
        int id = Utils.Utility.parseIntParameter(request.getParameter("id"), -1);
        request.setAttribute("doctorProfile", doctorProfileDAO.get(id));
        request.setAttribute("departments", departmentDAO.getAllHasMap());
        request.getRequestDispatcher("../../../Views/manager/updateDoctorProfile.jsp").forward(request, response);
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
        doctorProfileDAO.load();
        DoctorProfile doctor = new DoctorProfile();
        doctor.setDoctorId(Utils.Utility.parseIntParameter(request.getParameter("id"), -1));
        doctor.setPrice(Utils.Utility.parseDoubleParameter(request.getParameter("price"), -1));
        doctor.setQualification(request.getParameter("qualification"));
        doctor.setDescription("description");
        doctor.setDepartmentId(Utils.Utility.parseIntParameter("department", -1));
        doctor.setTitle(request.getParameter("title"));
        doctorProfileDAO.update(doctor);
        request.getRequestDispatcher("../../../Views/manager/updateDoctorProfile.jsp").forward(request, response);
        
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
