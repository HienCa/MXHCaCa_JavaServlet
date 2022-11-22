package Model;

public class upload extends Status{
	private int UserID;
	private String like;
	public String getLike() {
		return like;
	}
	public void setLike(String like) {
		this.like = like;
	}

	private String DateTimeUpload;
	
	
	public upload() {
		
	}
	public upload(int userID, int statusID, String datetimeUpload) {
		
		UserID = userID;
		getStatusID();
		DateTimeUpload = datetimeUpload;
		
	}
	public upload(int userID, int statusID, String StatusCaption, String StatusImages, int Likes, String datetimeUpload) {
		super(statusID,StatusCaption,StatusImages,Likes);
		UserID = userID;
		
		DateTimeUpload = datetimeUpload;
		
	}
	public upload(int userID, int statusID, String StatusCaption, String StatusImages, int Likes, String datetimeUpload,String FullName) {
		super(statusID,StatusCaption,StatusImages,Likes, FullName);
		UserID = userID;
		
		DateTimeUpload = datetimeUpload;
		
	}
	public upload(int userID, int statusID) {
		
		UserID = userID;
		getStatusID();
	}

	public int getUserID() {
		return UserID;
	}

	public void setUserID(int userID) {
		UserID = userID;
	}

	

	public String getDateTimeUpload() {
		return DateTimeUpload;
	}

	public void setDateTimeUpload(String datetimeUpload) {
		DateTimeUpload = datetimeUpload;
	}

	
	
}
