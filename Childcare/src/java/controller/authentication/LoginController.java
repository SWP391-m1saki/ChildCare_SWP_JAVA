package controller.authentication;

import DAL.DAO;
import DAL.UserDAO;
import Models.User;
import Models.sendEmail;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 *
 * @author Misaki
 */
@SuppressWarnings("InstantiationOfUtilityClass")
public class LoginController extends HttpServlet {

    private UserDAO dao;

    public void init() {

        dao = new UserDAO();

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        //System.out.println("Hello");
        request.getRequestDispatcher("Views/Customers/login.jsp").forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            dao.load();
            LOGIN(request, response);
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }

    private void LOGIN(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String email = request.getParameter("email").toString().trim();
        String password = request.getParameter("password").toString().trim();
        //System.out.print("Hello");
        HttpSession session = request.getSession();

        User userLogin = dao.ValidateLogin(email, password);

        if (userLogin != null) {
            if (userLogin.getStatus() == 0) {
                sendEmail sm = new sendEmail();
                String code = sm.getRandom();
                boolean test = sm.SendEmail(email, code);
                if (test) {
                    if (session.getAttribute("verifying") != null) {
                        session.removeAttribute("verifying");
                    }
                    session.setAttribute("verifying", code);
                    if (session.getAttribute("verifyingEmail") != null) {
                        session.removeAttribute("verifyingEmail");
                    }
                    session.setAttribute("verifyingEmail", email);
                    request.setAttribute("register", true);
                    request.getRequestDispatcher("Views/Customers/Verify.jsp").forward(request, response);
                } else {
                    response.sendRedirect("loadHomePage");
                }
            } else if (userLogin.getStatus() == 1) {
                String remember = request.getParameter("remember");
                if (remember != null) {
                    Cookie cEmail = new Cookie("cookEmail", email);
                    Cookie cPass = new Cookie("cookPass", password);
                    Cookie cRemember = new Cookie("cookRemember", remember);
                    cEmail.setMaxAge(60 * 60 * 24);// 1 day
                    cPass.setMaxAge(60 * 60 * 24);
                    cRemember.setMaxAge(60 * 60 * 24);
                    response.addCookie(cEmail);
                    response.addCookie(cPass);
                    response.addCookie(cRemember);
                }
                session.setAttribute("UserLogined", userLogin);
                response.sendRedirect("loadHomePage");
                //request.getRequestDispatcher("loadHomePage").forward(request, response);
                //System.out.println("HELLO");
            } else if (userLogin.getStatus() == 2) {
                request.setAttribute("UserDAO", dao);
                request.setAttribute("NOTIFICATION", "This account is inactive! ");
                request.getRequestDispatcher("Views/Customers/login.jsp").forward(request, response);
                //System.out.println("inactive");
            }
        } else {
            request.setAttribute("UserDAO", dao);
            request.setAttribute("NOTIFICATION", "Wrong username or password");
            request.getRequestDispatcher("Views/Customers/login.jsp").forward(request, response);
            //System.out.println("wrong");
        }
    }

}
