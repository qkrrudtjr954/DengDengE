package dto;

import java.io.Serializable;

public class CommuBbsDto implements Serializable {

/*	CREATE TABLE COMMUBBS(
		    SEQ NUMBER(8) PRIMARY KEY,
		    TITLE VARCHAR2(100),
		    PIC1 VARCHAR2(200),
		    CONTENT VARCHAR2(4000),
		    TARGET_USER_SEQ NUMBER(8),
		    FOREIGN KEY (TARGET_USER_SEQ) REFERENCES denguser(seq),
		    TARGET_CATEGORY NUMBER(8),
		    FOREIGN KEY (TARGET_CATEGORY) REFERENCES CATEGORY(SEQ),
		    REG_DATE DATE,
		    LAST_UPDATE DATE,
		    DEL NUMBER(1)
		);*/
	
	private int seq;
	private String title;
	private String pic1;
	private String content;
	private int target_user_seq;	//글쓴이 아이디 시퀀스
	private String reg_date;		//등록 날짜 
	private String last_update;		//수정 날짜 
	private int del;

	public CommuBbsDto() {
		// TODO Auto-generated constructor stub
	}

	public CommuBbsDto(int seq, String title, String pic1, String content, int target_user_seq, String reg_date,
			String last_update, int del) {
		super();
		this.seq = seq;
		this.title = title;
		this.pic1 = pic1;
		this.content = content;
		this.target_user_seq = target_user_seq;
		this.reg_date = reg_date;
		this.last_update = last_update;
		this.del = del;
	}

	public int getSeq() {
		return seq;
	}

	public void setSeq(int seq) {
		this.seq = seq;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getPic1() {
		return pic1;
	}

	public void setPic1(String pic1) {
		this.pic1 = pic1;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public int getTarget_user_seq() {
		return target_user_seq;
	}

	public void setTarget_user_seq(int target_user_seq) {
		this.target_user_seq = target_user_seq;
	}

	public String getReg_date() {
		return reg_date;
	}

	public void setReg_date(String reg_date) {
		this.reg_date = reg_date;
	}

	public String getLast_update() {
		return last_update;
	}

	public void setLast_update(String last_update) {
		this.last_update = last_update;
	}

	public int getDel() {
		return del;
	}

	public void setDel(int del) {
		this.del = del;
	}

	@Override
	public String toString() {
		return "CommuBbsDto [seq=" + seq + ", title=" + title + ", pic1=" + pic1 + ", content=" + content
				+ ", target_user_seq=" + target_user_seq + ", reg_date=" + reg_date + ", last_update=" + last_update
				+ ", del=" + del + "]";
	}
	
	
}
