/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.manager;

import DAL.DoctorProfileDAO;
import DAL.UserDAO;
import Models.DoctorProfile;
import Models.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.time.LocalDate;

/**
 * @author Admin
 */
public class CreateDoctor extends HttpServlet {

    UserDAO userDAO;
    DoctorProfileDAO doctorDAO;

    @Override
    public void init() {
        userDAO = new UserDAO();
        doctorDAO = new DoctorProfileDAO();
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
        //default password
        String defaultPass = "123456789";
        request.setAttribute("defaultPass", defaultPass);
        request.getRequestDispatcher("../../Views/manager/createDoctor.jsp").forward(request, response);
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
        String defaultPass = "123456789";
        request.setAttribute("defaultPass", defaultPass);
        userDAO.load();
        String name = request.getParameter("fullname");
        String gmail = request.getParameter("gmail");
        LocalDate dob = LocalDate.parse(request.getParameter("dob"));
        LocalDate now = LocalDate.now();
        boolean gender = request.getParameter("gender").equals("Male");
        String phoneNumber = request.getParameter("phone");
        String address = request.getParameter("address");
        String avatar = request.getParameter("avatar");
        if (!Utils.Utility.validateString(gmail, "^[\\w-\\.]+@([\\w-]+\\.)+[\\w-]{2,4}$")) {
            request.setAttribute("mess", "Email không hợp lệ");
            request.getRequestDispatcher("../../Views/manager/createDoctor.jsp").forward(request, response);
        } else if (userDAO.EmailDuplicate(gmail)) {
            request.setAttribute("mess", "Email đã tồn tại");
            request.getRequestDispatcher("../../Views/manager/createDoctor.jsp").forward(request, response);
        } else if (!Utils.Utility.validateString(phoneNumber, "(84|0[3|5|7|8|9])+([0-9]{8})")) {
            request.setAttribute("mess", "Số điện thoại không hợp lệ");
            request.getRequestDispatcher("../../Views/manager/createDoctor.jsp").forward(request, response);
        } else if (address.length() > 250) {
            request.setAttribute("mess", "Địa chỉ quá dài, địa chỉ phải có độ dài ít hơn 250 ký tự");
            request.getRequestDispatcher("../../Views/manager/createDoctor.jsp").forward(request, response);
        } else if ((now.getYear() - dob.getYear()) <= 23) {
            request.setAttribute("mess", "Tuổi không hợp lệ");
            request.getRequestDispatcher("../../Views/manager/createDoctor.jsp").forward(request, response);
        } else {
            //default-role: 3 - doctor
            //default-status: 4 - verified
            userDAO.addDoctorAccount(new User(gmail, defaultPass, name, gender, dob, 3, phoneNumber, address, avatar, 1));
            userDAO.load();
            User user = userDAO.ValidateLogin(gmail, "123456789");
            if (user != null) {
                doctorDAO.add(new DoctorProfile(user.getId(), "", "", 0, 1, "Bác sĩ", user));
                response.sendRedirect("profile/update?id=" + user.getId());
            } else {
                request.getRequestDispatcher("../../Views/manager/createDoctor.jsp").forward(request, response);
            }
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
