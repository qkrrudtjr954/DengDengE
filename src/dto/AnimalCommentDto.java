package dto;

import java.io.Serializable;

public class AnimalCommentDto implements Serializable{
	/*-분양글 댓글
	CREATE SEQUENCE ANIMALCOMMENT_SEQ START WITH 1 INCREMENT BY 1;
	CREATE TABLE ANIMALCOMMENT(
	    SEQ NUMBER(8) PRIMARY KEY,
	    TARGET_ANIMAL_SEQ NUMBER(8),
	    FOREIGN KEY (TARGET_ANIMAL_SEQ) REFERENCES ANIMALBBS(seq),
	    CONTENT VARCHAR2(3000),
	    TARGET_USER_SEQ NUMBER(8),
	    FOREIGN KEY (TARGET_USER_SEQ) REFERENCES DENGUSER(SEQ),
	    REG_DATE date,
	    DEL NUMBER(1),
	    STEP NUMBER(5),
	    DEPTH NUMBER(5)
	);*/
}
