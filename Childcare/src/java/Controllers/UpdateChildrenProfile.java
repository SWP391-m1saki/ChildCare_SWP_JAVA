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
public class UpdateChildrenProfile extends HttpServlet {

    private ChildrenProfileDAO dao;

    public void init() {
        dao = new ChildrenProfileDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String childrenId = request.getParameter("id");
        int id;
        try {
            id = Integer.parseInt(childrenId);
            //System.out.println(id);
            dao.load();
            HttpSession session = request.getSession();
            User userLogined = (User) session.getAttribute("UserLogined");
            if (dao.get(id).getParentId() != userLogined.getId()) {
                response.sendRedirect("loadHomePage");
            } else {
                request.setAttribute("childrenUpdating", dao.get(id));
                request.getRequestDispatcher("Views/Customers/updateChildren.jsp").forward(request, response);
            }
        } catch (Exception e) {
            response.sendRedirect("loadHomePage");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String name = request.getParameter("name");
        Boolean gender = request.getParameter("gender").equals("male");
        LocalDate dob = LocalDate.parse(request.getParameter("dob"));

        int id = Integer.parseInt(request.getParameter("childrenId"));
        //System.out.println(id);
        ChildrenProfile cc = dao.get(id);
        cc.setName(name);
        cc.setDob(dob);
        cc.setGender(gender);
        dao.update(cc);
        response.sendRedirect("loadChildren");
    }

}
