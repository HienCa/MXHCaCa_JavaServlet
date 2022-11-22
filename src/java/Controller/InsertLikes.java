package Controller;

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
import Model.MySQLConntUtils;
import Model.upload;

@WebServlet("/InsertLikes")
public class InsertLikes extends HttpServlet {
    //private int dn=0;

    private static final long serialVersionUID = 1L;

    public InsertLikes() {
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
            int UserID = Integer.parseInt(session.getAttribute("UserID").toString());
            int StatusID = Integer.parseInt(request.getParameter("StatusID"));
            String Username = session.getAttribute("Username").toString();
            //UserAccount u= DbUtils.findUser(conn,Username);
            upload st = new upload(UserID, StatusID);
            st = DbUtils.findLikes(conn, UserID, StatusID);
            int a = 0;
            if (st != null) {
                a = 1;
                DbUtils.deleteLikes(conn, UserID, StatusID);
                DbUtils.updatelikeStatus(conn, StatusID, a);
            } else {
                a = 0;
                DbUtils.insertLikes(conn, UserID, StatusID);
                DbUtils.updatelikeStatus(conn, StatusID, a);
            }

            //DbUtils.insertDuocLMKB(conn, u.getUserID(),FUserID);
            request.getRequestDispatcher("/GetInfoDetailServlet").forward(request, response);

        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(InsertLikes.class.getName()).log(Level.SEVERE, null, ex);

        }
    }

}
