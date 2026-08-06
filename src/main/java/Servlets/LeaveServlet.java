package Servlets;

import Dao.LeaveDao;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Leave;
import model.User;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet("/leave")
public class LeaveServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            HttpSession session = req.getSession();
            User user = (User) session.getAttribute("user");
            String role = user.getRole();
            List<Leave> leaves;
            if (role.equals("employee")) {
                leaves = LeaveDao.getLeavesByUserId(user.getId());
                req.setAttribute("leaves", leaves);
                RequestDispatcher rd = req.getRequestDispatcher("/Employeejsp/employeeLeave.jsp");
                rd.forward(req,resp);
            } else {
               leaves = LeaveDao.getAllLeave();
                req.setAttribute("leaves", leaves);
                RequestDispatcher rd = req.getRequestDispatcher("/Adminjsp/adminLeave.jsp");
                rd.forward(req,resp);
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
    }
}
