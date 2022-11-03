package Controllers;

import DAL.ChildrenProfileDAO;
import Models.ChildrenProfile;
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
public class DeleteChildrenController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id;
        try {
            id = Integer.parseInt(request.getParameter("id"));
            ChildrenProfileDAO dao = new ChildrenProfileDAO();
            dao.load();
            ChildrenProfile cc = dao.get(id);
            HttpSession session = request.getSession();
            User userLogined = (User)session.getAttribute("UserLogined");
            if(cc.getParentId() == userLogined.getId()){
                dao.delete(cc);
                response.sendRedirect("loadChildren");
            } 
            else response.sendRedirect("loadHomePage");
        } catch (Exception e) {
            response.sendRedirect("loadHomePage");
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }

}
