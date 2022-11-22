package Controller;

import Model.Chat;
import static Model.DbUtils.insertUserAccount;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Model.DbUtils;
import Model.Friends;
import Model.Message;
import Model.MySQLConntUtils;
import Model.UserAccount;
import Model.upload;

@WebServlet("/indexServlet")
public class indexServlet extends HttpServlet {
    //private int dn=0;

    private static final long serialVersionUID = 1L;

    public indexServlet() {
        super();

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Connection conn;
        try {
            request.setCharacterEncoding("utf-8");
            response.setCharacterEncoding("utf-8");
            conn = MySQLConntUtils.getMySQLConnection();
            //xử lý tham số từ form
            HttpSession session = request.getSession();
            String Username = session.getAttribute("Username").toString();
            UserAccount usr = new UserAccount(Username);
            UserAccount u = DbUtils.findUser(conn, usr.getUsername());
            request.setAttribute("Avt", u.getAvt());
            request.setAttribute("Anhbia", u.getAnhbia());
//            ArrayList<UserAccount> listfriend = DbUtils.ALLFriend(u.getUserID());
            ArrayList<UserAccount> listfriend = DbUtils.ALLFriend(u.getUserID());
            request.setAttribute("listfriend", listfriend);
            ArrayList<upload> liststatusfr = DbUtils.allStatusFr(u.getUserID());

            UserAccount us = new UserAccount();
            us.setUserID(u.getUserID());
            //ArrayList<Chat> listChat = DbUtils.AllConversation(us);
            //request.setAttribute("listChat", listChat);
            ArrayList<Message> listConv = DbUtils.AllConversation(us.getUserID());
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
            request.setAttribute("liststatusfr", liststatusfr);
            request.getRequestDispatcher("/PersonalPage.jsp").forward(request, response);
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(indexServlet.class.getName()).log(Level.SEVERE, null, ex);

        }
    }

    /**
     *
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
