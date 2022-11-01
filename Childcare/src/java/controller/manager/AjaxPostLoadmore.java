/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.manager;

import DAL.CategoryDAO;
import DAL.PostDAO;
import Models.Post;
import Utils.Utility;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

/**
 * @author Admin
 */
public class AjaxPostLoadmore extends HttpServlet {

    PostDAO postDao;
    CategoryDAO categoryDao;

    @Override
    public void init() {
        postDao = new PostDAO();
        categoryDao = new CategoryDAO();
    }

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">

    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request  servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException      if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request  servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException      if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int cateId = Utility.parseIntParameter(request.getParameter("cid"), -1);
        String searchTxt = request.getParameter("search");
        int currentLoad = Utility.parseIntParameter(request.getParameter("currentLoad"), -1);
        int numberOfFetch = 6;
        List<Post> postList = postDao.loadMoreWithFilter(currentLoad, numberOfFetch, searchTxt, cateId);

        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            for (Post post : postList) {
                out.println("<div class=\"post col-xl-6 col-lg-6\">\n"
                        + "                                <div class=\"bg-light rounded overflow-hidden\" style=\"height: 460px\">\n"
                        + "                                    <a href=\"bai-viet?id=" + post.getPostId() + "\">\n"
                        + "                                        <img class=\"img-fluid w-100\" style=\"aspect-ratio: 3 / 2;\" src=\"img/" + post.getImage() + "\" alt=\"\">\n"
                        + "\n"
                        + "                                    </a>\n"
                        + "                                    <div class=\"p-4\">\n"
                        + "                                        <a class=\"h3 d-block mb-3 post-title\" href=\"bai-viet?id=" + post.getPostId() + "\">" + post.getTitle() + "</a>\n"
                        + "                                        <p class=\"m-0 post-description\" style=\"max-height: 100px;\n"
                        + "                                            white-space: normal;\n"
                        + "                                           overflow: hidden;\n"
                        + "                                           text-overflow: ellipsis;\n"
                        + "                                           color: #464646;\n"
                        + "                                           \">" + post.getDescription() + "</p>\n"
                        + "                                    </div>\n"
                        + "                                </div>\n"
                        + "                            </div>");
            }
        }

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
