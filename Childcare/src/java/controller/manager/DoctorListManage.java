/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.manager;

import DAL.DepartmentDAO;
import DAL.DoctorProfileDAO;
import Models.User;
import Models.DoctorProfile;
import Models.PageInfo;
import Models.Post;
import Utils.Utility;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Admin
 */
public class DoctorListManage extends HttpServlet {

    DoctorProfileDAO doctorDAO;
    DepartmentDAO departmentDAO;

    @Override
    public void init() {
        doctorDAO = new DoctorProfileDAO();
        departmentDAO = new DepartmentDAO();
        doctorDAO.load();
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
    private List<DoctorProfile> getDummyData() {
        List<DoctorProfile> doctors = new ArrayList<DoctorProfile>();
        for (int i = 1; i < 6; i++) {
            User user = new User(i, "hoangtrungkien" + i + "@gmail.com", "123456789", "Hoàng Trung Kiên ", true, LocalDate.now(), 1, "0123456789", "Hà Nội, Việt Nam", "team-" + (i % 3 == 0 ? "3" : i % 3) + ".jpg", 1);
            doctors.add(new DoctorProfile(i,
                    "Bác sĩ Tôn Thất Thanh Long bắt đầu làm việc tại Phòng khám Đa khoa Thành Công vào tháng 4/2021. Bác sĩ hiện tại đang là Bác sĩ chuyên khoa Nội tại phòng khám. Với hơn 4 năm kinh nghiệm trong ngành, Bác sĩ chuyên thăm khám và điều trị các trường hợp về Nội tiết, Tiêu hóa, Gan mật. Chuyên môn vững chắc cùng sự tận tình với bệnh nhân, Bác sĩ hy vọng có thể đem lại quá trình thăm khám và điều trị tốt nhất.",
                    "Hơn 15 năm kinh nghiệm Khám và điều trị bệnh Mắt - đã thực hiện nhiều ca chấp lẹo, mộng thịt, cũng như nhiều phẫu thuật khác về mắt Kinh nghiệm\n"
                    + "\n"
                    + "Chuyên khoa Mắt Lĩnh vực chuyên sâu\n"
                    + "\n"
                    + "Bắt đầu làm việc tại Phòng khám Đa khoa Thành Công vào tháng 2/2008\n"
                    + "",
                    120000,
                    1, "BS.CK1", user));
        }
        for (int i = 6; i < 13; i++) {
            User user = new User(i, "hoangtrungkien" + i + "@gmail.com", "123456789", "Tôn Thất Thanh Long", true, LocalDate.now(), 1, "0123456789", "Hà Nội, Việt Nam", "team-" + (i % 3 == 0 ? "3" : i % 3) + ".jpg", 1);
            doctors.add(new DoctorProfile(i,
                    "Bác sĩ Tôn Thất Thanh Long bắt đầu làm việc tại Phòng khám Đa khoa Thành Công vào tháng 4/2021. Bác sĩ hiện tại đang là Bác sĩ chuyên khoa Nội tại phòng khám. Với hơn 4 năm kinh nghiệm trong ngành, Bác sĩ chuyên thăm khám và điều trị các trường hợp về Nội tiết, Tiêu hóa, Gan mật. Chuyên môn vững chắc cùng sự tận tình với bệnh nhân, Bác sĩ hy vọng có thể đem lại quá trình thăm khám và điều trị tốt nhất.",
                    "Hơn 15 năm kinh nghiệm Khám và điều trị bệnh Mắt - đã thực hiện nhiều ca chấp lẹo, mộng thịt, cũng như nhiều phẫu thuật khác về mắt Kinh nghiệm\n"
                    + "\n"
                    + "Chuyên khoa Mắt Lĩnh vực chuyên sâu\n"
                    + "\n"
                    + "Bắt đầu làm việc tại Phòng khám Đa khoa Thành Công vào tháng 2/2008\n"
                    + "",
                    200000,
                    i % 5, "BS.CK2", user));
        }
        return doctors;
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        request.setAttribute("departments", departmentDAO.getAll());
        
        //GET DUMMIES DATA FOR TEST
        //request.setAttribute("doctorList", getDummyData());
        
        //department
        int depId = Utility.parseIntParameter(request.getParameter("depId"), -1);

//        //PAGING
        int[] nrppArr = {5, 10, 20};
        request.setAttribute("nrppArr", nrppArr);
        int pagesize = Utils.Utility.parseIntParameter(request.getParameter("pagesize"), 5);
        int pageindex = Utils.Utility.parseIntParameter(request.getParameter("page"), 1);

        String searchTxt = request.getParameter("search");
        List<DoctorProfile> filteredList = doctorDAO.getDoctorBySearchAndDepId(searchTxt, depId);
        int totalrecords = filteredList.size();  // total record of p_cid category
        PageInfo page = new PageInfo(pageindex, pagesize, totalrecords);
        page.calc();
        request.setAttribute("page", page);
        request.setAttribute("depId", depId);
        request.setAttribute("search", searchTxt);
        request.setAttribute("doctorList", doctorDAO.getDoctorsByPage(page, filteredList));
        
        request.getRequestDispatcher("../../Views/manager/doctor-profile-list-manager.jsp").forward(request, response);
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
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs z * @throws
     * IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
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
