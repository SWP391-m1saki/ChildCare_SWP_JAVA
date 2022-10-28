package Controllers;

import DAL.DoctorProfileDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class loadDoctorDetail extends HttpServlet {

    DoctorProfileDAO daoDoctor;

    @Override
    public void init() {
        daoDoctor = new DoctorProfileDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = 0;
        try {
            id = Integer.parseInt(getServletContext().getAttribute("ChoosedDoctorId").toString());
            request.setAttribute("doctors", daoDoctor.get(id));
            request.getRequestDispatcher("Views/Guests/doctor-profile-detail.jsp").forward(request, response);
            System.out.println(id);
        } catch (Exception e) {
            response.sendRedirect("loadHomePage");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

}
