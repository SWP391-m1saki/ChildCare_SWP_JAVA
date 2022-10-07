package Controllers;

import DAL.DAO;
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
public class LoginController extends HttpServlet {
 
    private UserDAO dao;
    
    public void init(){

        dao = new UserDAO();

    }
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        System.out.println("Hello");
       dao.load();
       request.setAttribute("UserDAO", dao.getAll());
       request.getRequestDispatcher("Views/login.jsp").forward(request, response);
    }

   
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
         try{
            LOGIN(request, response);
        }catch(Exception ex){
            ex.printStackTrace();
        }
    }

    private void LOGIN(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException
    {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        System.out.print("Hello");
        HttpSession session = request.getSession();
        
        User userLogin = dao.ValidateLogin(username, password);
        
        if(userLogin !=null){
            if(userLogin.getStatus() == 1){
                session.setAttribute("UserLogined", userLogin);
                response.sendRedirect("loadHomePage");
                //request.getRequestDispatcher("loadHomePage").forward(request, response);
                System.out.println("HELLO");
            }
            else if (userLogin.getStatus()  == 0){
                request.setAttribute("UserDAO", dao);
                request.setAttribute("NOTIFICATION", "This account is inactive! ");
                request.getRequestDispatcher("Views/login.jsp").forward(request, response);
                System.out.println("inactive");
            }
        }
        else{
            request.setAttribute("UserDAO", dao);
            request.setAttribute("NOTIFICATION", "Wrong username or password");
            request.getRequestDispatcher("Views/login.jsp").forward(request, response);
            System.out.println("wrong");
        }
    }

}
