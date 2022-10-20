/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controllers;

import DAL.UserDAO;
import Models.User;
import Models.sendEmail;
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
 * @author Misaki
 */

public class RegisterController extends HttpServlet {

    UserDAO dao;

    public void init() {
        dao = new UserDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        dao.load();
        request.setAttribute("UserDAO", dao.getAll());
        request.getRequestDispatcher("Views/Guests/register.jsp").forward(request, response);
    }

    @Override
    @SuppressWarnings("ThrowablePrintedToSystemOut")
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            register(request, response);
        } catch (Exception e) {
            System.out.println(e);
        }
    }

    private void register(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String confirmPassword = request.getParameter("passwordConfirm");
        String name = request.getParameter("name");
        String avatar = "img/defaultAvatar.png";

        boolean b1 = password.equals(confirmPassword);
        boolean b2 = dao.EmailDuplicate(email);
        if (!b1 || b2) {
            if(!b1) request.setAttribute("NOTIFICATION", "Wrong confirm password");
            if(b2) request.setAttribute("NOTFICATION", "Email have been used!");
            request.setAttribute("email", email);
            request.setAttribute("name", name);
            request.getRequestDispatcher("Views/Guests/register.jsp").forward(request, response);
        } 
        else {
            User newUser = new User(0, email, password, name, true, null, 4, null, null, avatar, 0);
            dao.add(newUser);
            //System.out.println("concakkk");
            sendEmail sm = new sendEmail();
            String code = sm.getRandom();
            boolean test = sm.SendEmail(email, code);
            if(test){
                HttpSession session = request.getSession();
                if (session.getAttribute("verifying") != null) {
                    session.removeAttribute("verifying");
                }
                session.setAttribute("verifying", code);
                if (session.getAttribute("verifyingEmail") != null) {
                    session.removeAttribute("verifyingEmail");
                }
                session.setAttribute("verifyingEmail", email);
                request.setAttribute("register",true);
                request.getRequestDispatcher("Views/Customers/Verify.jsp").forward(request, response);
            }
            else response.sendRedirect("loadHomePage");
        }

    }

}
