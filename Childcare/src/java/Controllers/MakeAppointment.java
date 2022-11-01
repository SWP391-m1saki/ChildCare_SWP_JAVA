/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controllers;

import DAL.ChildrenProfileDAO;
import DAL.SlotDAO;
import Models.Slot;
import Models.User;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 *
 * @author misaki
 */
public class MakeAppointment extends HttpServlet {

    SlotDAO daoSlot;
    ChildrenProfileDAO daoChildren;
    public void init(){
        daoSlot = new SlotDAO();
        daoChildren = new ChildrenProfileDAO();
    }
    private int doctorId, morning, afternoon, slotTimeId;
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            int doctorId = Integer.parseInt(request.getParameter("doctorId"));
            int morning = -1, afternoon = -1;
            if (request.getParameter("morning") != null) {
                morning = Integer.parseInt(request.getParameter("morning"));
            }
            if (request.getParameter("afternoon") != null) {
                afternoon = Integer.parseInt(request.getParameter("afternoon"));
            }
            int slotTimeId = Integer.parseInt(request.getParameter("slotTimeId"));
            HttpSession session = request.getSession();
            User userLogined = (User)session.getAttribute("UserLogined");
            
            Slot newSlot = new Slot(0,true,0,slotTimeId,(slotTimeId<9)?morning:afternoon);
            daoSlot.add(newSlot);
            
        }catch(Exception e){
            
        }

    }

}
