package controller.authentication;

import DAL.UserDAO;
import Utils.sendEmail;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

/**
 * @author Misaki
 */
public class ResetPasswordController extends HttpServlet {

    private UserDAO dao;

    public void init() {
        dao = new UserDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        dao.load();
        request.setAttribute("DAO", dao);
        request.getRequestDispatcher("Views/Customers/resetPassword.jsp").forward(request, response);
    }


    @Override
    protected void doPost(HttpServletRequest request, final HttpServletResponse response)
            throws ServletException, IOException {
        String email = request.getParameter("email");
        System.out.println(email);
        if (dao.EmailDuplicate(email)) {
            sendEmail sm = new sendEmail();
            String code = new sendEmail().getRandom();
            boolean test = sm.SendEmail(email, code);
            if (test) {
                HttpSession session = request.getSession();
                if (session.getAttribute("verifying") != null) session.removeAttribute("verifying");
                session.setAttribute("verifying", code);
                if (session.getAttribute("verifyingEmail") != null) session.removeAttribute("verifyingEmail");
                session.setAttribute("verifyingEmail", email);
                response.sendRedirect("UserVerify");
            }
        }
    }


}
