package controller.authentication;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

/**
 * @author Misaki
 */
public class LogoutController extends HttpServlet {


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Cookie cEmail = new Cookie("cookEmail", null);
        Cookie cPass = new Cookie("cookPass", null);
        Cookie cRemember = new Cookie("cookRemember", null);
        cEmail.setMaxAge(0);
        cPass.setMaxAge(0);
        cRemember.setMaxAge(0);
        response.addCookie(cEmail);
        response.addCookie(cPass);
        response.addCookie(cRemember);
        HttpSession session = request.getSession();
        session.invalidate();
        response.sendRedirect("loadHomePage");
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }


}
