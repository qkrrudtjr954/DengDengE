package dto;

import java.io.Serializable;

public class BookDto implements Serializable {
	private int seq;
	private int User_seq;
	private String User_email;
	private String content;
	
	
	
	public BookDto() {}



	public BookDto(int seq, int user_seq, String user_email, String content) {
		super();
		this.seq = seq;
		User_seq = user_seq;
		User_email = user_email;
		this.content = content;
	}



	public int getSeq() {
		return seq;
	}



	public void setSeq(int seq) {
		this.seq = seq;
	}



	public int getUser_seq() {
		return User_seq;
	}



	public void setUser_seq(int user_seq) {
		User_seq = user_seq;
	}



	public String getUser_email() {
		return User_email;
	}



	public void setUser_email(String user_email) {
		User_email = user_email;
	}



	public String getContent() {
		return content;
	}



	public void setContent(String content) {
		this.content = content;
	}



	@Override
	public String toString() {
		return "BookDto [seq=" + seq + ", User_seq=" + User_seq + ", User_email=" + User_email + ", content=" + content
				+ "]";
	}
	
	

}
