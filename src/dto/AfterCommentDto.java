package dto;

import java.io.Serializable;

/*--입양 후기 댓글
CREATE SEQUENCE AFTERCOMMENT_SEQ START WITH 1 INCREMENT BY 1;
CREATE TABLE AFTERCOMMENT(
    SEQ NUMBER(8) PRIMARY KEY,
    TARGET_AFTER_SEQ NUMBER(8),
    FOREIGN KEY (TARGET_AFTER_SEQ) REFERENCES AFTERBBS(SEQ),
    CONTENT VARCHAR2(3000),
    TARGET_USER_SEQ NUMBER(8),
    FOREIGN KEY (TARGET_USER_SEQ) REFERENCES DENGUSER(SEQ),
    REG_DATE date,
    DEL NUMBER(1),
    STEP NUMBER(5),
    DEPTH NUMBER(5)
);

*/
public class AfterCommentDto implements Serializable {
	private int seq;
	private int targetAfterSeq;
	private String content;
	private int userSeq;
	private String Rdate;
	private String Ldate;
	private int step;
	private int depth;
	
	public AfterCommentDto() {}
	
	
	
	public AfterCommentDto(int seq, int targetAfterSeq, String content, int userSeq, String rdate, String ldate,
			int step, int depth) {
		super();
		this.seq = seq;
		this.targetAfterSeq = targetAfterSeq;
		this.content = content;
		this.userSeq = userSeq;
		Rdate = rdate;
		Ldate = ldate;
		this.step = step;
		this.depth = depth;
	}



	public int getSeq() {
		return seq;
	}



	public void setSeq(int seq) {
		this.seq = seq;
	}



	public int getTargetAfterSeq() {
		return targetAfterSeq;
	}



	public void setTargetAfterSeq(int targetAfterSeq) {
		this.targetAfterSeq = targetAfterSeq;
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



	public int getStep() {
		return step;
	}



	public void setStep(int step) {
		this.step = step;
	}



	public int getDepth() {
		return depth;
	}



	public void setDepth(int depth) {
		this.depth = depth;
	}



	@Override
	public String toString() {
		return "AfterCommentDto [seq=" + seq + ", targetAfterSeq=" + targetAfterSeq + ", content=" + content
				+ ", userSeq=" + userSeq + ", Rdate=" + Rdate + ", Ldate=" + Ldate + ", step=" + step + ", depth="
				+ depth + "]";
	}
	
	
	
	
	
	
	
	
	
	

}
