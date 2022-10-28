package Controllers;

import DAL.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 *
 * @author Misaki
 */
public class UserVerifyController extends HttpServlet {

    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("Views/Customers/Verify.jsp").forward(request, response);
    }

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String code = request.getParameter("VerifyCode");
        HttpSession session = request.getSession();
        String verifying = session.getAttribute("verifying").toString();
        String register="";
        try{
           register = session.getAttribute("register").toString();
           session.removeAttribute("register");
        }catch(Exception e){
            System.out.println("register nhu biu");
        }
        
        if(verifying.equals(code) && register.equals("")){
            response.sendRedirect("ChangePassword");
        }
        else if(verifying.equals(code)){
            UserDAO dao = new UserDAO();
            dao.ActiveUser(session.getAttribute("verifyingEmail").toString());
            response.sendRedirect("login");
        }
        else {
            request.setAttribute("NOTIFICATION", "Wrong code");
            request.getRequestDispatcher("Views/Customers/Verify.jsp").forward(request, response);
        }
    }

    

}
