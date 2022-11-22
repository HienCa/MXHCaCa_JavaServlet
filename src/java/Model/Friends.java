/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 *
 * @author PC
 */
public class Friends {

    private int FriendID;
    private String FullName;
    private String Username;
    private String Email;
    private String password;
    private String NgaySinh;
    private String GioiTinh;
    private String Avt;
    private String Anhbia;
    private String HomeTown;
    private String School;
    private String Relationship;
    private String Hobbies;
    private String Active;
    private int UserID;
    public Friends() {
    }

    public Friends(int FriendID, String FullName, String Username, String Email, String password, String NgaySinh, String GioiTinh, String Avt, String Anhbia, String HomeTown, String School, String Relationship, String Hobbies, String Active, int UserID) {
        this.FriendID = FriendID;
        this.FullName = FullName;
        this.Username = Username;
        this.Email = Email;
        this.password = password;
        this.NgaySinh = NgaySinh;
        this.GioiTinh = GioiTinh;
        this.Avt = Avt;
        this.Anhbia = Anhbia;
        this.HomeTown = HomeTown;
        this.School = School;
        this.Relationship = Relationship;
        this.Hobbies = Hobbies;
        this.Active = Active;
        this.UserID = UserID;
    }

    public Friends(String FullName, String Username, String Email, String password, String NgaySinh, String GioiTinh, String Avt, String Anhbia, String HomeTown, String School, String Relationship, String Hobbies, String Active, int UserID) {
        this.FullName = FullName;
        this.Username = Username;
        this.Email = Email;
        this.password = password;
        this.NgaySinh = NgaySinh;
        this.GioiTinh = GioiTinh;
        this.Avt = Avt;
        this.Anhbia = Anhbia;
        this.HomeTown = HomeTown;
        this.School = School;
        this.Relationship = Relationship;
        this.Hobbies = Hobbies;
        this.Active = Active;
        this.UserID = UserID;
    }

    
    public Friends(int FriendID, String FullName, String Username, String Email, String password, String NgaySinh, String GioiTinh, String Avt, String Anhbia, String HomeTown, String School, String Relationship, String Hobbies, String Active) {
        this.FriendID = FriendID;
        this.FullName = FullName;
        this.Username = Username;
        this.Email = Email;
        this.password = password;
        this.NgaySinh = NgaySinh;
        this.GioiTinh = GioiTinh;
        this.Avt = Avt;
        this.Anhbia = Anhbia;
        this.HomeTown = HomeTown;
        this.School = School;
        this.Relationship = Relationship;
        this.Hobbies = Hobbies;
        this.Active = Active;
    }

    public int getFriendID() {
        return FriendID;
    }

    public void setFriendID(int FriendID) {
        this.FriendID = FriendID;
    }

    

    public String getFullName() {
        return FullName;
    }

    public void setFullName(String FullName) {
        this.FullName = FullName;
    }

    public String getUsername() {
        return Username;
    }

    public void setUsername(String Username) {
        this.Username = Username;
    }

    public String getEmail() {
        return Email;
    }

    public void setEmail(String Email) {
        this.Email = Email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getNgaySinh() {
        return NgaySinh;
    }

    public void setNgaySinh(String NgaySinh) {
        this.NgaySinh = NgaySinh;
    }

    public String getGioiTinh() {
        return GioiTinh;
    }

    public void setGioiTinh(String GioiTinh) {
        this.GioiTinh = GioiTinh;
    }

    public String getAvt() {
        return Avt;
    }

    public void setAvt(String Avt) {
        this.Avt = Avt;
    }

    public String getAnhbia() {
        return Anhbia;
    }

    public void setAnhbia(String Anhbia) {
        this.Anhbia = Anhbia;
    }

    public String getHomeTown() {
        return HomeTown;
    }

    public void setHomeTown(String HomeTown) {
        this.HomeTown = HomeTown;
    }

    public String getSchool() {
        return School;
    }

    public void setSchool(String School) {
        this.School = School;
    }

    public String getRelationship() {
        return Relationship;
    }

    public void setRelationship(String Relationship) {
        this.Relationship = Relationship;
    }

    public String getHobbies() {
        return Hobbies;
    }

    public void setHobbies(String Hobbies) {
        this.Hobbies = Hobbies;
    }

    public String getActive() {
        return Active;
    }

    public void setActive(String Active) {
        this.Active = Active;
    }

    public int getUserID() {
        return UserID;
    }

    public void setUserID(int UserID) {
        this.UserID = UserID;
    }
    
    
}
