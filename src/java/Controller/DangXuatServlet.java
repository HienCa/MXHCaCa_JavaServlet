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

@WebServlet("/DangXuatServlet")
public class DangXuatServlet extends HttpServlet {
    //private int dn=0;

    private static final long serialVersionUID = 1L;

    public DangXuatServlet() {
        super();

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

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
            // lấy dữ liệu password từ form qua Servlet

            HttpSession session = request.getSession();
            int UserID = Integer.parseInt(session.getAttribute("UserID").toString());
            int active = 0;
            DbUtils.updateUserDN(conn, UserID, active);

            request.getRequestDispatcher("/index.jsp").forward(request, response);

        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(DangXuatServlet.class.getName()).log(Level.SEVERE, null, ex);

        }
    }
}
