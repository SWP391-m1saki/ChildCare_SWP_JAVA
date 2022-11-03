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
import java.time.LocalDate;
import java.util.List;

/**
 *
 * @author Misaki
 */
@SuppressWarnings("FieldCanBeLocal")
public class UserProfileController extends HttpServlet {

    private UserDAO dao;

    public void init() {
        dao = new UserDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("Views/Customers/editProfile.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String name = request.getParameter("name");
        Boolean gender = request.getParameter("gender").equals("male");
        String phoneNumber = request.getParameter("phonenumber");
        LocalDate dob;
        try {
            dob = LocalDate.parse(request.getParameter("dob"));
        }catch(Exception ex){
            dob = null;
        }
        String address = request.getParameter("address");
        
        HttpSession session = request.getSession();
        User newUser = (User)session.getAttribute("UserLogined");
        
        newUser.setName(name);
        newUser.setGender(gender);
        newUser.setPhoneNumber(phoneNumber);
        newUser.setDob(dob);
        newUser.setAddress(address);
        
        dao.update(newUser);
        session.setAttribute("UserLogined", newUser);
        request.getRequestDispatcher("Views/Customers/editProfile.jsp").forward(request, response);
    }

}
