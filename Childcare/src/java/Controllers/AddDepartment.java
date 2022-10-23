package Controllers;

import DAL.DepartmentDAO;
import Models.Department;
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
public class AddDepartment extends HttpServlet {

    private DepartmentDAO dao;

    public void init() {
        dao = new DepartmentDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        dao.load();
        request.setAttribute("departmentList", dao.getAll());
        request.getRequestDispatcher("Views/manager/addDepartment.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String name = request.getParameter("name");
        String image = request.getParameter("img");
        if (name.equals("")) {
            request.setAttribute("departmentList", dao.getAll());
            request.getRequestDispatcher("Views/manager/addDepartment.jsp").forward(request, response);
        } //System.out.println(name);
        //System.out.println(image);
        else {
            dao.add(new Department(0, name, image));
            dao.load();
            request.setAttribute("departmentList", dao.getAll());
            request.getRequestDispatcher("Views/manager/addDepartment.jsp").forward(request, response);
        }
    }

}
