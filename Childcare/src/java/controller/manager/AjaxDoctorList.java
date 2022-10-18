/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.manager;

import DAL.DepartmentDAO;
import DAL.DoctorProfileDAO;
import Models.DoctorProfile;
import Models.PageInfo;
import Utils.Utility;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;

/**
 *
 * @author Admin
 */
public class AjaxDoctorList extends HttpServlet {

    DoctorProfileDAO doctorDAO;
    DepartmentDAO departmentDAO;

    @Override
    public void init() {
        doctorDAO = new DoctorProfileDAO();
        departmentDAO = new DepartmentDAO();
        doctorDAO.load();
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
        // get depID of the current  selected filter
        int depId = Utility.parseIntParameter(request.getParameter("depId"), -1);

//        //PAGING
        int[] nrppArr = {5, 10, 20};
        String searchTxt = request.getParameter("search");
        List<DoctorProfile> filteredList = doctorDAO.getDoctorBySearchAndDepId(searchTxt, depId);
        PageInfo page = new PageInfo();
        page.pagination(request, filteredList, nrppArr);

        List<DoctorProfile> doctorList = doctorDAO.getDoctorsByPage(page, filteredList);

        try ( PrintWriter out = response.getWriter()) {
            if (request.getServletPath().equals("/AjaxDoctorList")) {
                if (!doctorList.isEmpty()) {
                    String s = "";
                    s += "<div class=\"table-responsive\">\n"
                            + "                                        <table class=\"table table-hover\">\n"
                            + "                                            <thead>\n"
                            + "                                                <tr>\n"
                            + "                                                    <th>Bác sĩ</th>\n"
                            + "                                                    <th>Chuyên khoa</th>\n"
                            + "                                                    <th>Chức danh</th>\n"
                            + "                                                    <th class=\"text-end\"> Hành động </th>\n"
                            + "                                                </tr>\n"
                            + "                                            </thead>\n"
                            + "                                            <tbody>\n";
                    for (DoctorProfile d : doctorList) {
                        s += "<tr>\n"
                                + "                                                        <td width=\"40%\">\n"
                                + "                                                            <a href=\"../../manager/doctor/profile/detail?id=" + d.getDoctorId() + "\" class=\"itemside\">\n"
                                + "                                                                <div class=\"left\">\n"
                                + "                                                                    <img src=\"../../img/" + d.getUser().getAvatar() + "\" class=\"img-md image p-1\" alt=\"Ảnh bac si\" id=\"show-avatar\">\n"
                                + "                                                                </div>\n"
                                + "                                                                <div class=\"info pl-3\">\n"
                                + "                                                                    <h6 class=\"mb-0 title\">" + d.getUser().getName() + "</h6>\n"
                                + "                                                                </div>\n"
                                + "                                                            </a>\n"
                                + "                                                        </td>\n"
                                + "                                                        <td class=\"fw-bold\">" + departmentDAO.getAll().get(d.getDepartmentId()).getDepartmentName() + "</td>\n"
                                + "                                                        <td>\n"
                                + "                                                            " + d.getTitle() + "\n"
                                + "                                                        </td>\n"
                                + "                                                        <td class=\"text-end\">\n"
                                + "                                                            <a href=\"../../manager/doctor/profile/detail?id=" + d.getDoctorId() + "\" class=\"btn btn-light\">Chi tiết</a>\n"
                                + "                                                            <a class=\"btn btn-primary\" style=\"padding: 0.4rem\" href=\"#\">Phân việc</a>\n"
                                + "                                                        </td>\n"
                                + "</tr>\n"
                                + "\n";
                    }
                    s += "</tbody>\n"
                            + "</table> <!-- table-responsive.// -->\n";
                    out.println(s);
                } else {
                    out.println("<h3>Không có bác sĩ nào</h3>");
                }
            } else {
                String s;
                if (doctorList.isEmpty()) {
                    s = "<form method=\"post\" id=\"main-form\">\n"
                            + "                            </form>";
                } else {
                    s = " <form method=\"POST\" id=\"main-form\">"
                            + "        <div id=\"pagger\" class=\"pagger\"></div>\n"
                            + "        <div class=\"nrpp\">\n"
                            + "            <select name=\"pagesize\" onchange=\"this.form.submit()\">\n";
                    for (int i = 0; i < nrppArr.length; i++) {
                        s += "<option value=\"" + nrppArr[i] + "\" " + (page.getPagesize() == nrppArr[i] ? "selected" : "") + ">" + nrppArr[i] + "</option>\n";
                    }

                    s += "            </select>\n"
                            + "            <span>Hiển thị " + ((page.getPageindex() - 1) * page.getPagesize() + 1) + " –\n"
                            + "                " + ((page.getTotalrecords() < page.getPageindex() * page.getPagesize()) ? page.getTotalrecords() : page.getPageindex() * page.getPagesize()) + "\n"
                            + "                trong " + page.getTotalrecords() + " kết quả</span>\n"
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
