package Controllers;

import DAL.DepartmentDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 *
 * @author Misaki
 */
public class ChooseDepartment extends HttpServlet {

    private DepartmentDAO dao;
    public void init(){
        dao = new DepartmentDAO();
    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        dao.load();
        request.setAttribute("departmentList", dao.getAll());
        request.getRequestDispatcher("Views/Customers/chooseDepartment.jsp").forward(request, response);
    }

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    }

    

}
