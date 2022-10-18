/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.manager;

import DAL.DAO;
import DAL.UserDAO;
import Models.User;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

/**
 *
 * @author Admin
 */
public class CreateDoctor extends HttpServlet {

    UserDAO userDAO;

    @Override
    public void init() {
        userDAO = new UserDAO();
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
            out.println("<title>Servlet CreateDoctor</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet CreateDoctor at " + request.getContextPath() + "</h1>");
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
        //default password
        String defaultPass = "123456789";
        request.setAttribute("defaultPass", defaultPass);
        request.getRequestDispatcher("../../Views/manager/createDoctor.jsp").forward(request, response);
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
        userDAO.load();
        User doctor = new User();
        String name = request.getParameter("fullname");
        String gmail = request.getParameter("gmail");
        LocalDate dob = LocalDate.parse(request.getParameter("dob"));
        LocalDate now = LocalDate.now();
        String phoneNumber = request.getParameter("phone");
        String address = request.getParameter("address");
        if (!Utils.Utility.validateString(gmail, "^[\\w-\\.]+@([\\w-]+\\.)+[\\w-]{2,4}$")) {
            request.setAttribute("mess", "Email không hợp lệ");
            request.getRequestDispatcher("../../Views/manager/createDoctor.jsp").forward(request, response);
        } else if (userDAO.EmailDuplicate(gmail)) {
            request.setAttribute("mess", "Email lặp");
            request.getRequestDispatcher("../../Views/manager/createDoctor.jsp").forward(request, response);
        } else if (!Utils.Utility.validateString(phoneNumber, "(84|0[3|5|7|8|9])+([0-9]{8})")) {
            request.setAttribute("mess", "Số điện thoại không hợp lệ");
            request.getRequestDispatcher("../../Views/manager/createDoctor.jsp").forward(request, response);
        } else if (address.length() > 250) {
            request.setAttribute("mess", "Địa chỉ quá dài, địa chỉ phải có độ dài ít hơn 250 ký tự");
            request.getRequestDispatcher("../../Views/manager/createDoctor.jsp").forward(request, response);
        }else if((now.getYear()  - dob.getYear()) <= 23 ){
            request.setAttribute("mess", "Tuổi không hợp lệ");
            request.getRequestDispatcher("../../Views/manager/createDoctor.jsp").forward(request, response);
        }
        else {
            doctor.setName(name);
            doctor.setEmail(gmail);
            doctor.setPassword("123456789");
            doctor.setDob(dob);
            doctor.setPhoneNumber(phoneNumber);
            doctor.setAddress(address);
            userDAO.add(doctor);
            userDAO.load();
            int id = userDAO.ValidateLogin(gmail, "123456789").getId();
            response.sendRedirect("profile/update?id=" + id);
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
