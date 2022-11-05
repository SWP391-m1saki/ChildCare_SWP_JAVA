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

    AppointmentDAO appointmentDAO;
    DepartmentDAO depDAO;

    @Override
    public void init() {
        appointmentDAO = new AppointmentDAO();
        depDAO = new DepartmentDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int typeId = Utils.Utility.parseIntParameter(request.getParameter("typeId"), 1);

        User userLogined = (User) request.getSession().getAttribute("UserLogined");
        if (userLogined != null) {
            List<Appointment> listApp = appointmentDAO.getAppointmentOfCustomer(userLogined.getId());
            if(typeId == 3){
                listApp.removeIf(a -> a.getStatus() == 0);
            } else {
                listApp.removeIf(a -> a.getStatus() != (typeId - 1));
            }
            
            request.setAttribute("appointments", listApp);
            request.setAttribute("departments", depDAO.getAllHashMap());
            request.setAttribute("typeId", typeId);
            request.getRequestDispatcher("Views/Customers/loadCustomerAppointment.jsp").forward(request, response);
        } else {
            response.sendRedirect("login");
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }
}
