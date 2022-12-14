package Controllers;

import DAL.UserDAO;
import Models.User;
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
public class ChangePasswordController extends HttpServlet {

    private UserDAO dao;
    public void init(){
        dao = new UserDAO();
    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("Views/Customers/changePassword.jsp").forward(request, response);
    }

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String password = request.getParameter("password");
        String confirmPassword = request.getParameter("passwordConfirm");
        HttpSession session = request.getSession();
        if(!password.equals(confirmPassword)){
            request.setAttribute("NOTIFICATION", "Wrong confirm password");
            request.getRequestDispatcher("Views/Customers/changePassword.jsp").forward(request, response);
        }
        else{
            String id="";
            if(session.getAttribute("verifyingEmail") != null) id =session.getAttribute("verifyingEmail").toString();
            User userLogined = (User)session.getAttribute("UserLogined");
            if(userLogined != null){
                session.removeAttribute("UserLogined");
                id = userLogined.getEmail();
            }
           
            dao.ChangePassword(id, password);
            request.setAttribute("NOTIFICATION", "Change password successful, please login!");
            response.sendRedirect("login");
        }
    }

    

}
