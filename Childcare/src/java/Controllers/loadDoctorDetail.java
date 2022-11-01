package Controllers;

import DAL.*;
import Models.*;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

public class loadDoctorDetail extends HttpServlet {

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
