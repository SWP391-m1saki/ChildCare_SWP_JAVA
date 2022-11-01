package Controllers;

import DAL.ChildrenProfileDAO;
import Models.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

/**
 * @author Misaki
 */
public class LoadChildrenProfile extends HttpServlet {


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        ChildrenProfileDAO dao = new ChildrenProfileDAO();
        dao.load();
        HttpSession session = request.getSession();
        User userLogined = (User) session.getAttribute("UserLogined");
        request.setAttribute("ChildrenList", dao.getChildrenOfUser(userLogined.getId()));
        request.getRequestDispatcher("Views/Customers/loadChildrenProfile.jsp").forward(request, response);
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}
