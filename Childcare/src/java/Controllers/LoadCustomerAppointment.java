package Controllers;

import DAL.*;
import Models.*;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

/**
 *
 * @author Misaki
 */
public class LoadCustomerAppointment extends HttpServlet {
    AppointmentDAO daoApp;
    
    public void init(){
        daoApp = new AppointmentDAO();
    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int typeId=1;
        try{
            typeId = Integer.parseInt(request.getParameter("typeId"));
        }catch(Exception e){
            typeId=1;
        }
        try{
            DoctorProfileDAO daoDoctor = new DoctorProfileDAO();
            daoDoctor.load();
            System.out.println("TypeID = " + typeId);
            HttpSession session = request.getSession();
            User userLogined = (User)session.getAttribute("UserLogined");
            List<Appointment> listApp = new ArrayList<Appointment>();
            listApp =  daoApp.getAppointmentOfCustomer(userLogined.getId());
            
            HashMap<Appointment,DoctorProfile> map = new HashMap<Appointment, DoctorProfile>();
            
            for(Appointment ap: listApp){
                if(typeId == 1 && ap.getSlot().getStatus()== 0) map.put(ap, daoDoctor.get(ap.getSlot().getShift().getSchedule().getDoctorId()));
                if(typeId == 2 && ap.getSlot().getStatus() == 1) map.put(ap, daoDoctor.get(ap.getSlot().getShift().getSchedule().getDoctorId()));
                if(typeId == 3 && ap.getSlot().getStatus() != 0) map.put(ap, daoDoctor.get(ap.getSlot().getShift().getSchedule().getDoctorId()));
            }
            
            request.setAttribute("AppHm", map);
            request.setAttribute("typeId", typeId);
            request.getRequestDispatcher("Views/Customers/loadCustomerAppointment.jsp").forward(request, response);
        }catch(Exception e){
            System.out.println(e.getMessage());
            response.sendRedirect("loadHomePage");
        }
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    }  
}
