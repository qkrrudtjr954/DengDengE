package dto;

import java.io.Serializable;

/*-- 입양 후기 table
CREATE SEQUENCE AFTERBBS_SEQ START WITH 1 INCREMENT BY 1;
create table AFTERBBS(
    seq number(8) primary key,
    title varchar2(100),
    pic1 varchar2(200),
    content varchar2(4000),
    TARGET_USER_SEQ NUMBER(8),
    FOREIGN KEY (TARGET_USER_SEQ) REFERENCES denguser(seq),
    REG_DATE DATE,
    LAST_UPDATE DATE,
    DEL NUMBER(1)
);

*/
public class AfterBbsDto implements Serializable {
	
	private int seq;
	private String title;
	private String pic1;
	private String content;
	private int userSeq;
	private String Rdate;
	private String Ldate;
	private int del;
	private int readcond;
	
	
	
	
	
	public AfterBbsDto() {}
	
	
	





	public AfterBbsDto(String title, String content, int userSeq) {
		super();
		this.title = title;
		this.content = content;
		this.userSeq = userSeq;
	}








	public AfterBbsDto(int seq, String title, String pic1, String content, int userSeq, String rdate, String ldate,
			int del, int readcond) {
		super();
		this.seq = seq;
		this.title = title;
		this.pic1 = pic1;
		this.content = content;
		this.userSeq = userSeq;
		Rdate = rdate;
		Ldate = ldate;
		this.del = del;
		this.readcond = readcond;
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








	public int getUserSeq() {
		return userSeq;
	}








	public void setUserSeq(int userSeq) {
		this.userSeq = userSeq;
	}








	public String getRdate() {
		return Rdate;
	}








	public void setRdate(String rdate) {
		Rdate = rdate;
	}








	public String getLdate() {
		return Ldate;
	}








	public void setLdate(String ldate) {
		Ldate = ldate;
	}








	public int getDel() {
		return del;
	}








	public void setDel(int del) {
		this.del = del;
	}








	public int getReadcond() {
		return readcond;
	}








	public void setReadcond(int readcond) {
		this.readcond = readcond;
	}








	@Override
	public String toString() {
		return "AfterBbsDto [seq=" + seq + ", title=" + title + ", pic1=" + pic1 + ", content=" + content + ", userSeq="
				+ userSeq + ", Rdate=" + Rdate + ", Ldate=" + Ldate + ", del=" + del + ", readcond=" + readcond + "]";
	}
	
	
	








	
	
	
	
	
	


	


	
	
	

}
