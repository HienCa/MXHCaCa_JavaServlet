package Model;


public class Status extends UserAccount{
	private int StatusID;
	private String StatusCaption;
	private String StatusImages;
	private int Likes;
	
	
	public Status() {
		
	}
	
	public Status(int statusID, String statusCaption, String statusImages, int likes) {
		
		StatusID = statusID;
		StatusCaption = statusCaption;
		StatusImages = statusImages;
		Likes = likes;
		
	}
	public Status(int statusID, String statusCaption, String statusImages, int likes, String FullName) {
		setFullName(FullName);
		StatusID = statusID;
		StatusCaption = statusCaption;
		StatusImages = statusImages;
		Likes = likes;
		
	}
	public Status(String statusCaption, String statusImages) {
		
		StatusCaption = statusCaption;
		StatusImages = statusImages;
	}

	public int getStatusID() {
		return StatusID;
	}

	public void setStatusID(int statusID) {
		StatusID = statusID;
	}

	public String getStatusCaption() {
		return StatusCaption;
	}

	public void setStatusCaption(String statusCaption) {
		StatusCaption = statusCaption;
	}

	public String getStatusImages() {
		return StatusImages;
	}

	public void setStatusImages(String statusImages) {
		StatusImages = statusImages;
	}

	public int getLikes() {
		return Likes;
	}

	public void setLikes(int likes) {
		Likes = likes;
	}

	
	
}
