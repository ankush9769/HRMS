package Servlets;

import Dao.UserDao;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.User;
import utils.PasswordUtil;

import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/signin")
public class SigninServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String email = req.getParameter("email");
        String password = req.getParameter("password");
        try {
            User user = UserDao.findByEmail(email);

            if (user == null) {
                loginFailed(req, resp);
                return;
            }

            if (user.isupdate()) {
                password = PasswordUtil.hash(password);
            }

            user = UserDao.findbyEmailAndPassword(email, password);

            if (user == null) {
                loginFailed(req, resp);
                return;
            }

            HttpSession session = req.getSession();
            session.setAttribute("user", user);
            session.setAttribute("role", user.getRole());
            session.setAttribute("name_key", user.getName());

            System.out.println("Successfully logged in: " + user.getName());

            if ("admin".equalsIgnoreCase(user.getRole())) {
                req.getRequestDispatcher("/Adminjsp/adminProfile.jsp").forward(req, resp);
            } else {
                req.getRequestDispatcher("/Employeejsp/employeeProfile.jsp").forward(req, resp);
            }

        } catch (SQLException | ClassNotFoundException e) {
            throw new ServletException(e);
        }
    }

    private void loginFailed(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setAttribute("error", "Invalid email or password");
        RequestDispatcher rd = req.getRequestDispatcher("index.jsp");
        rd.forward(req, resp);
    }
}