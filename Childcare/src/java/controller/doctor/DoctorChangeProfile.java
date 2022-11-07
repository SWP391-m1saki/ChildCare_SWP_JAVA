/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.doctor;

import DAL.UserDAO;
import Models.User;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.time.LocalDate;

/**
 *
 * @author ADMIN
 */
public class DoctorChangeProfile extends HttpServlet {

    UserDAO userDAO;

    @Override
    public void init() {
        userDAO = new UserDAO();
        userDAO.load();
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
            out.println("<title>Servlet DoctorChangeProfile</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet DoctorChangeProfile at " + request.getContextPath() + "</h1>");
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
        request.getRequestDispatcher("../Views/doctor/doctor-change-profile.jsp").forward(request, response);
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
        HttpSession session = request.getSession();
        String name = request.getParameter("name");

        LocalDate dob = LocalDate.parse(request.getParameter("dob"));
        String phoneNumber = request.getParameter("phoneNumber");
        String address = request.getParameter("address");
        boolean gender = request.getParameter("gender") != null ? request.getParameter("gender").equals("Male") : true;
        String avatar = request.getParameter("avatar");
        LocalDate now = LocalDate.now();
        if (!Utils.Utility.validateString(phoneNumber, "(84|0[3|5|7|8|9])+([0-9]{8})")) {
            request.setAttribute("mess", "Số điện thoại không hợp lệ");
            request.getRequestDispatcher("../Views/doctor/doctor-change-profile.jsp").forward(request, response);
        } else if (address.length() > 250) {
            request.setAttribute("mess", "Địa chỉ quá dài, địa chỉ phải có độ dài ít hơn 250 ký tự");
            request.getRequestDispatcher("../Views/doctor/doctor-change-profile.jsp").forward(request, response);
        } else if ((now.getYear() - dob.getYear()) <= 18) {
            request.setAttribute("mess", "Tuổi không hợp lệ");
            request.getRequestDispatcher("../Views/doctor/doctor-change-profile.jsp").forward(request, response);
        } else {
            User user = (User) session.getAttribute("UserLogined");
            if (avatar != null && avatar.length() > 0) {
                user.setAvatar(avatar);
            }
            user.setName(name);
            user.setDob(dob);
            user.setPhoneNumber(phoneNumber);
            user.setAddress(address);
            userDAO.update(user);
            userDAO.load();
            response.sendRedirect("schedule");
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
