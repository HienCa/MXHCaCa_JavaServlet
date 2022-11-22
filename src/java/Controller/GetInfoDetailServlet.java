package Controller;

import Model.Chat;
import java.io.IOException;
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

import Model.DbUtils;
import Model.Message;
import Model.MySQLConntUtils;
import Model.UserAccount;
import Model.upload;

@WebServlet("/GetInfoDetailServlet")
public class GetInfoDetailServlet extends HttpServlet {
    //private int dn=0;

    private static final long serialVersionUID = 1L;

    public GetInfoDetailServlet() {
        super();

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Connection conn;
        try {
            request.setCharacterEncoding("utf-8");
            response.setCharacterEncoding("utf-8");
            conn = MySQLConntUtils.getMySQLConnection();

            //tìm kiếm tài khoản từ cơ sở dữ liệu xem tài khoản đăng nhập có đúng không
            HttpSession session = request.getSession();
            String Username = session.getAttribute("Username").toString();
            int UserID = Integer.parseInt(session.getAttribute("UserID").toString());
            UserAccount u = DbUtils.getUserDeatail(conn, UserID);
            // đổi thành finuser
            
            ArrayList<upload> liststatus = DbUtils.AllStatus(UserID);
            ArrayList<UserAccount> listuser = DbUtils.ALLUser(u.getUserID());
            ArrayList<UserAccount> listfriend = DbUtils.ALLFriendLim(u.getUserID());

            request.setAttribute("listfriend", listfriend);
            request.setAttribute("liststatus", liststatus);
            int SLFriend = DbUtils.SLFriend(conn, u.getUserID());
            ArrayList<Message> listConv = DbUtils.AllConversation(UserID);
                for (Message l:listConv)
                {
                    System.out.println(l.getConvd().getUa().getUserID());
                    System.out.println(l.getConvd().getUa().getAvt());
                    Message m = new Message();
                    m = DbUtils.getMessage(l.getConvd().getConv().getConversationID());
                    l.setMessageID(m.getMessageID());
                    l.setMessageContent(m.getMessageContent());
                    l.setUserID(m.getUserID());
                    
                    
                }
                request.setAttribute("listConv", listConv);
            request.setAttribute("SLFriend", SLFriend);

            request.getRequestDispatcher("/InfomationDetail.jsp").forward(request, response);

        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(GetInfoDetailServlet.class.getName()).log(Level.SEVERE, null, ex);

        }
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Connection conn;
        try {
            request.setCharacterEncoding("utf-8");
            response.setCharacterEncoding("utf-8");
            conn = MySQLConntUtils.getMySQLConnection();

            //tìm kiếm tài khoản từ cơ sở dữ liệu xem tài khoản đăng nhập có đúng không
            HttpSession session = request.getSession();
            String Username = session.getAttribute("Username").toString();
            int UserID = Integer.parseInt(session.getAttribute("UserID").toString());
            UserAccount u = DbUtils.getUserDeatail(conn, UserID);
            // đổi thành finuser
            
            ArrayList<upload> liststatus = DbUtils.AllStatus(UserID);
            ArrayList<UserAccount> listuser = DbUtils.ALLUser(u.getUserID());
            ArrayList<UserAccount> listfriend = DbUtils.ALLFriendLim(u.getUserID());

            request.setAttribute("listfriend", listfriend);
            request.setAttribute("liststatus", liststatus);
            int SLFriend = DbUtils.SLFriend(conn, u.getUserID());
            ArrayList<Message> listConv = DbUtils.AllConversation(UserID);
                for (Message l:listConv)
                {
                    System.out.println(l.getConvd().getUa().getUserID());
                    System.out.println(l.getConvd().getUa().getAvt());
                    Message m = new Message();
                    m = DbUtils.getMessage(l.getConvd().getConv().getConversationID());
                    l.setMessageID(m.getMessageID());
                    l.setMessageContent(m.getMessageContent());
                    l.setUserID(m.getUserID());
                    
                    
                }
                request.setAttribute("listConv", listConv);
            request.setAttribute("SLFriend", SLFriend);

            request.getRequestDispatcher("/InfomationDetail.jsp").forward(request, response);

        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(GetInfoDetailServlet.class.getName()).log(Level.SEVERE, null, ex);

        }
    }
}
