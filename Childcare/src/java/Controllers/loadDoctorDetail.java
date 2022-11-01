package Controllers;


import DAL.*;
import Models.*;
import java.io.IOException;
import java.io.PrintWriter;

import DAL.DoctorProfileDAO;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import java.io.IOException;
import java.io.PrintWriter;

public class loadDoctorDetail extends HttpServlet {


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
            out.println("<title>Servlet loadDoctorDetail</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet loadDoctorDetail at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
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

    DoctorProfileDAO daoDoctor;
    ScheduleDAO daoSchedule;
    ShiftDAO daoShift;
    SlotDAO daoSlot;
    SlotTimeDAO daoSlotTime;

    @Override
    public void init() {
        daoDoctor = new DoctorProfileDAO();
        daoSchedule = new ScheduleDAO();
        daoShift = new ShiftDAO();
        daoSlot = new SlotDAO();
        daoSlotTime = new SlotTimeDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = 0;
        try {
            id = Integer.parseInt(getServletContext().getAttribute("ChoosedDoctorId").toString());
            request.setAttribute("doctors", daoDoctor.get(id));
            request.getRequestDispatcher("Views/Guests/doctor-profile-detail.jsp").forward(request, response);
            //System.out.println(id);
        } catch (Exception e) {
            response.sendRedirect("loadHomePage");
        }
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
        //System.out.println("Helllo");
        try{
            int doctorId = Integer.parseInt(request.getParameter("doctorId"));
            //System.out.println("doctorID: " + doctorId);
            LocalDate choosedDate = LocalDate.parse(request.getParameter("choosedDate"));
            //System.out.println("choosedDate: " + choosedDate);
            daoDoctor.load();
            daoSchedule.load();
            daoShift.load();
            daoSlot.load();
            daoSlotTime.load();
            Shift morning=null, afternoon=null;
            
            for(Shift s: daoShift.getAll()){
                
                if(s.getDate().isEqual(choosedDate) && s.getSchedule().getDoctorId() == doctorId && s.getSchedule().isWorked()){
                    if(s.getSchedule().getIsMorningShift()) morning = s;
                    else afternoon = s;
                }
            }
           
            List<SlotTime> slotList = new ArrayList<SlotTime>();
            List<SlotTime> deleteList = new ArrayList<SlotTime>();
            if(morning != null){
                request.setAttribute("morning", morning);
                slotList.addAll(daoSlotTime.getMorning());
                
                for(Slot s: daoSlot.getAll()){
                    System.out.println(s.getShiftId() + " " + morning.getShiftId());
                    if(s.getShiftId() == morning.getShiftId()){
                        for(SlotTime st: slotList) 
                             if(st.getSlotTimeId() == s.getSlotTimeId()) if(!deleteList.contains(st)) deleteList.add(st);
                    }
                }
            }
            
            if(afternoon != null){
                request.setAttribute("afternoon", afternoon);
                slotList.addAll(daoSlotTime.getAfternoon());
                for(Slot s: daoSlot.getAll()){
                    if(s.getShiftId() == afternoon.getShiftId()){
                        for(SlotTime st: slotList) 
                            if(st.getSlotTimeId() == s.getSlotTimeId()) if(!deleteList.contains(st)) deleteList.add(st);
                    }
                }
            }
            
            slotList.removeAll(deleteList);
            
            //System.out.println("morning: " + morning);
            //System.out.println("afternoon: " + afternoon);
            request.setAttribute("slotList", slotList);
            request.setAttribute("doctors", daoDoctor.get(doctorId));
            request.setAttribute("choosedDate", choosedDate);
            request.getRequestDispatcher("Views/Guests/doctor-profile-detail.jsp").forward(request, response);
        }catch(Exception e){
            System.out.println(e.getMessage());
            response.sendRedirect("loadHomePage");
        }
        
    }

}
