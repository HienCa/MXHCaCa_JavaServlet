package Controller;

import Model.Chat;
import Model.Conversation;
import Model.Conversationdetail;
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
import Model.Message;
import Model.MySQLConntUtils;
import Model.UserAccount;
import Model.upload;

@WebServlet("/DangNhapServlet")
public class DangNhapServlet extends HttpServlet {
    //private int dn=0;

    private static final long serialVersionUID = 1L;

    public DangNhapServlet() {
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
            //xử lý tham số từ form
            String Username = request.getParameter("Username"); //Lấy dữ liệu username từ form qua Servlet
            String password = request.getParameter("password");// lấy dữ liệu password từ form qua Servlet
            
            UserAccount usr = new UserAccount(Username, password);// Khởi tạo đối tượng useraccount để lưu username và password
            //tìm kiếm tài khoản từ cơ sở dữ liệu xem tài khoản đăng nhập có đúng không
            UserAccount u = DbUtils.findUser(conn, usr.getUsername(), usr.getPassword());
            if (u != null) {

                HttpSession session = request.getSession();
                session.setAttribute("UserID", u.getUserID());
                session.setAttribute("TenTK", u.getFullName());
                session.setAttribute("Username", u.getUsername());
                session.setAttribute("Avt", u.getAvt());
                session.setAttribute("Anhbia", u.getAnhbia());

                ArrayList<UserAccount> listfriend = DbUtils.ALLFriend(u.getUserID());
                request.setAttribute("listfriend", listfriend);

                ArrayList<upload> liststatusfr = DbUtils.allStatusFr(u.getUserID());
                
                UserAccount us = new UserAccount();
                us.setUserID(u.getUserID());
                ArrayList<Message> listConv = DbUtils.AllConversation(us.getUserID());
                for (Message l:listConv)
                {
                    
                    Message m = new Message();
                    m = DbUtils.getMessage(l.getConvd().getConv().getConversationID());
                    l.setMessageID(m.getMessageID());
                    l.setMessageContent(m.getMessageContent());
                    l.setUserID(m.getUserID());
                    
                    
                }
                request.setAttribute("listConv", listConv);
                    
                request.setAttribute("liststatusfr", liststatusfr);

                request.getRequestDispatcher("/PersonalPage.jsp").forward(request, response);
            } else {
                request.setAttribute("Error", "UserName hoặc Password không chính xác!");
                request.getRequestDispatcher("/index.jsp").forward(request, response); 
                

            }
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(DangNhapServlet.class.getName()).log(Level.SEVERE, null, ex);

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
            ArrayList<UserAccount> listfriend = DbUtils.ALLFriend(u.getUserID());
            request.setAttribute("listfriend", listfriend);
            request.getRequestDispatcher("/index.jsp").forward(request, response);
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(DangNhapServlet.class.getName()).log(Level.SEVERE, null, ex);

        }
    }
}
