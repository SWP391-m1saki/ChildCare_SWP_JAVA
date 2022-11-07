package controller.user;

import DAL.UserDAO;
import Models.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import jakarta.servlet.http.Part;
import java.io.File;
import java.nio.file.Files;
//import java.nio.file.Path;
import java.nio.file.Paths;
//import java.nio.file.Path;

import java.io.IOException;

import java.time.LocalDate;

/**
 * @author Misaki
 */
@MultipartConfig(fileSizeThreshold = 1024 * 1024,
        maxFileSize = 1024 * 1024 * 5,
        maxRequestSize = 1024 * 1024 * 5 * 5)
public class UserProfileController extends HttpServlet {

    private UserDAO dao;

    public void init() {
        dao = new UserDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("Views/Customers/editProfile.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String name = "", phoneNumber = "", address = "";

        if (request.getParameter("name") != null) {
            name = request.getParameter("name");
        }
        Boolean gender = null;
        try {
            gender = request.getParameter("gender").equals("male");
        } catch (Exception e) {

        }

        if (request.getParameter("phonenumber") != null) {
            phoneNumber = request.getParameter("phonenumber");
        }
        LocalDate dob;
        try {
            dob = LocalDate.parse(request.getParameter("dob"));
        } catch (Exception ex) {
            dob = null;
        }
        if (request.getParameter("address") != null) {
            address = request.getParameter("address");
        }
        LocalDate now = LocalDate.now();
        if (!Utils.Utility.validateString(phoneNumber, "(84|0[3|5|7|8|9])+([0-9]{8})")) {
            request.setAttribute("mess", "Số điện thoại không hợp lệ");
            request.getRequestDispatcher("Views/Customers/editProfile.jsp").forward(request, response);
        } else if (address.length() > 250) {
            request.setAttribute("mess", "Địa chỉ quá dài, địa chỉ phải có độ dài ít hơn 250 ký tự");
            request.getRequestDispatcher("Views/Customers/editProfile.jsp").forward(request, response);
        } else if (dob != null && (now.getYear() - dob.getYear()) <= 18) {
            request.setAttribute("mess", "Tuổi không hợp lệ");
            request.getRequestDispatcher("Views/Customers/editProfile.jsp").forward(request, response);
        }

        HttpSession session = request.getSession();
        User newUser = (User) session.getAttribute("UserLogined");

        newUser.setName(name);
        newUser.setGender(gender);
        newUser.setPhoneNumber(phoneNumber);
        newUser.setDob(dob);
        newUser.setAddress(address);

        String uploadPath = "C:\\Users\\Admin\\Documents\\GitHub\\ChildCare_SWP_JAVA\\Childcare\\web\\img";
        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) {
            uploadDir.mkdir();
        }
        //System.out.println(uploadPath);
        try {
            String fileName;
            for (Part part : request.getParts()) {
                fileName = getFileName(part);
                part.write(uploadPath + "\\" + fileName);
                newUser.setAvatar(fileName);
            }
        } catch (Exception e) {
            System.out.println("Edit profile: " + e);
        }

        dao.update(newUser);
        session.setAttribute("UserLogined", newUser);
        request.getRequestDispatcher("Views/Customers/editProfile.jsp").forward(request, response);
    }

    private String getFileName(Part part) {
        for (String content : part.getHeader("content-disposition").split(";")) {
            if (content.trim().startsWith("filename")) {
                return content.substring(content.indexOf("=") + 2, content.length() - 1);
            }
        }
        return null;
    }

}
