package Controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;

import java.io.OutputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.net.URL;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import Model.DbUtils;
import Model.MySQLConntUtils;
import Model.Status;
import Model.UserAccount;
import Model.upload;

/**
 * Servlet implementation class newProductServlet
 */
@MultipartConfig(
        fileSizeThreshold = 1024 * 1024 * 10,
        maxFileSize = 1024 * 1024 * 50,
        maxRequestSize = 1024 * 1024 * 100
)
@WebServlet("/UpLoadStatusServlet")
public class UpLoadStatusServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpLoadStatusServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

    /**
     * @param request
     * @param response
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
     * response)
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // TODO Auto-generated method stub
        response.getWriter().append("Served at: ").append(request.getContextPath());

    }

    /**
     * @param request
     * @param response
     * @throws javax.servlet.ServletException
     * @throws java.io.IOException
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
     * response)
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Connection conn = null; //connect SQL
        try {
            request.setCharacterEncoding("utf-8");
            response.setCharacterEncoding("utf-8");
            conn = MySQLConntUtils.getMySQLConnection();
            String StatusCaption = request.getParameter("content");

            //xử lý file ảnh
            String images = "";
            Part part = request.getPart("images");
            String fileName = extractFileName(part);
            fileName = new File(fileName).getName();
            String path1 = request.getContextPath();
            System.out.println(path1);
            part.write("C:/Users/PC/Documents/NetBeansProjects/MXHCaCa/web/images/" + fileName);
            images = fileName;
            HttpSession session = request.getSession();
            int UserID = Integer.parseInt(session.getAttribute("UserID").toString());
            Status st = new Status(StatusCaption, images);

            DbUtils.insertstatus(conn, st);
            int StatusID = DbUtils.getStatusID(conn);
            System.out.print(StatusID);

            DbUtils.insertupload(conn, UserID, StatusID);
            request.getRequestDispatcher("/indexServlet").forward(request, response);
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(UpLoadStatusServlet.class.getName()).log(Level.SEVERE, null,
                    ex);
        } finally {
            if (conn != null) {
                try {
                    conn.close();
                } catch (SQLException ex) {
                    Logger.getLogger(UpLoadStatusServlet.class.getName()).log(Level.SEVERE,
                            null, ex);
                }
            }

        }

        doGet(request, response);
    }

    private String extractFileName(Part part) {
        String contentDisp = part.getHeader("content-disposition");
        String[] items = contentDisp.split(";");
        for (String s : items) {
            if (s.trim().startsWith("filename")) {
                return s.substring(s.indexOf("=") + 2, s.length() - 1);
            }
        }
        return "";
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
