
package Controllers;

import DAL.DoctorProfileDAO;
import DAL.FeedbackDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class loadHomePage extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet loadHomePage</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet loadHomePage at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }
    final DoctorProfileDAO daoDoctor = new DoctorProfileDAO();
    final FeedbackDAO daoFeedback = new FeedbackDAO();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        daoDoctor.load();
        request.setAttribute("doctors", daoDoctor.getAll());
        daoFeedback.load();
        request.setAttribute("feedbacks", daoFeedback.getAll());
        request.getRequestDispatcher("Views/index.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
