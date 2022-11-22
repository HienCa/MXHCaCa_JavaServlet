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
import Model.UserAccount;

@WebServlet("/XoaXacNhanKBServlet")
public class XoaXacNhanKBServlet extends HttpServlet {
    //private int dn=0;

    private static final long serialVersionUID = 1L;

    public XoaXacNhanKBServlet() {
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
            int FUserID = Integer.parseInt(request.getParameter("FUserID"));
            HttpSession session = request.getSession();
            String Username = session.getAttribute("Username").toString();
            UserAccount u = DbUtils.findUser(conn, Username);
            DbUtils.DeleteXNKB(conn, u.getUserID(), FUserID);
            DbUtils.DeleteXNKB(conn, FUserID, u.getUserID());
            request.getRequestDispatcher("/FriendsServlet").forward(request, response);

        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(XoaXacNhanKBServlet.class.getName()).log(Level.SEVERE, null, ex);

        }
    }

}
