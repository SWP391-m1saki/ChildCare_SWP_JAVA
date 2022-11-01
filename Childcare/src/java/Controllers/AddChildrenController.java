/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controllers;

import DAL.ChildrenProfileDAO;
import Models.ChildrenProfile;
import Models.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.time.LocalDate;

/**
 * @author Misaki
 */
public class AddChildrenController extends HttpServlet {


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("Views/Customers/addChildren.jsp").forward(request, response);
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String name = request.getParameter("name");
        Boolean gender = request.getParameter("gender").equals("male");
        LocalDate dob = LocalDate.parse(request.getParameter("dob"));
        HttpSession session = request.getSession();
        User u = (User) session.getAttribute("UserLogined");
        System.out.println(u.getId());
        ChildrenProfile cc = new ChildrenProfile(0, name, gender, dob, u.getId(), "img/defaultAvatar.png");
        ChildrenProfileDAO dao = new ChildrenProfileDAO();
        dao.add(cc);
        response.sendRedirect("loadChildren");
    }


}
