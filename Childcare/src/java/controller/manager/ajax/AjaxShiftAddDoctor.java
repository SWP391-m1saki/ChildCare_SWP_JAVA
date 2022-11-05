/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.manager.ajax;

import DAL.ShiftDAO;
import Models.DoctorProfile;
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
public class AjaxShiftAddDoctor extends HttpServlet {

    ShiftDAO shiftDAO;

    @Override
    public void init() {
        shiftDAO = new ShiftDAO();
        shiftDAO.load();
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
        int depId = Utils.Utility.parseIntParameter(request.getParameter("depId"), -1);
        int week_number = Utils.Utility.parseIntParameter(request.getParameter("weeknum"), Utils.Utility.getCurrentWeekNumber());
        String shift_string = request.getParameter("shift");
        if (shift_string != null) {
            int dayOfWeek = Utils.Utility.parseIntParameter(shift_string.substring(1), 1);
            boolean isMorningShift = shift_string.startsWith("S");
            List<DoctorProfile> doctors = shiftDAO.getDoctorsNotWorkInShift(week_number, dayOfWeek, isMorningShift, depId);

            //filter list by search
            String searchTxt = request.getParameter("search");
            if (searchTxt != null && searchTxt.length() > 0) {
                doctors.removeIf(p -> !p.getUser().getName().toLowerCase().contains(searchTxt.toLowerCase()));
            }
            response.setContentType("text/html;charset=UTF-8");
            try ( PrintWriter out = response.getWriter()) {
                String s = "";
                if (!doctors.isEmpty()) {
                    s += "<div class=\"table-responsive\" style=\"overflow-x: hidden\">\n"
                            + "                                                <table class=\"table table-hover\" style=\"margin-right: 30px\">\n"
                            + "                                                    <tbody>\n";
                    for (DoctorProfile doctor : doctors) {
                        s += "<tr>\n"
                                + "                                                                <td>\n"
                                + "                                                                    <a href=\"${context}/manager/doctor/profile/detail?id=" + doctor.getDoctorId() + "\" class=\"text-dark d-flex justify-content-start align-items-center\">\n"
                                + "                                                                        <div class=\"left\">\n"
                                + "                                                                            <img src=\"../../img/" + doctor.getUser().getAvatar() + "\" class=\"img-xs image p-1 rounded-circle\" width=\"50\" height=\"50\" alt=\"Ảnh bac si\">\n"
                                + "                                                                        </div>\n"
                                + "                                                                        <div class=\"ms-3\">\n"
                                + "                                                                            <h6 class=\"mb-0 title\">" + doctor.getUser().getName() + "</h6>\n"
                                + "                                                                        </div>\n"
                                + "                                                                    </a>\n"
                                + "                                                                </td>\n"
                                + "                                                                <td class=\"text-end\">\n"
                                + "                                                                    <a class=\"btn btn-secondary py-0 fs-4 fw-bold add-doctor\" onclick=\"if(confirm('Bạn có muốn thêm bác sĩ vào ca trực?')) window.location.href = '../../manager/shift/add?weeknum=" + week_number + "&shift=" + shift_string + "&id=" + doctor.getDoctorId() + "';\">+</a>\n"
                                + "                                                                </td>\n"
                                + "                                                            </tr>\n";
                    }
                    s += "      </tbody>\n"
                            + "</table> <!-- table-responsive.// -->\n"
                            + "</div>";
                }
                out.println(s);
            }
        }
    }

}
