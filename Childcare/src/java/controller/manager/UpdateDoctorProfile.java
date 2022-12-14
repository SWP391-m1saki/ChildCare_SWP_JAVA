/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.manager;

import DAL.DepartmentDAO;
import DAL.DoctorProfileDAO;
import DAL.UserDAO;
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
    
    UserDAO userDAO;
    DepartmentDAO departmentDAO;
    DoctorProfileDAO doctorProfileDAO;

    @Override
    public void init() {
        userDAO = new UserDAO();
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
        userDAO.load();
        int doctorId = Utils.Utility.parseIntParameter(request.getParameter("id"), -1);
        if (doctorId == -1 || doctorProfileDAO.get(doctorId) == null) {
            response.sendRedirect("../profile");
        } else {
            request.setAttribute("doctorName", userDAO.get(doctorId));
            request.setAttribute("doctorProfile", doctorProfileDAO.get(doctorId));
            request.setAttribute("departments", departmentDAO.getAllHasMap());
            request.getRequestDispatcher("../../../Views/manager/updateDoctorProfile.jsp").forward(request, response);
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
        DoctorProfile doctor = new DoctorProfile();
        int doctorId = Utils.Utility.parseIntParameter(request.getParameter("id"), -1);
        double price = Utils.Utility.parseDoubleParameter(request.getParameter("price"), -1);
        String qualification = request.getParameter("qualification");
        String description = request.getParameter("description");
        String title = request.getParameter("title");
        if (price <= 0) {
            request.setAttribute("mess", "Gi?? kh??ng h???p l???");
            doGet(request, response);
        } else if (qualification.length() >= 500) {
            request.setAttribute("mess", "H???c v???n v?? kinh nghi???m ph???i c?? ????? d??i b?? h??n 500");
            doGet(request, response);
        } else if (title.length() >= 50) {
            request.setAttribute("mess", "Ch???c v??? ph???i c?? ????? d??i b?? h??n 50");
            doGet(request, response);
        } else {
            doctor.setDoctorId(doctorId);
            doctor.setPrice(price);
            doctor.setQualification(qualification);
            doctor.setDescription(description);
            doctor.setDepartmentId(Utils.Utility.parseIntParameter(request.getParameter("department"), -1));
            doctor.setTitle(title);
            doctorProfileDAO.update(doctor);
            response.sendRedirect("detail?id=" + doctorId);
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
