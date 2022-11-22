/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import Model.Chat;
import Model.Conversation;
import Model.DbUtils;
import Model.Friends;
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
@WebServlet(name = "InsertChat", urlPatterns = {"/InsertChat"})
public class InsertChat extends HttpServlet {

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
            out.println("<title>Servlet InsertChat</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet InsertChat at " + request.getContextPath() + "</h1>");
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
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        Connection conn;

        
        

        
        

        try {
            int ConvdID = 0;
            String messagesContent = request.getParameter("messagesContent");
            conn = MySQLConntUtils.getMySQLConnection();
            HttpSession session = request.getSession();
            int TrangThai = Integer.parseInt(session.getAttribute("TrangThai").toString());
            if (TrangThai != 0 )
            {
                
                ConvdID = Integer.parseInt(request.getParameter("ConvdID"));
                if (messagesContent != null & !messagesContent.equals(""))
                {
                    DbUtils.insertMessage(conn, messagesContent, ConvdID);
                    int ConvID = Integer.parseInt(session.getAttribute("ConvID").toString());
                    DbUtils.updateConversation(conn, ConvID);
                }
                
            }
            else 
            {
                DbUtils.insertConversation(conn);
                int ConvID = DbUtils.MaxConvID(conn);
                session.setAttribute("ConvID", ConvID);
                int UserID = Integer.parseInt(session.getAttribute("UserID").toString());
                int FUserID = Integer.parseInt(session.getAttribute("FUserID").toString());
                DbUtils.insertConversationDetail(conn, ConvID, UserID);
                DbUtils.insertConversationDetail(conn, ConvID, FUserID);
                ConvdID = DbUtils.ConvdID(conn,UserID, ConvID);
                if (messagesContent != null & !messagesContent.equals(""))
                {
                    DbUtils.insertMessage(conn, messagesContent, ConvdID);
                }
            }
            
            
            
            //get values vao session
            
            int ConvID = Integer.parseInt(session.getAttribute("ConvID").toString());
            String AvtF = session.getAttribute("AvtF").toString();
            String NickName  = session.getAttribute("NickName").toString();
            int FUserID = Integer.parseInt(session.getAttribute("FUserID").toString());
            int UserID = Integer.parseInt(session.getAttribute("UserID").toString());
            ArrayList<Message> listConv = DbUtils.AllConversation(UserID);
            ArrayList<Message> listChatItem = DbUtils.AllConversationDetail(ConvID);
            for (Message l:listConv)
                {
                    Message m = new Message();
                    m = DbUtils.getMessage(l.getConvd().getConv().getConversationID());
                    System.out.println(m.getMessageID());
                    l.setMessageID(m.getMessageID());
                    l.setMessageContent(m.getMessageContent());
                    l.setUserID(m.getUserID());
                    
                }
            
            request.setAttribute("ConvdID", ConvdID);
            request.setAttribute("AvtF", AvtF);
            request.setAttribute("NickName", NickName);
            request.setAttribute("listConv", listConv);
            request.setAttribute("listChatItem", listChatItem);
            
            request.getRequestDispatcher("/Conversations.jsp").forward(request, response);
            
            
                

        } catch (SQLException | ClassNotFoundException ex) {
            Logger.getLogger(InsertChat.class.getName()).log(Level.SEVERE, null, ex);
        }
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
