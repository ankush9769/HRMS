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
@WebServlet("/resetPasswords")
public class resetPasswordServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)throws ServletException, IOException {

        HttpSession session = req.getSession();
        User user = (User) session.getAttribute("user");
        String currentPass = req.getParameter("currentPassword");
        String currentHashPassword= PasswordUtil.hash(currentPass);
        String newPass = req.getParameter("newPassword");
        String confirmPass = req.getParameter("confirmPassword");

        String hashedPass = PasswordUtil.hash(newPass);

        if (user != null) {
            if ((currentPass.equals(user.password())) || (currentHashPassword.equals(user.password())) ) {
                if (newPass.equals(confirmPass)) {
                    try {
                        User updatedUser = UserDao.resetPassword(user.getEmail(), hashedPass);
                        session.setAttribute("user", updatedUser);
                       RequestDispatcher rd = req.getRequestDispatcher("/Employeejsp/profile.jsp");
                        rd.forward(req, resp);
                    } catch (SQLException e) {
                        throw new RuntimeException(e);
                    }

                } else {
                    req.setAttribute("error", "New passwords do not match");
                    RequestDispatcher rd = req.getRequestDispatcher("/Employeejsp/resetPassword.jsp");
                    rd.forward(req, resp);
                }
            } else {
                req.setAttribute("error", "Current password is incorrect");
                RequestDispatcher rd = req.getRequestDispatcher("/Employeejsp/resetPassword.jsp");
                rd.forward(req, resp);
            }

        } else {
            RequestDispatcher rd =req.getRequestDispatcher("index.jsp");
            rd.forward(req, resp);
        }
    }
}
