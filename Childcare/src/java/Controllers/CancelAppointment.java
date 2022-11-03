package Controllers;

import DAL.AppointmentDAO;
import DAL.SlotDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 *
 * @author misaki
 */
public class CancelAppointment extends HttpServlet {

    SlotDAO daoSlot;
    AppointmentDAO daoApp;
    public void init(){
        daoSlot = new SlotDAO();
        daoApp = new AppointmentDAO();
    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    }

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try{
            int appId = Integer.parseInt(request.getParameter("AppId"));
            daoSlot.updateStatus(daoApp.getAppointmentById(appId).getSlot().getSlotId(), 2);
            response.sendRedirect("loadCustomerAppointment");
        }catch(Exception e){
            System.out.println(e.getMessage());
            response.sendRedirect("loadHomePage");
        }
    }

    
}
