package Controllers;

import DAL.DoctorProfileDAO;
import DAL.FeedbackDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class loadDoctorDetail extends HttpServlet {

    

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    DoctorProfileDAO daoDoctor;
    FeedbackDAO daoFeedback;
    @Override
    public void init() {
        daoDoctor = new DoctorProfileDAO();
        daoFeedback = new FeedbackDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        //daoDoctor.load();
        daoFeedback.load();
        request.setAttribute("feedbacks",daoFeedback.getByDoctorId(id));
        request.setAttribute("doctors", daoDoctor.get(id));
        request.getRequestDispatcher("Views/Guests/doctor-profile-detail.jsp").forward(request, response);
    }

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
