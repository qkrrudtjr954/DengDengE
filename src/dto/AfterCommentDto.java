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
	private int target_user_seq;
	private String content;
	
	private String reg_date;
	private String last_update;

	private int ref;
	private int step;
	private int depth;
	
	public AfterCommentDto() {}
	
	

	public AfterCommentDto(int target_user_seq, String content) {
		super();
		this.target_user_seq = target_user_seq;
		this.content = content;
	}



	public AfterCommentDto(int seq, int target_user_seq, String content, String reg_date, String last_update, int ref,
			int step, int depth) {
		super();
		this.seq = seq;
		this.target_user_seq = target_user_seq;
		this.content = content;
		this.reg_date = reg_date;
		this.last_update = last_update;
		this.ref = ref;
		this.step = step;
		this.depth = depth;
	}



	public int getSeq() {
		return seq;
	}



	public void setSeq(int seq) {
		this.seq = seq;
	}



	public int getTarget_user_seq() {
		return target_user_seq;
	}



	public void setTarget_user_seq(int target_user_seq) {
		this.target_user_seq = target_user_seq;
	}



	public String getContent() {
		return content;
	}



	public void setContent(String content) {
		this.content = content;
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



	public int getRef() {
		return ref;
	}



	public void setRef(int ref) {
		this.ref = ref;
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
		return "AfterCommentDto [seq=" + seq + ", target_user_seq=" + target_user_seq + ", content=" + content
				+ ", reg_date=" + reg_date + ", last_update=" + last_update + ", ref=" + ref + ", step=" + step
				+ ", depth=" + depth + "]";
	}

	
	
	
	
	
}
