package dto;

import java.io.Serializable;

public class BookDto implements Serializable{
	private  int seq;
	private int user_seq;
	private String user_email;
	private String content;
	private int del;
	
	public BookDto() {
		// TODO Auto-generated constructor stub
	}
	
	public BookDto(int seq, int user_seq, String user_email, String content) {
		super();
		this.seq = seq;
		this.user_seq = user_seq;
		this.user_email = user_email;
		this.content = content;
	}

	public int getSeq() {
		return seq;
	}

	public void setSeq(int seq) {
		this.seq = seq;
	}

	public int getUser_seq() {
		return user_seq;
	}

	public void setUser_seq(int user_seq) {
		this.user_seq = user_seq;
	}

	public String getUser_email() {
		return user_email;
	}

	public void setUser_email(String user_email) {
		this.user_email = user_email;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public int getDel() {
		return del;
	}

	public void setDel(int del) {
		this.del = del;
	}

	@Override
	public String toString() {
		return "BookDto [seq=" + seq + ", user_seq=" + user_seq + ", user_email=" + user_email + ", content=" + content
				+ ", del=" + del + "]";
	}

	
	
	
	
	
}
