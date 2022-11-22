package Controller;

import static Model.DbUtils.insertUserAccount;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Model.DbUtils;
import Model.MySQLConntUtils;
import Model.UserAccount;

@WebServlet(name = "DangKyServlet", urlPatterns = {"/DangKyServlet"})
public class DangKyServlet extends HttpServlet {

    /**
     *
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Connection conn = null; //connect SQL
        try { //xử lý tham số từ form
            request.setCharacterEncoding("utf-8");
            response.setCharacterEncoding("utf-8");
            String FullName = request.getParameter("FullName");// lấy dữ liệu FullName từ form 
            String Username = request.getParameter("Username"); //lấy dữ liệu UserName từ form
            String Password = request.getParameter("Password");// lấy dữ liệu Password từ form 
            String CPassword = request.getParameter("CPassword");// lấy dữ liệu CPassword từ form 
            String NgaySinh = request.getParameter("NgaySinh");
            String GioiTinh = request.getParameter("gioitinh");// lấy dữ liệu username từ form 
            
                
            
            conn = MySQLConntUtils.getMySQLConnection();
            //tìm kiếm tài khoản đã tồn tại chưa
            UserAccount ua = DbUtils.findUser(conn, Username);

            if (ua == null) {
                if (Password.equals(CPassword))
                {
                    // khởi tạo đối tượng để lưu username và password
                    UserAccount usr = new UserAccount(FullName, Username, Password, NgaySinh, GioiTinh);
                    // thêm tài khoản vào cơ sở dữ liệu
                    DbUtils.insertUserAccount(conn, usr);
                    System.out.print(usr.getUsername());
                    request.getRequestDispatcher("/index.jsp").forward(request, response);
                }
                else
                {
                    request.setAttribute("FullName", FullName);
                    request.setAttribute("UserName", Username);
                    request.setAttribute("Password", Password);
                    request.setAttribute("Error", "Mật Khẩu Và Nhập Lại Mật Khẩu Không Trùng Khớp!");
                    request.getRequestDispatcher("/signup.jsp").forward(request, response);
                }
            } else {
                request.setAttribute("FullName", FullName);
                request.setAttribute("CPassword", CPassword);
                request.setAttribute("Password", Password);
                request.setAttribute("ErrorUserName", "UserName đã tồn tại!");
                request.getRequestDispatcher("/signup.jsp").forward(request, response);
            }
            
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(DangKyServlet.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            if (conn != null) {
                try {
                    conn.close();
                } catch (SQLException ex) {
                    Logger.getLogger(DangKyServlet.class.getName()).log(Level.SEVERE, null, ex);
                }
            }

        }
        
    }
}
