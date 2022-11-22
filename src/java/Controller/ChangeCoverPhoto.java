/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import Model.DbUtils;
import Model.MySQLConntUtils;
import Model.UserAccount;
import Model.upload;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

/**
 *
 * @author PC
 */
@MultipartConfig(
        fileSizeThreshold = 1024 * 1024 * 10,
        maxFileSize = 1024 * 1024 * 50,
        maxRequestSize = 1024 * 1024 * 100
)
@WebServlet(name = "ChangeCoverPhoto", urlPatterns = {"/ChangeCoverPhoto"})
public class ChangeCoverPhoto extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Connection con = null;
        request.setCharacterEncoding("UTF-8");
        try {
            con = MySQLConntUtils.getMySQLConnection();
            String Anhbia = "";
            Part part = request.getPart("Anhbia");
            String fileName = extractFileName(part);
            fileName = new File(fileName).getName();
            String path1 = request.getContextPath();
            System.out.println(path1);
            part.write("C:/Users/PC/Documents/NetBeansProjects/MXHCaCa/web/images/" + fileName);
            HttpSession session = request.getSession();
            Anhbia = fileName;
            session.setAttribute("Anhbia", Anhbia);
            UserAccount us = new UserAccount();
            us.setAnhbia(Anhbia);
            int UserID = Integer.parseInt(session.getAttribute("UserID").toString());
            us.setUserID(UserID);
            DbUtils.updateUserAccountCoverPhoto(con, us);
            //request.getRequestDispatcher("/GetInfoDetailServlet").forward(request, response);
            
            ArrayList<upload> liststatus = DbUtils.AllStatus(UserID);
            ArrayList<UserAccount> listuser = DbUtils.ALLUser(UserID);
            ArrayList<UserAccount> listfriend = DbUtils.ALLFriendLim(UserID);

            request.setAttribute("listfriend", listfriend);
            request.setAttribute("liststatus", liststatus);
            int SLFriend = DbUtils.SLFriend(con, UserID);

            request.setAttribute("SLFriend", SLFriend);

            request.getRequestDispatcher("/GetInfoDetailServlet").forward(request, response);
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(ChangeCoverPhoto.class.getName()).log(Level.SEVERE, null, ex);
        }

        processRequest(request, response);
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
