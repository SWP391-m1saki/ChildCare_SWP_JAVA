/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.manager;

import DAL.CategoryDAO;
import DAL.PostDAO;
import Models.PageInfo;
import Models.Post;
import Models.PostCategory;
import Utils.Utility;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.text.SimpleDateFormat;
import java.util.List;

/**
 *
 * @author Admin
 */
public class AjaxPostList extends HttpServlet {

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
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
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
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        //cateogry
        int cateId = Utility.parseIntParameter(request.getParameter("cid"), -1);

//        //PAGING
        int[] availPageSize = {5, 10, 20};
        String searchTxt = request.getParameter("search");
        List<Post> filteredPosts = postDao.getPostBySearchAndCategory(searchTxt, cateId);
        PageInfo page = new PageInfo();
        page.pagination(request, filteredPosts, availPageSize);

        List<Post> postList = postDao.getPostsByPage(page, filteredPosts);

        try ( PrintWriter out = response.getWriter()) {
            if (request.getServletPath().equals("/AjaxPostList")) {
                if (!postList.isEmpty()) {
                    String s = "";
                    s += "<div class=\"table-responsive\">\n"
                            + "                                    <table class=\"table table-hover\">\n"
                            + "                                        <thead>\n"
                            + "                                            <tr>\n"
                            + "                                                <th>B??i vi???t</th>\n"
                            + "                                                <th>Ti??u ?????</th>\n"
                            + "                                                <th>Chuy??n m???c</th>\n"
                            + "                                                <th>Ng??y vi???t</th>\n"
                            + "                                                <th class=\"text-end\"> H??nh ?????ng </th>\n"
                            + "                                            </tr>\n"
                            + "                                        </thead>\n"
                            + "                                        <tbody>\n";
                    for (Post p : postList) {
                        s += "<tr>\n"
                                + "                                                    <td>\n"
                                + "                                                        <a href=\"#\" class=\"itemside\">\n"
                                + "                                                            <img src=\"../img/" + p.getImage() + "\" class=\"img-lg image p-1\" alt=\"???nh b??i vi???t\" id=\"show-avatar\">\n"
                                + "                                                        </a>\n"
                                + "                                                    </td>\n"
                                + "                                                    <td>\n"
                                + "                                                        <div style=\"max-width: 430px\">\n"
                                + "                                                            <h4>" + p.getTitle() + "</h4>\n"
                                + "                                                            <p style=\"\n"
                                + "                                                               max-height: 100px;\n"
                                + "                                                               white-space: normal;\n"
                                + "                                                               overflow: hidden;\n"
                                + "                                                               text-overflow: ellipsis;\n"
                                + "                                                               \">" + p.getDescription() + "</p>\n"
                                + "                                                        </div>\n"
                                + "                                                    </td>\n"
                                + "                                                    <td class=\"fw-bold\">\n";
                        for (PostCategory c : categoryDao.getAll()) {
                            if (c.getCateId() == p.getCateId()) {
                                s += c.getCateName();
                            }
                        }
                        s += "                                                    </td>\n"
                                + "                                                    <td>\n"
                                + (new SimpleDateFormat("dd/MM/yyyy")).format(p.getCreatedAt())
                                + "                                                        </td>\n"
                                + "                                                        <td class=\"text-end\">\n"
                                + "                                                            <div class=\"mb-2\">\n"
                                + "                                                                <a href=\"../bai-viet?id=" + p.getPostId() + "\" class=\"btn btn-light\">Chi ti???t</a>\n"
                                + "                                                        </div>\n"
                                + "                                                        <div class=\"mb-2\">\n"
                                + "                                                            <a class=\"btn btn-secondary\" href=\"../manager/post/update?id=" + p.getPostId() + "\">Ch???nh s???a</a>\n"
                                + "                                                            <a class=\"btn btn-danger\"  onclick=\"return confirm('B???n c?? ch???c ch???n mu???n x??a?')\" href=\"../manager/post/update?id=" + p.getPostId() + "\">X??a</a>\n"
                                + "                                                        </div>\n"
                                + "                                                    </td>\n"
                                + "                                                </tr>\n";
                    }
                    s += "  </tbody>\n"
                            + "                                    </table> <!-- table-responsive.// -->\n"
                            + "                            </div>";
                    out.println(s);
                } else {
                    out.println("<h3>Kh??ng c?? b??i vi???t n??o</h3>\n");
                }
            } else {
                String s;
                if (postList.isEmpty()) {
                    s = "<form method=\"post\" id=\"main-form\">\n"
                            + "                            </form>";
                } else {
                    s = " <form method=\"POST\" id=\"main-form\">"
                            + "        <div id=\"pagger\" class=\"pagger\"></div>\n"
                            + "        <div class=\"nrpp\">\n"
                            + "            <select name=\"pagesize\" onchange=\"this.form.submit()\">\n";
                    for (int i = 0; i < availPageSize.length; i++) {
                        s += "<option value=\"" + availPageSize[i] + "\" " + (page.getPagesize() == availPageSize[i] ? "selected" : "") + ">" + availPageSize[i] + "</option>\n";
                    }

                    s += "            </select>\n"
                            + "            <span>Hi???n th??? " + ((page.getPageindex() - 1) * page.getPagesize() + 1) + " ???\n"
                            + "                " + ((page.getTotalrecords() < page.getPageindex() * page.getPagesize()) ? page.getTotalrecords() : page.getPageindex() * page.getPagesize()) + "\n"
                            + "                trong " + page.getTotalrecords() + " k???t qu???</span>\n"
                            + "            <p class=\"result-count\">\n"
                            + "            </p>\n"
                            + "            <input type=\"hidden\" name=\"pageindex\" value=\"" + page.getPageindex() + "\">\n"
                            + "            <input type=\"hidden\" name=\"totalpage\" value=\"" + page.getTotalpage() + "\">\n"
                            + "        </div>\n"
                            + "    </form>";
                }
                out.println(s);
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
