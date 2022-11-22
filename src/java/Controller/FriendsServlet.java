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
import Model.Friends;
import Model.Message;
import Model.MySQLConntUtils;
import Model.UserAccount;

@WebServlet("/FriendsServlet")
public class FriendsServlet extends HttpServlet {
    //private int dn=0;

    private static final long serialVersionUID = 1L;

    public FriendsServlet() {
        super();

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
        Connection conn;
        try {
            request.setCharacterEncoding("utf-8");
            response.setCharacterEncoding("utf-8");
            conn = MySQLConntUtils.getMySQLConnection();

            //tìm kiếm tài khoản từ cơ sở dữ liệu xem tài khoản đăng nhập có đúng không
            HttpSession session = request.getSession();
            String Username = session.getAttribute("Username").toString();
            UserAccount u = DbUtils.findUser(conn, Username);
            ArrayList<UserAccount> listfriend = DbUtils.ALLFriendxn(u.getUserID());
            //
            

            ArrayList<UserAccount> listusernf = DbUtils.ALLUsernotfriend(u.getUserID());
            ArrayList<UserAccount> listuser = DbUtils.ALLUser(u.getUserID());
            UserAccount us = new UserAccount();
            us.setUserID(u.getUserID());
            ArrayList<Message> listConv = DbUtils.AllConversation(u.getUserID());
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

            request.setAttribute("listfriend", listfriend);
            request.setAttribute("listuser", listuser);
            request.setAttribute("listusernf", listusernf);
            request.setAttribute("u", u);
            session.setAttribute("hide", "hien");
            session.setAttribute("hien", "hide");
            request.getRequestDispatcher("/Friends.jsp").forward(request, response);

        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(FriendsServlet.class.getName()).log(Level.SEVERE, null, ex);

        }
    }

}
