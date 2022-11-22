/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import Model.Chat;
import Model.DbUtils;
import Model.Message;
import Model.MySQLConntUtils;
import Model.UserAccount;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author PC
 */
@WebServlet(name = "LoadConversationDetail", urlPatterns = {"/LoadConversationDetail"})
public class LoadConversationDetail extends HttpServlet {

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
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet LoadConversationDetail</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet LoadConversationDetail at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
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
        response.setContentType("text/html;charset=UTF-8");
        Connection con = null;
        try {
            con = MySQLConntUtils.getMySQLConnection();

            HttpSession session = request.getSession();
            String Username = session.getAttribute("Username").toString();
            int TrangThai = 1;
            session.setAttribute("TrangThai", TrangThai);
            int UserID = Integer.parseInt(session.getAttribute("UserID").toString());
            System.out.println(UserID);
            //int FriendID = Integer.parseInt(request.getParameter("FriendID"));
            UserAccount u = new UserAccount();
            u.setUserID(UserID);
            u.setUsername(Username);
            
            String AvtF = request.getParameter("Avt");
            String NickName = request.getParameter("NickName");
            int FUserID = Integer.parseInt(request.getParameter("FUserID"));
            int ConvID = Integer.parseInt(request.getParameter("ConvID"));
            
            //set values vao session
            session.setAttribute("AvtF", AvtF);
            session.setAttribute("NickName", NickName);
            session.setAttribute("FUserID", FUserID);
            session.setAttribute("ConvID", ConvID);
            ArrayList<Message> listConv = DbUtils.AllConversation(u.getUserID());
            ArrayList<Message> listChatItem = DbUtils.AllConversationDetail(ConvID);
            for (Message l:listConv)
                {
                    Message m = new Message();
                    m = DbUtils.getMessage(l.getConvd().getConv().getConversationID());
                    l.setMessageID(m.getMessageID());
                    l.setMessageContent(m.getMessageContent());
                    l.setUserID(m.getUserID());
                    
                }
            int ConvdID = DbUtils.getConvdID(UserID, ConvID);
            request.setAttribute("ConvdID", ConvdID);
            request.setAttribute("AvtF", AvtF);
            request.setAttribute("NickName", NickName);
            request.setAttribute("listConv", listConv);
            request.setAttribute("listChatItem", listChatItem);
            
            request.getRequestDispatcher("/Conversations.jsp").forward(request, response);

        } catch (SQLException | ClassNotFoundException ex) {
            Logger.getLogger(LoadConversations.class.getName()).log(Level.SEVERE, null, ex);
            request.setAttribute("e", ex);
            request.getRequestDispatcher("/Conversations.jsp").forward(request, response);

        }
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

        processRequest(request, response);
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
