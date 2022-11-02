/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controllers;

import DAL.DepartmentDAO;
import DAL.DoctorProfileDAO;
import Models.User;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Misaki
 */
public class ChooseDoctor extends HttpServlet {

    DoctorProfileDAO dao;
    DepartmentDAO depDAO;
    String DepartmentId;
    public void init(){
        dao = new DoctorProfileDAO();
        depDAO = new DepartmentDAO();
    }
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        dao.load();
        DepartmentId = request.getParameter("DepartmentId");
        int id = Integer.parseInt(DepartmentId);
        depDAO.load();
        request.setAttribute("DepartmentName", depDAO.get(id).getDepartmentName());
        request.setAttribute("DoctorList", dao.getDoctorBySearchAndDepId(null, id));
        request.getRequestDispatcher("Views/Customers/chooseDoctor.jsp").forward(request, response);
        
    }

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //System.out.println("123434");
        //System.out.println(request.getParameter("DoctorId"));
        int DoctorId = Integer.parseInt(request.getParameter("DoctorId"));
        //System.out.println(DoctorId);
        getServletContext().setAttribute("ChoosedDoctorId", DoctorId);
        response.sendRedirect("loadDoctorDetail");
    }

    

}
