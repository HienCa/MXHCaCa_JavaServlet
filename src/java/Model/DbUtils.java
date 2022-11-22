package Model;

import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import javax.servlet.http.HttpSession;

public class DbUtils {

    // Bảo
    public static UserAccount findUser(Connection conn, String Username)
            throws SQLException {
        String sql = "Select * from users where Username = ?";
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setString(1, Username);
        ResultSet rs = pstm.executeQuery();
        if (rs.next()) {
            int UserID = rs.getInt("UserID");
            String FullName = rs.getString("FULLNAME");
            String Avt = rs.getString("Avt");
            String Anhbia = rs.getString("AnhBia");
            UserAccount ua = new UserAccount();
            ua.setUserID(UserID);
            ua.setFullName(FullName);
            ua.setAvt(Avt);
            ua.setAnhbia(Anhbia);
            ua.setEmail(Username);

            return ua;
        }
        return null;
    }
    
    public static UserAccount getUserDeatail(Connection conn, int ID)
            throws SQLException {
        String sql = "Select * from users where UserID = ?";
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setInt(1, ID);
        ResultSet rs = pstm.executeQuery();
        if (rs.next()) {
            int UserID = rs.getInt("UserID");
            String FullName = rs.getString("FULLNAME");
            String Username = rs.getString("Username");
            String Avt = rs.getString("Avt");
            String Anhbia = rs.getString("AnhBia");
            UserAccount ua = new UserAccount();
            ua.setUserID(UserID);
            ua.setFullName(FullName);
            ua.setAvt(Avt);
            ua.setAnhbia(Anhbia);
            ua.setEmail(Username);

            return ua;
        }
        return null;
    }

    public static UserAccount findUser(Connection conn, String Username, String password) throws SQLException {
        String sql = "Select UserID, FULLNAME, UserName, Password, Avt, AnhBia from users where Username = ? and Password = ?";
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setString(1, Username);
        pstm.setString(2, password);

        ResultSet rs = pstm.executeQuery();
        if (rs.next()) {
            int UserID = rs.getInt("UserID");
            String FullName = rs.getString("FULLNAME");
            String Avt = rs.getString("Avt");
            String Anhbia = rs.getString("AnhBia");
            UserAccount ua = new UserAccount();
            ua.setUserID(UserID);
            ua.setFullName(FullName);
            ua.setAvt(Avt);
            ua.setAnhbia(Anhbia);
            ua.setUsername(Username);
            ua.setPassword(password);
            return ua;
        }
        return null;
    }

    public static upload findLikes(Connection conn, int UserID, int StatusID) throws SQLException {
        String sql = "Select * from likes where UserID = ? and StatusID = ?";
        PreparedStatement pstm = conn.prepareStatement(sql);

        pstm.setInt(1, UserID);
        pstm.setInt(2, StatusID);
        ResultSet rs = pstm.executeQuery();
        while (rs.next()) {
            UserID = rs.getInt("UserID");
            StatusID = rs.getInt("StatusID");
            upload ul = new upload();
            ul.setUserID(UserID);
            ul.setStatusID(StatusID);
            return ul;
        }
        return null;
    }

    public static void insertUserAccount(Connection conn, UserAccount user) throws SQLException {
        String sql = "Insert into users(FullName, Username, Password, Active) values (?,?,?,?)";
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setString(1, user.getFullName());
        pstm.setString(2, user.getUsername());
        pstm.setString(3, user.getPassword());
        pstm.setInt(4, 1);
        pstm.executeUpdate();
    }

    public static void insertLikes(Connection conn, int UserID, int StatusID) throws SQLException {
        String sql = "Insert into Likes(UserID, StatusID) values (?,?)";
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setInt(1, UserID);
        pstm.setInt(2, StatusID);

        pstm.executeUpdate();
    }

    public static void deleteLikes(Connection conn, int UserID, int StatusID) throws SQLException {
        String sql = "delete from Likes where UserID = ? and StatusID = ? ";
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setInt(1, UserID);
        pstm.setInt(2, StatusID);

        pstm.executeUpdate();
    }

    public static void deleteConv(Connection conn, int ConvID) throws SQLException {
        
        String sql = "delete from messages where ConversationdetailID in (select ID as ConversationID from conversationdetail where ConversationID = ?)";
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setInt(1, ConvID);
        

        pstm.executeUpdate();
        deleteConvd(conn, ConvID);
    }
    public static void deleteConvd(Connection conn, int ConvID) throws SQLException {
        
        String sql = "delete from conversationdetail where ConversationID = ?";
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setInt(1, ConvID);
        

        pstm.executeUpdate();
        deleteConversation(conn, ConvID);
    }
    
    public static void deleteConversation(Connection conn, int ConvID) throws SQLException {
        
        String sql = "delete from conversation where ConversationID = ?";
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setInt(1, ConvID);
        

        pstm.executeUpdate();
        
    }
    
    public static void updatelikeStatus(Connection conn, int StatusID, int a) throws SQLException {
        String sql = "";
        if (a == 0) {
            sql = "update status set likes = likes + 1 where StatusID = ?";
        } else if (a == 1) {
            sql = "update status set likes = likes - 1 where StatusID = ?";
        }
        PreparedStatement pstm = conn.prepareStatement(sql);

        pstm.setInt(1, StatusID);

        pstm.executeUpdate();
    }

    public static ArrayList<UserAccount> ALLFriend(int UserID) throws SQLException, ClassNotFoundException {
        Connection con = null;
        ArrayList<UserAccount> list = new ArrayList();
//select * from Friends f join relation r on f.UserID = r.FUserID where r.UserID = 1 and TrangThai = 1;
        con = MySQLConntUtils.getMySQLConnection();
        String sql = "select * from users u join relation r on u.UserID = r.FUserID where r.UserID = ? and TrangThai = 1";
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setInt(1, UserID);

        ResultSet rs = ps.executeQuery();
        while (rs.next()) {
            int FUserID = rs.getInt("FUserID");
            String FullName = rs.getString("FullName");
            String Avt = rs.getString("Avt");
            UserAccount u = new UserAccount();
            u.setUserID(FUserID);
            u.setFullName(FullName);
            u.setAvt(Avt);
            list.add(u);
        }

        return list;
    }
    public static ArrayList<Friends> ALLFriendS(int UserID) throws SQLException, ClassNotFoundException {
        Connection con = null;
        ArrayList<Friends> list = new ArrayList();
//select * from Friends f join relation r on f.UserID = r.FUserID where r.UserID = 1 and TrangThai = 1;

        con = MySQLConntUtils.getMySQLConnection();
        String sql = "select * from Friends f join relation r on f.UserID = r.FUserID where r.UserID = ? and TrangThai = 1;";
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setInt(1, UserID);

        ResultSet rs = ps.executeQuery();
        while (rs.next()) {
            int FriendID = rs.getInt("FriendID");
            String FullName = rs.getString("FullName");
            String Avt = rs.getString("Avt");
            int userID = rs.getInt("UserID");
            
            Friends u = new Friends();
            u.setFriendID(FriendID);
            u.setFullName(FullName);
            u.setAvt(Avt);
            u.setUserID(userID);
            
            list.add(u);
        }

        return list;
    }

    public static ArrayList<UserAccount> ALLFriendLim(int UserID) throws SQLException, ClassNotFoundException {
        Connection con = null;
        ArrayList<UserAccount> list = new ArrayList();

        con = MySQLConntUtils.getMySQLConnection();
        String sql = "select * from users u join relation r on u.UserID = r.FUserID where r.UserID = ? and TrangThai = 1 limit 5";
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setInt(1, UserID);

        ResultSet rs = ps.executeQuery();
        while (rs.next()) {
            int FUserID = rs.getInt("FUserID");
            String FullName = rs.getString("FullName");
            String Avt = rs.getString("Avt");
            UserAccount u = new UserAccount();
            u.setUserID(FUserID);
            u.setFullName(FullName);
            u.setAvt(Avt);
            list.add(u);
        }

        return list;
    }

    public static ArrayList<UserAccount> ALLFriendxn(int UserID) throws SQLException, ClassNotFoundException {
        Connection con = null;
        ArrayList<UserAccount> list = new ArrayList();

        con = MySQLConntUtils.getMySQLConnection();
        String sql = "select * from users u join relation r on u.UserID = r.FUserID where r.UserID = ? and TrangThai = 0";
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setInt(1, UserID);

        ResultSet rs = ps.executeQuery();
        while (rs.next()) {
            int FUserID = rs.getInt("FUserID");
            String FullName = rs.getString("FullName");
            String Avt = rs.getString("Avt");
            UserAccount u = new UserAccount();
            u.setUserID(FUserID);
            u.setFullName(FullName);
            u.setAvt(Avt);
            list.add(u);
        }

        return list;
    }

    public static ArrayList<UserAccount> ALLUsernotfriend(int UserID) throws SQLException, ClassNotFoundException {
        Connection con = null;
        ArrayList<UserAccount> list = new ArrayList();

        con = MySQLConntUtils.getMySQLConnection();
        String sql = "SELECT * from users where (UserID not in (select FUserID from relation where UserID = ?) and UserID <> ?)";
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setInt(1, UserID);
        ps.setInt(2, UserID);
        
        ResultSet rs = ps.executeQuery();
        while (rs.next()) {
            UserID = rs.getInt("UserID");
            String FullName = rs.getString("FullName");
            String Avt = rs.getString("Avt");
            UserAccount u = new UserAccount();
            u.setUserID(UserID);
            u.setFullName(FullName);
            u.setAvt(Avt);
            list.add(u);
        }

        return list;
    }

    public static ArrayList<UserAccount> ALLUser(int UserID) throws SQLException, ClassNotFoundException {
        Connection con = null;
        ArrayList<UserAccount> list = new ArrayList();

        con = MySQLConntUtils.getMySQLConnection();
        String sql = "SELECT * from users where UserID in (select FUserID from relation where UserID = ? and TrangThai = 2)";
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setInt(1, UserID);
        
        ResultSet rs = ps.executeQuery();
        while (rs.next()) {
            UserID = rs.getInt("UserID");
            String FullName = rs.getString("FullName");
            String Avt = rs.getString("Avt");
            UserAccount u = new UserAccount();
            u.setUserID(UserID);
            u.setFullName(FullName);
            u.setAvt(Avt);
            list.add(u);
        }

        return list;
    }
    
    public static int getLUserID(Connection conn, int StatusID) throws SQLException, ClassNotFoundException {
        Connection con = null;
        int LUserID = 0;

        con = MySQLConntUtils.getMySQLConnection();
        String sql = "SELECT UserID as LUserID from likes where StatusID = ?";
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setInt(1, StatusID);

        ResultSet rs = ps.executeQuery();
        while (rs.next()) {

            LUserID = rs.getInt("LUserID");

        }

        return LUserID;
    }

    public static ArrayList<upload> AllStatus(int UserID) throws SQLException, ClassNotFoundException {
        Connection con = null;
        ArrayList<upload> list = new ArrayList();

        con = MySQLConntUtils.getMySQLConnection();
        String sql = "SELECT UserID, s.StatusID as StatusID, StatusCaption, StatusImages, Likes, DateTimeUpload from upload u, status s where u.StatusID = s.StatusID and UserID = ?";
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setInt(1, UserID);
        String like = "";
        ResultSet rs = ps.executeQuery();
        while (rs.next()) {
            UserID = rs.getInt("UserID");
            int StatusID = rs.getInt("StatusID");
            int LUserID = DbUtils.getLUserID(con, StatusID);
            String StatusCaption = rs.getString("StatusCaption");
            String StatusImages = rs.getString("StatusImages");
            int Likes = rs.getInt("Likes");
            if (UserID == LUserID) {
                like = "blue";
            } else {
                like = "";
            }
            String DateTimeUpload = rs.getString("DateTimeUpload");
            
            upload ul = new upload();
            ul.setUserID(UserID);
            ul.setStatusID(StatusID);
            ul.setStatusCaption(StatusCaption);
            ul.setStatusImages(StatusImages);
            ul.setLikes(Likes);
            ul.setDateTimeUpload(DateTimeUpload);
            
            ul.setLike(like);
            list.add(ul);
        }

        return list;
    }

    public static void UpdateKB(Connection conn, int UserID, int FUserID) throws SQLException {
        String sql = "Update relation set TrangThai = 1 where UserID = ? and FUserID = ?";
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setInt(1, UserID);
        pstm.setInt(2, FUserID);
        pstm.executeUpdate();
    }

    public static void updateUserDN(Connection conn, int UserID, int active) throws SQLException {
        String sql = "Update users set Active = ? where UserID = ?";
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setInt(1, active);
        pstm.setInt(2, UserID);

        pstm.executeUpdate();
    }

    public static void DeleteXNKB(Connection conn, int UserID, int FUserID) throws SQLException {
        String sql = "delete from relation where UserID = ? and FUserID = ?";
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setInt(1, UserID);
        pstm.setInt(2, FUserID);
        pstm.executeUpdate();
    }

    public static void UpdateDuocKB(Connection conn, int UserID, int FUserID) throws SQLException {
        String sql = "Update relation set TrangThai = 1 where UserID = ? and FUserID = ?";
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setInt(1, FUserID);
        pstm.setInt(2, UserID);
        pstm.executeUpdate();
    }

    public static void insertLMKB(Connection conn, int UserID, int FUserID) throws SQLException {
        String sql = "insert into relation(UserID, FUserID, TrangThai) values (?,?,?)";
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setInt(1, UserID);
        pstm.setInt(2, FUserID);
        pstm.setInt(3, 2);
        pstm.executeUpdate();
    }

    public static void insertDuocLMKB(Connection conn, int UserID, int FUserID) throws SQLException {
        String sql = "insert into relation(UserID, FUserID, TrangThai) values (?,?,?)";
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setInt(1, FUserID);
        pstm.setInt(2, UserID);
        pstm.setInt(3, 0);
        pstm.executeUpdate();
    }

    public static void insertstatus(Connection conn, Status st) throws SQLException {
        String sql = "insert into status(StatusCaption, StatusImages, likes) values (?,?,?)";
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setString(1, st.getStatusCaption());
        pstm.setString(2, st.getStatusImages());
        pstm.setInt(3, 0);
        pstm.executeUpdate();
    }

    public static void insertupload(Connection conn, int UserID, int StatusID) throws SQLException {
        String sql = "insert into upload(UserID, StatusID, DateTimeUpload) values (?,?,now())";
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setInt(1, UserID);
        pstm.setInt(2, StatusID);

        pstm.executeUpdate();
    }

    public static int getStatusID(Connection conn) throws SQLException {
        String sql = "SELECT Max(StatusID) as StatusID from status";
        PreparedStatement ps = conn.prepareStatement(sql);
        int StatusID = 0;
        ResultSet rs = ps.executeQuery();
        while (rs.next()) {
            StatusID = rs.getInt("StatusID");

        }

        return StatusID;

    }

    public static int SLFriend(Connection conn, int UserID) throws SQLException {
        String sql = "SELECT count(FUserID) as SLFriend from relation where UserID = ? and TrangThai = 1";
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setInt(1, UserID);
        ResultSet rs = pstm.executeQuery();
        int SLFriend = 0;
        while (rs.next()) {
            SLFriend = rs.getInt("SLFriend");

        }

        return SLFriend;

    }

    public static ArrayList<upload> allStatusFr(int UserID) throws SQLException, ClassNotFoundException {
        Connection conn = null;
        ArrayList<upload> list = new ArrayList();

        conn = MySQLConntUtils.getMySQLConnection();
        String sql = "select us.UserID as UserID, s.StatusID as StatusID, Fullname, StatusCaption, StatusImages, Likes, DateTimeUpload from relation r join upload u on r.FUserID = u.UserID join users us on us.UserID = u.UserID join status s on s.StatusID = u.StatusID WHERE r.UserID = ? and TrangThai = 1";
        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setInt(1, UserID);
        String like = "";
        ResultSet rs = ps.executeQuery();
        while (rs.next()) {
            UserID = rs.getInt("UserID");
            int StatusID = rs.getInt("StatusID");
            int LUserID = DbUtils.getLUserID(conn, StatusID);
            String StatusCaption = rs.getString("StatusCaption");
            String StatusImages = rs.getString("StatusImages");
            int Likes = rs.getInt("Likes");
            if (UserID == LUserID) {
                like = "blue";
            } else {
                like = "";
            }
            String DateTimeUpload = rs.getString("DateTimeUpload");
            
            String FullName = rs.getString("Fullname");

            upload ul = new upload();
            ul.setUserID(UserID);
            ul.setStatusID(StatusID);
            ul.setStatusCaption(StatusCaption);
            ul.setStatusImages(StatusImages);
            ul.setLikes(Likes);
            ul.setDateTimeUpload(DateTimeUpload);
            
            ul.setLike(like);
            ul.setFullName(FullName);
            list.add(ul);
        }

        return list;
    }
    
    
    /*public static ArrayList<Conversation> AllConversation() throws SQLException, ClassNotFoundException {
        Connection conn = null;
        ArrayList<Conversation> list = new ArrayList();
        //SELECT m.messagesID as messagesID, cv.ConversationID as ConversationID, U.UserID AS UserID, F.FUserID AS FRIENDID, messagesContent, ConversationName, u.fullName fullU, u.username UU, u.email EU, u.PASSWORD PU, u.avt AVTU, u.anhbia AU, u.hometown HU, u.school SU, u.relationship RU, u.hobbies HOBU, u.active ACU, u.ngaysinh NU, u.gioitinh GU,f.fullName fullF, f.username UF, f.email EF, f.PASSWORD PF, f.avt AVTF, f.anhbia AF,f.hometown HF, f.school SF, f.relationship RF, f.hobbies HOBF, f.active ACF, f.ngaysinh NF, f.gioitinh GF FROM chat c join messages m on c.messagesID=m.messagesID join conversation cv on c.ConversationID=cv.ConversationID join users u on c.UserID=u.UserID join friends f on c.FRIENDID=f.FRIENDID WHERE U.UserID=?  ORDER BY m.messagesID DESC LIMIT 1;
        conn = MySQLConntUtils.getMySQLConnection();
        String sql = "SELECT ConversationID, ConversationName from conversation";
        PreparedStatement ps = conn.prepareStatement(sql);
        
        ResultSet rs = ps.executeQuery();
        while (rs.next()) {
            
            
            int ConversationID = rs.getInt("ConversationID");
            String ConvName = rs.getString("ConversationName");
            Conversation c = new Conversation();
            c.setConversationID(ConversationID);
            c.setConversationName(ConvName);
            
            
            list.add(c);
        }

        return list;
    }*/
    
    public static ArrayList<Message> AllConversation(int UserID) throws SQLException, ClassNotFoundException {
        Connection conn = null;
        ArrayList<Message> list = new ArrayList();
        //SELECT m.messagesID as messagesID, cv.ConversationID as ConversationID, U.UserID AS UserID, F.FUserID AS FRIENDID, messagesContent, ConversationName, u.fullName fullU, u.username UU, u.email EU, u.PASSWORD PU, u.avt AVTU, u.anhbia AU, u.hometown HU, u.school SU, u.relationship RU, u.hobbies HOBU, u.active ACU, u.ngaysinh NU, u.gioitinh GU,f.fullName fullF, f.username UF, f.email EF, f.PASSWORD PF, f.avt AVTF, f.anhbia AF,f.hometown HF, f.school SF, f.relationship RF, f.hobbies HOBF, f.active ACF, f.ngaysinh NF, f.gioitinh GF FROM chat c join messages m on c.messagesID=m.messagesID join conversation cv on c.ConversationID=cv.ConversationID join users u on c.UserID=u.UserID join friends f on c.FRIENDID=f.FRIENDID WHERE U.UserID=?  ORDER BY m.messagesID DESC LIMIT 1;
        conn = MySQLConntUtils.getMySQLConnection();
        String sql = "select DISTINCT u.UserID as UserID, ID, c.ConversationID as ConversationID, NickName, Avt from  conversation c join conversationdetail cd on c.ConversationID = cd.ConversationID join users u on u.UserID = cd.UserID where cd.UserID <> ? and cd.ConversationID in (select cd.ConversationID from conversationdetail cd join conversation c on cd.ConversationID = c.ConversationID where UserID = ? and c.ConversationName is null) ORDER by c.TimeConv desc";
        //String sql = "select DISTINCT u.UserID as UserID, ID, c.ConversationID as ConversationID, NickName, Avt from  conversation c join conversationdetail cd on c.ConversationID = cd.ConversationID join users u on u.UserID = cd.UserID join messages m on m.ConversationdetailID = cd.ID where  cd.ConversationID in (select cd.ConversationID from conversationdetail cd join conversation c on cd.ConversationID = c.ConversationID where UserID = ? and c.ConversationName is null) ORDER by m.Time desc";
        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setInt(1, UserID);
        ps.setInt(2, UserID);
        ResultSet rs = ps.executeQuery();
        while (rs.next()) {
            int FUserID = rs.getInt("userID");
            String Avt = rs.getString("Avt");
            UserAccount ua = new UserAccount();
            ua.setAvt(Avt);
            ua.setUserID(FUserID);
            int ConversationID = rs.getInt("ConversationID");
            //String ConvName = rs.getString("ConvName");
            Conversation c = new Conversation();
            c.setConversationID(ConversationID);
            //c.setConversationName(ConvName);
            int ID = rs.getInt("ID");       
            String NickName = rs.getString("NickName");
            Conversationdetail cd = new Conversationdetail();
            cd.setID(ID);
            cd.setUa(ua);
            cd.setConv(c);
            cd.setNickName(NickName);
            
            Message m = new Message();
            
            
            m.setConvd(cd);
            
            //System.out.println(m.getConvd().getUa().getAvt());
            list.add(m);
            
        }
        
        return list;
    }
    
    //Lấy tin nhắn mới nhất của cuộc trò chuyện
    public static Message getMessage(int convID) throws SQLException, ClassNotFoundException {
        Connection conn = null;

        conn = MySQLConntUtils.getMySQLConnection();
        String sql = "select messagesID , MessagesContent, UserID from messages m join conversationdetail cd on cd.ID = m.ConversationdetailID where cd.ConversationID = ? order by Time desc limit 1";
        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setInt(1, convID);
        
        
        ResultSet rs = ps.executeQuery();
        if (rs.next()) {

            int MessageID = rs.getInt("messagesID");
            int UserID = rs.getInt("UserID");
            
            
            String MessagesContent = rs.getString("MessagesContent");
            Message m = new Message();
            
            m.setMessageID(MessageID);
            m.setMessageContent(MessagesContent);
            m.setUserID(UserID);
            
            return m;
        }
        return null;
    }
    // Load nd chat
    public static ArrayList<Message> AllConversationDetail(int ConvID) throws SQLException, ClassNotFoundException {
        Connection conn = null;
        ArrayList<Message> list = new ArrayList();

        conn = MySQLConntUtils.getMySQLConnection();
        String sql = "SELECT cd.ID as ConvdID, NickName, u.Avt as Avt, cd.UserID as UserID, m.messagesID as messagesID, cd.ConversationID as ConversationID,   messagesContent FROM conversationdetail cd join messages m on m.ConversationdetailID = cd.ID join users u on u.UserID = cd.UserID WHERE cd.ConversationID = ? order by Time";
        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setInt(1, ConvID);
        

        ResultSet rs = ps.executeQuery();
        while (rs.next()) {
            int ConversationID = rs.getInt("ConversationID");
            //String ConversationName = rs.getString("ConversationName");
            int messagesID = rs.getInt("messagesID");
            
            int UserID = rs.getInt("UserID");
            String Avt = rs.getString("Avt");
            String messagesContent = rs.getString("messagesContent");
            String NickName = rs.getString("NickName");
            int ConvdID = rs.getInt("ConvdID");
            UserAccount us = new UserAccount();
            us.setUserID(UserID);
            us.setAvt(Avt);
            Conversation c = new Conversation();
            c.setConversationID(ConversationID);
            Conversationdetail cd = new Conversationdetail();
            cd.setUa(us);
            cd.setConv(c);
            cd.setNickName(NickName);
            cd.setID(ConvdID);

            
            Message m = new Message();
            m.setMessageID(messagesID);
            m.setMessageContent(messagesContent);
            m.setConvd(cd);
            list.add(m);
        }

        return list;
    }
    
    public static int getConvdID(int UserID, int ConvID) throws SQLException, ClassNotFoundException {
        Connection conn = null;
        

        conn = MySQLConntUtils.getMySQLConnection();
        String sql = "select ID as ConvdID from Conversationdetail where UserID = ? and ConversationID = ?";
        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setInt(1, UserID);
        ps.setInt(2, ConvID);
        int ConvdID = 0;
        ResultSet rs = ps.executeQuery();
        if (rs.next()) {
            
            ConvdID = rs.getInt("ConvdID");
            
            
        }

        return ConvdID;
    }
    
    public static ArrayList<UserAccount> FindTK(String name, int UserID) throws SQLException, ClassNotFoundException {
        Connection conn = null;
        ArrayList<UserAccount> list = new ArrayList();

        conn = MySQLConntUtils.getMySQLConnection();
        String sql = "select * from users u join relation r on u.UserID = r.FUserID where r.UserID = ? and TrangThai = 1 and FullName LIKE " + "'%" + name + "%'";
        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setInt(1, UserID);
        

        ResultSet rs = ps.executeQuery();
        while (rs.next()) {
            int FUserID = rs.getInt("UserID");
            String FullName = rs.getString("FullName");
            String Avt = rs.getString("Avt");
            UserAccount ua = new UserAccount();
            ua.setFullName(FullName);
            ua.setAvt(Avt);
            ua.setUserID(UserID);
            list.add(ua);
        }

        return list;
    }
    
    public static void insertConversation(Connection conn) throws SQLException {
        String sql = "insert into conversation(ConversationName, TimeConv) values (null, now())";
        PreparedStatement pstm = conn.prepareStatement(sql);
       

        pstm.executeUpdate();
    }
    
    public static void updateConversation(Connection conn, int ConvID) throws SQLException {
        String sql = "update conversation set TimeConv = now() where ConversationID = ?";
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setInt(1, ConvID);

        pstm.executeUpdate();
    }
    
    public static void insertConversationDetail(Connection conn, int ConvID, int UserID) throws SQLException {
        UserAccount ua = new UserAccount();
        ua = getInfoUser(conn, UserID);
        String NickName = ua.getFullName();
        String sql = "insert into conversationdetail(UserID, ConversationID, NickName) values (?, ?, ?)";
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setInt(1, UserID);
        pstm.setInt(2, ConvID);
        pstm.setString(3, NickName);
        pstm.executeUpdate();
    }
    
    public static UserAccount getInfoUser(Connection conn, int FUserID) throws SQLException {
        String sql = "Select FULLNAME, Avt from users where UserID = ?";
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setInt(1, FUserID);
        

        ResultSet rs = pstm.executeQuery();
        if (rs.next()) {
            
            String FullName = rs.getString("FULLNAME");
            String Avt = rs.getString("Avt");
            
            UserAccount ua = new UserAccount();
            
            ua.setFullName(FullName);
            ua.setAvt(Avt);
            
            return ua;
        }
        return null;
    }
    
    public static Conversationdetail getconvID(Connection con, int UserID, int FUserID) throws SQLException {
        
        
        String sql = "SELECT cd.UserID, ConversationID, Avt, NickName  from conversationdetail cd join users u on u.UserID = cd.UserID WHERE cd.UserID = ? and ConversationID in (SELECT cd.ConversationID from conversationdetail cd join conversation c on c.ConversationID = cd.ConversationID  WHERE UserID = ? and c.ConversationName is null)";
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setInt(1, FUserID);
        ps.setInt(2, UserID);
        ResultSet rs = ps.executeQuery();
        
        if (rs.next()) {
           int ConversationID = rs.getInt("ConversationID");
           String AvtF = rs.getString("Avt");
           String NickName = rs.getString("NickName");
           UserAccount ua = new UserAccount();
           ua.setAvt(AvtF);
           ua.setUserID(FUserID);
           Conversation c = new Conversation();
           c.setConversationID(ConversationID);
           Conversationdetail cd = new Conversationdetail();
           cd.setNickName(NickName);
           cd.setUa(ua);
           cd.setConv(c);
           return cd;
        }
        
        return null;
    }
    
    public static int MaxConvID(Connection con) throws SQLException {
        
        
        String sql = "SELECT Max(conversationID) as conversationID from conversation";
        PreparedStatement ps = con.prepareStatement(sql);
        
        ResultSet rs = ps.executeQuery();
        
        if (rs.next()) {
           int ConversationID = rs.getInt("ConversationID");
           
           return ConversationID;
        }
        
        return 0;
    }
    public static int ConvdID(Connection con, int UserID, int ConvID) throws SQLException {
        
        
        String sql = "SELECT ID as conversationdetailID from conversationdetail where UserID = ? and ConversationID = ?";
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setInt(1, UserID);
        ps.setInt(2, ConvID);
        ResultSet rs = ps.executeQuery();
        
        if (rs.next()) {
           int ConversationdetailID = rs.getInt("ConversationdetailID");
           
           return ConversationdetailID;
        }
        
        return 0;
    }
    
    //Hiền
    public static void updateUserAccountCoverPhoto(Connection conn, UserAccount user) throws SQLException {
        String sql = "update users set AnhBia = ? where userID = ?";
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setString(1, user.getAnhbia());
        pstm.setInt(2, user.getUserID());

        pstm.executeUpdate();
    }

    public static void updateUserAccountAvatar(Connection conn, UserAccount user) throws SQLException {
        String sql = "update users set avt = ? where userID = ?";
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setString(1, user.getAvt());
        pstm.setInt(2, user.getUserID());

        pstm.executeUpdate();
    }

    // CONVERSATION
    //lấy các cuộc hội thội 
    /*public static ArrayList<Message> AllConversation(UserAccount u) throws SQLException, ClassNotFoundException {
        Connection conn = null;
        ArrayList<Message> list = new ArrayList();
        //SELECT m.messagesID as messagesID, cv.ConversationID as ConversationID, U.UserID AS UserID, F.FUserID AS FRIENDID, messagesContent, ConversationName, u.fullName fullU, u.username UU, u.email EU, u.PASSWORD PU, u.avt AVTU, u.anhbia AU, u.hometown HU, u.school SU, u.relationship RU, u.hobbies HOBU, u.active ACU, u.ngaysinh NU, u.gioitinh GU,f.fullName fullF, f.username UF, f.email EF, f.PASSWORD PF, f.avt AVTF, f.anhbia AF,f.hometown HF, f.school SF, f.relationship RF, f.hobbies HOBF, f.active ACF, f.ngaysinh NF, f.gioitinh GF FROM chat c join messages m on c.messagesID=m.messagesID join conversation cv on c.ConversationID=cv.ConversationID join users u on c.UserID=u.UserID join friends f on c.FRIENDID=f.FRIENDID WHERE U.UserID=?  ORDER BY m.messagesID DESC LIMIT 1;
        conn = MySQLConntUtils.getMySQLConnection();
        String sql = "SELECT DISTINCT  u.Avt as Avt, cs.ConversationID as ConversationID, c.ID as ID, cs.ConversationName as ConvName, c.NickName as NickName FROM conversationdetail c join conversation cs on c.ConversationID = cs.ConversationID join users u on u.UserID = c.UserID WHERE u.UserID <> ?";
        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setInt(1, u.getUserID());
        ResultSet rs = ps.executeQuery();
        while (rs.next()) {
            
            String Avt = rs.getString("Avt");
            
            u.setAvt(Avt);
            int ConversationID = rs.getInt("ConversationID");
            String ConvName = rs.getString("ConvName");
            Conversation c = new Conversation();
            c.setConversationID(ConversationID);
            c.setConversationName(ConvName);
            int ID = rs.getInt("ID");       
            String NickName = rs.getString("NickName");
            Conversationdetail cd = new Conversationdetail();
            cd.setID(ID);
            cd.setUa(u);
            cd.setConv(c);
            cd.setNickName(NickName);
            
            Message m = new Message();
            m = getMessage(c.getConversationID());
            m.setConvd(cd);
            System.out.println(m.getConvd().getUa().getUserID());
            
            list.add(m);
        }

        return list;
    }*/
    
    // load tin nhắn
    /*public static ArrayList<Chat> AllConversationDetail(UserAccount u, int FriendID) throws SQLException, ClassNotFoundException {
        Connection conn = null;
        ArrayList<Chat> list = new ArrayList();

        conn = MySQLConntUtils.getMySQLConnection();
        String sql = "SELECT m.messagesID as messagesID, OwnerMessage, cv.ConversationID as ConversationID, U.UserID AS UserID, F.FRIENDID AS FRIENDID, messagesContent, ConversationName, u.fullName fullU, u.username UU, u.email EU, u.PASSWORD PU, u.avt AVTU, u.anhbia AU, u.hometown HU, u.school SU, u.relationship RU, u.hobbies HOBU, u.active ACU, u.ngaysinh NU, u.gioitinh GU,f.fullName fullF, f.username UF, f.email EF, f.PASSWORD PF, f.avt AVTF, f.anhbia AF,f.hometown HF, f.school SF, f.relationship RF, f.hobbies HOBF, f.active ACF, f.ngaysinh NF, f.gioitinh GF FROM chat c join messages m on c.messagesID=m.messagesID join conversation cv on c.ConversationID=cv.ConversationID join users u on c.UserID=u.UserID join friends f on c.FRIENDID=f.FRIENDID WHERE U.UserID=? and F.FRIENDID=? ";
        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setInt(1, u.getUserID());
        ps.setInt(2, FriendID);

        ResultSet rs = ps.executeQuery();
        while (rs.next()) {
            int ConversationID = rs.getInt("ConversationID");
            String ConversationName = rs.getString("ConversationName");
            int messagesID = rs.getInt("messagesID");
            int OwnerMessage = rs.getInt("OwnerMessage");
            int UserID = rs.getInt("UserID");
            String messagesContent = rs.getString("messagesContent");
            String fullName = rs.getString("FULLU");
            String username = rs.getString("UU");
            String email = rs.getString("EU");
            String password = rs.getString("PU");
            String Avt = rs.getString("avtU");
            String Anhbia = rs.getString("AU");
            String homeTown = rs.getString("HU");
            String school = rs.getString("SU");
            String relationship = rs.getString("RU");
            String hobbies = rs.getString("HOBU");
            String active = rs.getString("ACU");
            String ngaySinh = rs.getString("NU");
            String gioiTinh = rs.getString("GU");

            UserAccount us = new UserAccount(UserID, fullName, username, email, password, ngaySinh,
                    gioiTinh, Avt, Anhbia, homeTown, school, relationship, hobbies, active);
            Message m = new Message(messagesID, messagesContent, OwnerMessage);
            Conversation c = new Conversation(ConversationID, ConversationName);

            int FRIENDID = rs.getInt("FRIENDID");
            String FULLF = rs.getString("FULLF");
            String UF = rs.getString("UF");
            String EF = rs.getString("EF");
            String PF = rs.getString("PF");
            String avtF = rs.getString("avtF");
            String AF = rs.getString("AF");
            String HF = rs.getString("HF");
            String SF = rs.getString("SF");
            String RF = rs.getString("RF");
            String HOBF = rs.getString("HOBF");
            String ACF = rs.getString("ACF");
            String NF = rs.getString("NF");
            String GF = rs.getString("GF");

            Friends f = new Friends(FRIENDID, FULLF, UF, EF, PF, avtF, AF, HF, SF, RF, HOBF, ACF, NF, GF);
            Chat chat = new Chat(us, m, c);
            list.add(chat);
        }

        return list;
    }*/
    public static ArrayList<Conversation> AllConversationDetailFIX(UserAccount u, int FriendID) throws SQLException, ClassNotFoundException {
        Connection conn = null;
        ArrayList<Conversation> list = new ArrayList();

        conn = MySQLConntUtils.getMySQLConnection();
        String sql = "SELECT * FROM conversation Where userid=? and friendid=?";
        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setInt(1, u.getUserID());
        ps.setInt(2, FriendID);

        ResultSet rs = ps.executeQuery();
        while (rs.next()) {
            int ConversationID = rs.getInt("ConversationID");
            String ConversationName = rs.getString("ConversationName");
            
            Conversation c = new Conversation(ConversationID, ConversationName);

            
            list.add(c);
        }

        return list;
    }

    public static Chat OneConversationDetail(UserAccount u, int FriendID) throws SQLException, ClassNotFoundException {
        Connection conn = null;

        conn = MySQLConntUtils.getMySQLConnection();
        String sql = "SELECT F.Avt AS AF, F.FULLNAME FULLF, ConversationID, U.UserID AS UserID, F.FRIENDID AS FRIENDID FROM chat c join users u on c.UserID=u.UserID join friends f on c.FRIENDID=f.FRIENDID WHERE U.UserID=? and F.FRIENDID=?";
        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setInt(1, u.getUserID());
        ps.setInt(2, FriendID);

        ResultSet rs = ps.executeQuery();
        if (rs.next()) {

            int UserID = rs.getInt("UserID");

            UserAccount us = new UserAccount();
            us.setUserID(UserID);

            Conversation c = new Conversation();
            int ConversationID = rs.getInt("ConversationID");
            c.setConversationID(ConversationID);
            Message m = new Message();

            int FRIENDID = rs.getInt("FRIENDID");
            String FULLF = rs.getString("FULLF");
            String AF = rs.getString("AF");

            Friends f = new Friends();
            f.setFriendID(FRIENDID);
            f.setAvt(AF);
            f.setFullName(FULLF);
            Chat chat = new Chat(us, m, c);
            return chat;
        }

        return null;
    }

    public static int getMessageID(UserAccount u, int UserID) throws SQLException, ClassNotFoundException {
        Connection conn = null;

        conn = MySQLConntUtils.getMySQLConnection();
        String sql = "SELECT messagesID FROM messages WHERE OwnerMessage = ? ORDER BY messagesID DESC LIMIT 1";
        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setInt(1, UserID);

        ResultSet rs = ps.executeQuery();
        if (rs.next()) {

            int messagesID = rs.getInt("messagesID");

            return messagesID;
        }

        return 0;
    }

    public static void insertChat(Connection conn, Chat c) throws SQLException {
        String sql = "insert into Chat(MessagesID, ConversationID, UserID, FriendID ) values (?,?,?,?)";
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setInt(1, c.getMessage().getMessageID());
        pstm.setInt(2, c.getConversation().getConversationID());
        pstm.setInt(3, c.getUser().getUserID());
        //pstm.setInt(4, c.getFriend().getFriendID());
        pstm.executeUpdate();
    }

    public static void insertMessage(Connection conn, String MessagesContent, int ConvdID) throws SQLException {
        String sql = "insert into messages( MessagesContent, ConversationdetailID, Time) values (?,?,now())";
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setString(1, MessagesContent);
        pstm.setInt(2, ConvdID);
        
        pstm.executeUpdate();
    }

    //kết bạn
    public static UserAccount findUserF(Connection conn, int userID)
            throws SQLException {
        String sql = "Select * from users where UserID = ?";
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setInt(1, userID);
        ResultSet rs = pstm.executeQuery();
        if (rs.next()) {
            int UserID = rs.getInt("UserID");
            String FullName = rs.getString("FULLNAME");
            String Avt = rs.getString("Avt");
            String Anhbia = rs.getString("AnhBia");
            String Email = rs.getString("Email");
            UserAccount ua = new UserAccount();
            ua.setUserID(UserID);
            ua.setFullName(FullName);
            ua.setAvt(Avt);
            ua.setAnhbia(Anhbia);
            ua.setEmail(Email);

            return ua;
        }
        return null;
    }
    
    /*public static void insertFriend(Connection conn, UserAccount user, int userid) throws SQLException {
        String sql = "Insert into Friends(FullName, Username, Password, UserID) values (?,?,?,?)";
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setString(1, user.getFullName());
        pstm.setString(2, user.getUsername());
        pstm.setString(3, user.getPassword());
        pstm.setInt(4, userid);
        
        pstm.executeUpdate();
    }*/
    
}
