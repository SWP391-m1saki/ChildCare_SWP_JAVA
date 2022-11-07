package controller.guest;

import DAL.CategoryDAO;
import DAL.DoctorProfileDAO;
import DAL.FeedbackDAO;
import DAL.PostDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;

public class loadHomePage extends HttpServlet {

    PostDAO postDao;
    CategoryDAO categoryDao;
    DoctorProfileDAO daoDoctor;
    FeedbackDAO daoFeedback;

    @Override
    public void init() {
        postDao = new PostDAO();
        categoryDao = new CategoryDAO();
        daoDoctor = new DoctorProfileDAO();
        daoFeedback = new FeedbackDAO();
        daoDoctor.load();
        daoFeedback.load();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setAttribute("doctors", daoDoctor.getAll());
        request.setAttribute("feedbacks", daoFeedback.getAll());
        request.setAttribute("postList", postDao.loadMoreWithFilter(0, 3, "", -1));
        request.getRequestDispatcher("Views/index.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
