package Controllers;

import DAL.AppointmentDAO;
import DAL.ChildrenProfileDAO;
import DAL.DoctorProfileDAO;
import DAL.ShiftDAO;
import DAL.SlotDAO;
import DAL.SlotTimeDAO;
import Models.Appointment;
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
 * @author Misaki
 */
public class ChooseChild extends HttpServlet {

    SlotDAO daoSlot;
    ChildrenProfileDAO daoChildren;
    DoctorProfileDAO daoDoctor;
    SlotTimeDAO daoTime;
    ShiftDAO daoShift;
    
    public void init() {
        daoSlot = new SlotDAO();
        daoChildren = new ChildrenProfileDAO();
        daoDoctor = new DoctorProfileDAO();
        daoTime = new SlotTimeDAO();
        daoShift = new ShiftDAO();
    }
    private int doctorId, morning, afternoon, slotTimeId;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            doctorId = Integer.parseInt(request.getParameter("doctorId"));
            morning = -1; afternoon = -1;
            if (request.getParameter("morning") != null) {
                morning = Integer.parseInt(request.getParameter("morning"));
            }
            if (request.getParameter("afternoon") != null) {
                afternoon = Integer.parseInt(request.getParameter("afternoon"));
            }
            slotTimeId = Integer.parseInt(request.getParameter("slotTimeId"));
            HttpSession session = request.getSession();
            User userLogined = (User)session.getAttribute("UserLogined");
            
            daoChildren.load();
            daoDoctor.load();
            daoTime.load();
            daoShift.load();
            request.setAttribute("doctors", daoDoctor.get(doctorId));
            request.setAttribute("slotTime", daoTime.get(slotTimeId));
            request.setAttribute("shift", daoShift.get((slotTimeId<9)?morning:afternoon));
            request.setAttribute("ChildrenList", daoChildren.getChildrenOfUser(userLogined.getId()));
            request.getRequestDispatcher("Views/Customers/chooseChildrenProfile.jsp").forward(request, response);
            
        }catch(Exception e){
            response.sendRedirect("loadHomePage");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try{
            int childId = Integer.parseInt(request.getParameter("ChildId"));
            Slot newSlot = new Slot(0,true,0,slotTimeId, (slotTimeId<9)?morning:afternoon);
            daoSlot.add(newSlot);
            daoSlot.load();
            Appointment newApp = new Appointment(0, daoChildren.get(childId), daoSlot.getByShift((slotTimeId<9)?morning:afternoon, slotTimeId));
            AppointmentDAO daoApp = new AppointmentDAO();
            daoApp.add(newApp);
            response.sendRedirect("loadHomePage");        
        }catch(Exception e){
            response.sendRedirect("loadHomePage");
        }
    }

}
