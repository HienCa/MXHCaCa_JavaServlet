package Model;

public class UserAccount {
	private int UserID;
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
	public UserAccount() {
		
	}
	public UserAccount(int userID, String fullName, String username, String email, String password, String ngaySinh,
			String gioiTinh,String Avt, String Anhbia, String homeTown, String school, String relationship, String hobbies, String active) {
		
		UserID = userID;
		FullName = fullName;
		Email = email;
		Username = username;
		this.password = password;
		NgaySinh = ngaySinh;
		GioiTinh = gioiTinh;
		this.Avt = Avt;
		this.Anhbia = Anhbia;
		HomeTown = homeTown;
		School = school;
		Relationship = relationship;
		Hobbies = hobbies;
		Active = active;
	}
	public UserAccount(String Username, String Password)
	{
		this.Username = Username;
		this.password = Password;
	}
	public UserAccount(String Username)
	{
		this.Username = Username;
		
	}
	public UserAccount(String fullName, String Username, String password, String ngaySinh, String gioiTinh) {
		
		FullName = fullName;
		this.Username = Username;
		this.password = password;
		NgaySinh = ngaySinh;
		GioiTinh = gioiTinh;
	}
	public int getUserID() {
		return UserID;
	}
	public void setUserID(int userID) {
		UserID = userID;
	}
	public String getFullName() {
		return FullName;
	}
	public void setFullName(String fullName) {
		FullName = fullName;
	}
	public String getEmail() {
		return Email;
	}
	public void setEmail(String email) {
		Email = email;
	}
	public String getUsername() {
		return Username;
	}
	public void setUsername(String Username) {
		this.Username = Username;
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
	public void setNgaySinh(String ngaySinh) {
		NgaySinh = ngaySinh;
	}
	public String getGioiTinh() {
		return GioiTinh;
	}
	public void setGioiTinh(String gioiTinh) {
		GioiTinh = gioiTinh;
	}
	
	public String getAvt() {
		return Avt;
	}
	public void setAvt(String avt) {
		Avt = avt;
	}
	public String getAnhbia() {
		return Anhbia;
	}
	public void setAnhbia(String anhbia) {
		Anhbia = anhbia;
	}
	public String getHomeTown() {
		return HomeTown;
	}
	public void setHomeTown(String homeTown) {
		HomeTown = homeTown;
	}
	public String getSchool() {
		return School;
	}
	public void setSchool(String school) {
		School = school;
	}
	public String getRelationship() {
		return Relationship;
	}
	public void setRelationship(String relationship) {
		Relationship = relationship;
	}
	public String getHobbies() {
		return Hobbies;
	}
	public void setHobbies(String hobbies) {
		Hobbies = hobbies;
	}
	public String getActive() {
		return Active;
	}
	public void setActive(String active) {
		Active = active;
	}
	
}
