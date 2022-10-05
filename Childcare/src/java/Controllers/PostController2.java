/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controllers;

import Utils.Utility;
import DAL.CategoryDAO;
import DAL.PostDAO;
import Models.Post;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.SQLException;

/**
 *
 * @author ADMIN
 */
public class PostController2 extends HttpServlet {

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
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet PostController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet PostController at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        postDao.load();
        categoryDao.load();
        request.setAttribute("PostList", postDao.getAll());
        request.setAttribute("CategoryPost", categoryDao.getAll());
        String action = request.getServletPath();
        System.out.println(action);
        request.getRequestDispatcher("../../Views/manager/createPost.jsp").forward(request, response);

        try {
            switch (action) {
                case "/manager/post/create":
                    //createPost(request, response);
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
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
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
        post.setDescription("123456789");
//        post.setCateId(Integer.parseInt(request.getParameter("category")));
        post.setCateId(1);
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
        Post post = new Post();
        post.setPostId(1);
        post.setTitle(request.getParameter("title"));
        post.setCateId(Integer.parseInt(request.getParameter("category")));
        post.setDetail(request.getParameter("content"));
        post.setImage(request.getParameter("image"));
        postDao.update(post);
    }

    private void deletePost(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        
        //get postId from URL, default value = -1
        int postId = Utility.parseIntParameter(request.getParameter("id"), -1);
        postDao.load();
        Post post = postDao.get(postId);

        //check if post exist
        if(post == null){
            //Hien thi message
             // chuyen ve manager/post
        } else {
            //update
            //chuyen to manager/post
        }
        
        post.setPostId(1);
        postDao.delete(post);
    }

    private void fetchPost(HttpServletRequest request, HttpServletResponse response) 
            throws SQLException, ServletException, IOException {
        
        //request.setAttribute, this);
        
    }

}