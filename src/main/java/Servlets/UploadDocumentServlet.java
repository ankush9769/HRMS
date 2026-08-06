package Servlets;

import Dao.DocumentDao;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import model.Document;
import model.User;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.SQLException;

@WebServlet("/uploadDocument")
@MultipartConfig(
        maxFileSize = 5 * 1024 * 1024,
        maxRequestSize = 5 * 1024 * 1024
)
public class UploadDocumentServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        HttpSession session = req.getSession();
        User user = (User) session.getAttribute("user");
        Part filePart = req.getPart("document");

        if (filePart == null || filePart.getSize() == 0) {
            req.setAttribute("error","Please select a document.");
            RequestDispatcher rd = req.getRequestDispatcher("employeeDocument.jsp");
            rd.forward(req, resp);
            return;
        }

        String fileName = filePart.getSubmittedFileName();
        String contentType = filePart.getContentType();
        long fileSize = filePart.getSize();

        if (!contentType.equals("application/pdf") && !contentType.equals("image/jpeg") && !contentType.equals("image/png")) {

            req.setAttribute("error","Only PDF, JPG and PNG files are allowed.");
            RequestDispatcher rd = req.getRequestDispatcher("employeeDocument.jsp");
            rd.forward(req, resp);
            return;
        }

        try {
            InputStream inputStream = filePart.getInputStream();
            ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
            byte[] buffer = new byte[4096];
            int bytesRead;
            while ((bytesRead = inputStream.read(buffer)) != -1) {
                outputStream.write(buffer, 0, bytesRead);
            }
            byte[] fileData = outputStream.toByteArray();
            int userId = DocumentDao.getUserIdByEmail(user.getEmail());
            Document document = new Document();
            document.setUserId(userId);
            document.setFileName(fileName);
            document.setContentType(contentType);
            document.setFileSize(fileSize);
            document.setFileData(fileData);

            boolean result =DocumentDao.addDocument(document);
            if (result) {
                resp.sendRedirect("documents");
            } else {
                req.setAttribute("error","Document upload failed.");
                RequestDispatcher rd = req.getRequestDispatcher("employeeDocument.jsp");
                rd.forward(req, resp);
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
    }
}