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
	
	
	
	
	
	public AfterBbsDto() {}
	
	


	


	
	
	

}
