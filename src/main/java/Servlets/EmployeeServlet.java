package Servlets;

import Dao.UserDao;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.User;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
@WebServlet("/employee")
public class EmployeeServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<User> employees = null;
        try {
            employees = UserDao.getAllUser();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
        req.setAttribute("employees", employees);
        RequestDispatcher rd = req.getRequestDispatcher("/Adminjsp/Employee.jsp");
        rd.forward(req,resp);
    }

}
