/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.manager;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;

/**
 * @author Admin
 */
public class AjaxDoctorListOfShift extends HttpServlet {


    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request  servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException      if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet AjaxDoctorListOfShift</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AjaxDoctorListOfShift at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
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
        int week_number = Utils.Utility.parseIntParameter(request.getParameter("week_number"), Utils.Utility.getCurrentWeekNumber());
        int dayOfWeek = Utils.Utility.parseIntParameter(request.getParameter("dayOfWeek"), 1);
        boolean isMorningShift = Utils.Utility.parseBooleanParameter(request.getParameter("isMorningShift"), true);
//
//        List<DoctorProfile> doctors = slotDAO.getDoctorListOfShift(week_number, dayOfWeek, isMorningShift);
//        String s = "<div class=\"display-pop-up\">\n"
//                + "                                                    <div class=\"modal-header\">\n"
//                + "                                                        <h5 class=\"modal-title\" id=\"exampleModalLabel\">Danh sách bác sĩ</h5>\n"
//                + "                                                        <button type=\"button\" class=\"close close-doctor-list fw-bold fs-4\"\n"
//                + "                                                         data-dismiss=\"modal\" aria-label=\"Close\">×</button>\n"
//                + "                                                    </div>\n"
//                + "                                                    <ul class=\"list-doctor-of-slot\">\n";
//        for (DoctorProfile doctor : doctors) {
//            s += "<li>\n"
//                    + "                                                            <a href=\"doctor/profile/detail?id=" + doctor.getDoctorId() + "\" class=\"itemside\">\n"
//                    + "                                                                    <img src=\"../img/" + doctor.getUser().getAvatar() + "\" \n"
//                    + "                                                                         class=\"img-sm img-avatar rounded-circle\" alt=\"User Photo\" width=\"40\" id=\"show-avatar\">\n"
//                    + "                                                                    <span class=\"mb-0 title\">" + doctor.getTitle() + " " + doctor.getUser().getName() + "</span>\n"
//                    + "                                                            </a>\n"
//                    + "                                                        </li>";
//        }
//        s += "                                                    </ul>\n"
//                + "                                                </div>";
//
//        response.setContentType("text/html;charset=UTF-8");
//        try ( PrintWriter out = response.getWriter()) {
//            out.println(s);
//        }
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
