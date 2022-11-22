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

@WebServlet("/TimKiemServlet")
public class TimKiemServlet extends HttpServlet {
    //private int dn=0;

    private static final long serialVersionUID = 1L;

    public TimKiemServlet() {
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
            String Username = request.getParameter("Username"); //Lấy dữ liệu username từ form qua Servlet

            UserAccount usr = new UserAccount(Username);// Khởi tạo đối tượng useraccount để lưu username và password
            //tìm kiếm tài khoản từ cơ sở dữ liệu xem tài khoản đăng nhập có đúng không
            UserAccount u = DbUtils.findUser(conn, usr.getUsername());
            if (u != null) {

                request.setAttribute("FullName", u.getFullName());
                request.setAttribute("Avt", u.getAvt());
                request.setAttribute("Anhbia", u.getAnhbia());

                ArrayList<UserAccount> listfriend = DbUtils.ALLFriend(u.getUserID());
                request.setAttribute("listfriend", listfriend);
                request.getRequestDispatcher("/index.jsp").forward(request, response);
            } else {
                response.setContentType("text/html;charset=UTF-8");
                try ( PrintWriter out = response.getWriter()) {
                    out.println("<!DOCTYPE html>");
                    out.println("<html>");
                    out.println("<head>");
                    out.println("<title> Thông báo </title>");
                    out.println("</head>");
                    out.println("<body>");
                    out.println("<h1>Thông tin đăng nhập không chính xác <a href='signin.jsp'>Nhập lại</a></h1>");
                    out.println("</body>");
                    out.println("</html>");
                }

            }
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(TimKiemServlet.class.getName()).log(Level.SEVERE, null, ex);

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
            request.getRequestDispatcher("/index.jsp").forward(request, response);
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(TimKiemServlet.class.getName()).log(Level.SEVERE, null, ex);

        }
    }
}
