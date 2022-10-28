package Controllers;

import DAL.DoctorProfileDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class loadDoctor extends HttpServlet {

   
    final DoctorProfileDAO daoDoctor = new DoctorProfileDAO();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        daoDoctor.load();
        request.setAttribute("doctors", daoDoctor.getAll());
        request.getRequestDispatcher("Views/Guests/team.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    }

   

}
