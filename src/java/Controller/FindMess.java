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
import Model.upload;

@WebServlet("/FindMess")
public class FindMess extends HttpServlet {
    //private int dn=0;

    private static final long serialVersionUID = 1L;

    public FindMess() {
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
            String name = request.getParameter("name");
            ArrayList<UserAccount> listfriend = DbUtils.FindTK(name,UserID);
            request.setAttribute("listfriend", listfriend);
            
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
            ArrayList<upload> liststatusfr = DbUtils.allStatusFr(UserID);
            request.setAttribute("liststatusfr", liststatusfr);
            request.getRequestDispatcher("/PersonalPage.jsp").forward(request, response);
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(FindMess.class.getName()).log(Level.SEVERE, null, ex);

        }
    }

}
