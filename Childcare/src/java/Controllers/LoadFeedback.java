
package Controllers;

import DAL.FeedbackDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class LoadFeedback extends HttpServlet {
    final FeedbackDAO dao = new FeedbackDAO();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
//        dao.load();
////        request.setAttribute("feedbacks", dao.getAll());
////        request.getRequestDispatcher("Views/Guests/team.jsp").forward(request, response);
//        int id = Integer.parseInt(request.getParameter("id"));
//        //daoDoctor.load();
//        dao.load();
//        request.setAttribute("feedbacksid",dao.getByDoctorId(id));
//        response.sendRedirect("Views/Guests/feedback.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
//        int id = Integer.parseInt(request.getParameter("id"));
//        //daoDoctor.load();
//        dao.load();
//        request.setAttribute("feedbacksid",dao.getByDoctorId(id));
//        response.sendRedirect("feedback.jsp");
    }
}
