package Servlets;

import Dao.LeaveDao;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Leave;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet("/adminDashboard")
public class AdminDashboardServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<Leave> leaves = null;
        try {
            leaves = LeaveDao.getAllLeave();
            req.setAttribute("leaves", leaves);

            RequestDispatcher dispatcher =req.getRequestDispatcher("/Adminjsp/adminDashboard.jsp");
            dispatcher.forward(req, resp);

        } catch (SQLException e) {
            throw new RuntimeException(e);
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }


    }
}