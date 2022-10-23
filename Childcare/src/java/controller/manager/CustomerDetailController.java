/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.manager;

import DAL.UserDAO;
import Models.User;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.time.LocalDate;

/**
 *
 * @author Admin
 */
public class CustomerDetailController extends HttpServlet {

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
        userDAO.load();
        int id = Utils.Utility.parseIntParameter(request.getParameter("id"), -1);
        request.setAttribute("user", userDAO.get(id));
        response.setContentType("text/html;charset=UTF-8");
        request.getRequestDispatcher("../../Views/manager/customer-detail.jsp").forward(request, response);
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
        int id = Utils.Utility.parseIntParameter(request.getParameter("id"), -1);
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        LocalDate dob = LocalDate.parse(request.getParameter("dob"));
        String phoneNumber = request.getParameter("phoneNumber");
        String address = request.getParameter("address");
        LocalDate now = LocalDate.now();
        if (!Utils.Utility.validateString(email, "^[\\w-\\.]+@([\\w-]+\\.)+[\\w-]{2,4}$")) {
            request.setAttribute("mess", "Email không hợp lệ");
            doGet(request, response);
        } else if (!Utils.Utility.validateString(phoneNumber, "(84|0[3|5|7|8|9])+([0-9]{8})")) {
            request.setAttribute("mess", "Số điện thoại không hợp lệ");
            doGet(request, response);
        } else if (address.length() > 250) {
            request.setAttribute("mess", "Địa chỉ quá dài, địa chỉ phải có độ dài ít hơn 250 ký tự");
            doGet(request, response);
        } else if ((now.getYear() - dob.getYear()) <= 18) {
            request.setAttribute("mess", "Tuổi không hợp lệ");
            doGet(request, response);
        } else {
            User user = userDAO.get(id);
            user.setId(id);
            user.setName(name);
            user.setEmail(email);
            user.setDob(dob);
            user.setPhoneNumber(phoneNumber);
            user.setAddress(address);
            userDAO.update(user);
            userDAO.load();
            response.sendRedirect("../../manager/user");
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
