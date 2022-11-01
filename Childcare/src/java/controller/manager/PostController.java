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
import java.sql.SQLException;

/**
 * @author Admin
 * @noinspection ConstantConditions
 */
public class PostController extends HttpServlet {

    PostDAO postDao;
    CategoryDAO categoryDao;

    @Override
    public void init() {
        postDao = new PostDAO();
        categoryDao = new CategoryDAO();
    }

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
        request.setAttribute("postCategory", categoryDao.getAll());
        postDao.load();
        String action = request.getServletPath();
        System.out.println(action);
        System.out.println(request.getContextPath());
        System.out.println(request.getPathInfo());
        try {
            switch (action) {
                case "/manager/post/create":
                    request.getRequestDispatcher("../../Views/manager/createPost.jsp").forward(request, response);
                    break;
                case "/manager/post/update":
                    fetchPost(request, response);
                    break;
                case "/manager/post/delete":
                    deletePost(request, response);
                    break;
            }
        } catch (Exception e) {
            throw new ServletException(e);
        }

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
        postDao.load();
        request.setAttribute("postCategory", categoryDao.getAll());
        String action = request.getServletPath();
        System.out.println(action);
        try {
            switch (action) {
                case "/manager/post/create":
                    createPost(request, response);
                    break;
                case "/manager/post/update":
                    updatePost(request, response);
                    break;
                case "/manager/post/delete":
                    deletePost(request, response);
                    break;
            }
        } catch (Exception e) {
            throw new ServletException(e);
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

    private void createPost(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        Post post = new Post();
        post.setTitle(request.getParameter("title"));
        post.setDescription(request.getParameter("description"));
        post.setCateId(Utility.parseIntParameter(request.getParameter("category"), -1));
        post.setDetail(request.getParameter("content"));
        post.setImage(request.getParameter("image"));
        postDao.add(post);
        boolean valid = true;
        if (valid) {
            //message
            request.getRequestDispatcher("../../Views/manager/createPost.jsp").forward(request, response);
        } else {
            response.sendRedirect("create");
        }
    }

    private void updatePost(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        int postId = Utility.parseIntParameter(request.getParameter("id"), -1);

        Post post = new Post();
        post.setPostId(postId);
        post.setTitle(request.getParameter("title"));
        post.setDescription(request.getParameter("description"));
        post.setCateId(Utility.parseIntParameter(request.getParameter("category"), -1));
        post.setDetail(request.getParameter("content"));
        if (request.getParameter("image") != null) {
            post.setImage(request.getParameter("image"));
        } else {
            post.setImage(postDao.get(postId).getImage());
        }

        postDao.update(post);
        request.setAttribute("post", post);
//        request.setAttribute("mess", new String[]{"success", "Chỉnh sửa bài viết thành công"});
        request.setAttribute("mess", "Chỉnh sửa bài viết thành công");
        request.getRequestDispatcher("../../Views/manager/updatePost.jsp").forward(request, response);
    }

    private void deletePost(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");

        //get postId from URL, default value = -1
        int postId = Utility.parseIntParameter(request.getParameter("id"), -1);
        Post post = postDao.get(postId);

        //check if post exist
        if (post == null) {
            //Hien thi message
            request.setAttribute("mess", new String[]{"error", "Xóa thất bại. Bài viết không tồn tại"});
        } else {
            post.setPostId(postId);
            postDao.delete(post);
            request.setAttribute("mess", new String[]{"success", "Xóa bài viết thành công"});
        }
        response.sendRedirect("../post");

    }

    //Load exist post to update form
    private void fetchPost(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, ServletException, IOException {

        int postId = Utility.parseIntParameter(request.getParameter("id"), -1);
        Post post = postDao.get(postId);
        if (post == null) {
            response.sendRedirect("../post");
        } else {
            request.setAttribute("post", post);
            request.getRequestDispatcher("../../Views/manager/updatePost.jsp").forward(request, response);
        }

    }
}
