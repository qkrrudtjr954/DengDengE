package dto;

import java.io.Serializable;

public class BookDto implements Serializable{
	private  int seq;	// 예약리스트 시퀀스
	private int user_seq;		// 예약자 시퀀스
	private String user_email;	// 예약자 이메일
	private String content;	// 예약자 기타사항
	private int list_seq;	// 예약한 해당글 시퀀스
	private String complete_email;	// 해당글 작성자(예약확정)
	private int del;
	
	public BookDto() {
		// TODO Auto-generated constructor stub
	}

	public BookDto(int seq, int user_seq, String user_email, String content, int list_seq) {
		super();
		this.seq = seq;
		this.user_seq = user_seq;
		this.user_email = user_email;
		this.content = content;
		this.list_seq = list_seq;

	}
	
	public BookDto(int seq, int user_seq, String user_email, String content, int list_seq, String complete_email) {
		super();
		this.seq = seq;
		this.user_seq = user_seq;
		this.user_email = user_email;
		this.content = content;
		this.list_seq = list_seq;
		this.complete_email = complete_email;
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

	public int getList_seq() {
		return list_seq;
	}

	public void setList_seq(int list_seq) {
		this.list_seq = list_seq;
	}

	public String getComplete_email() {
		return complete_email;
	}

	public void setComplete_email(String complete_email) {
		this.complete_email = complete_email;
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
				+ ", list_seq=" + list_seq + ", complete_email=" + complete_email + ", del=" + del + "]";
	}

	

	

	
}
