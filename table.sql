drop table denguser cascade constraints;
drop table animalbbs cascade constraints;
drop table animalcomment cascade constraints;
drop table afterbbs cascade constraints;
drop table aftercomment cascade constraints;
drop table commubbs cascade constraints;
drop table commucomment cascade constraints;
drop table cal cascade constraints;
drop table category cascade constraints;

-- user table
create SEQUENCE denguser_seq start with 1 increment by 1;
create table denguser(
    seq number(8) primary key,
    email varchar2(50) unique not null,
    password varchar2(50) not null,
    reg_date date not null,
    last_update date not null,
    auth number(1) not null
);

-- 분양글 table
create SEQUENCE animalbbs_seq start with 1 increment by 1;
create table animalbbs(
    seq number(8) primary key,
    title varchar2(100),
    name varchar2(50),
    age number(2),
    kinds varchar2(100),
    location varchar2(200),
    medicine number(1),
    neutralization number(1),
    gender number(1),
    descripttion varchar2(3000),
    pic1 varchar2(200),
    content varchar2(4000),
    TARGET_USER_SEQ NUMBER(8),
    TARGET_CONTACT varchar2(20),
    TARGET_DESCRIPTION	varchar2(3000),
    REG_DATE DATE,
    LAST_UPDATE DATE,
    DEL NUMBER(1),
    FOREIGN KEY (TARGET_USER_SEQ) REFERENCES denguser(seq)
);

--분양글 댓글
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
);




-- 입양 후기 table
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

--입양 후기 댓글
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



-- 커뮤니티 카테고리
CREATE SEQUENCE CATEGORY_SEQ START WITH 1 INCREMENT BY 1;
CREATE TABLE CATEGORY(
    SEQ NUMBER(8) PRIMARY KEY,
    TITLE VARCHAR2(100),
    DESCRIPTION VARCHAR2(1000),
    REG_DATE DATE
);

-- 커뮤니티 table
DROP TABLE COMMUBBS
CASCADE CONSTRAINT;

DROP SEQUENCE COMMUBBS_SEQ;

CREATE SEQUENCE COMMUBBS_SEQ START WITH 1 INCREMENT BY 1;
CREATE TABLE COMMUBBS(
    SEQ NUMBER(8) PRIMARY KEY,
    TITLE VARCHAR2(100),
    PIC1 VARCHAR2(200),
    CONTENT VARCHAR2(4000),
    TARGET_USER_SEQ NUMBER(8),
    FOREIGN KEY (TARGET_USER_SEQ) REFERENCES denguser(seq),
    TARGET_CATEGORY NUMBER(8),
    FOREIGN KEY (TARGET_CATEGORY) REFERENCES CATEGORY(SEQ),
    READCOUNT NUMBER(8),
    REG_DATE DATE,
    LAST_UPDATE DATE,
    DEL NUMBER(1)
);

--커뮤니티 댓글
CREATE SEQUENCE COMMUCOMMENT_SEQ START WITH 1 INCREMENT BY 1;
CREATE TABLE COMMUCOMMENT(
    SEQ NUMBER(8) PRIMARY KEY,
    TARGET_COMMU_SEQ NUMBER(8),
    FOREIGN KEY (TARGET_COMMU_SEQ) REFERENCES COMMUBBS(SEQ),
    CONTENT VARCHAR2(3000),
    TARGET_USER_SEQ NUMBER(8),
    FOREIGN KEY (TARGET_USER_SEQ) REFERENCES denguser(seq),
    REG_DATE date,
    DEL NUMBER(1),
    STEP NUMBER(5),
    DEPTH NUMBER(5)
);


-- 캘린더
CREATE SEQUENCE CAL_SEQ START WITH 1 INCREMENT BY 1;
CREATE TABLE CAL(
    SEQ NUMBER(8) PRIMARY KEY,
    CONTENT VARCHAR2(4000),
    REG_DATE DATE,
    LAST_UPDATE DATE,
    DEL NUMBER(1),
    RESERVE_DATE VARCHAR2(12)
);


------------------------
INSERT INTO COMMUBBS(SEQ, TITLE, PIC1, CONTENT, TARGET_USER_SEQ, TARGET_CATEGORY, READCOUNT, REG_DATE, LAST_UPDATE, DEL )
VALUES(COMMUBBS_SEQ.NEXTVAL, ?, ?, ?, ?, ?, 0, SYSDATE, SYSDATE, 0);

INSERT INTO COMMUBBS(SEQ, TITLE, PIC1, CONTENT, TARGET_USER_SEQ, TARGET_CATEGORY, READCOUNT, REG_DATE, LAST_UPDATE, DEL )
VALUES(COMMUBBS_SEQ.NEXTVAL, '제목', '이미지주소', '내용', 1, 1, 0, SYSDATE, SYSDATE, 0);


INSERT INTO BBS(SEQ, ID, REF, STEP, DEPTH, TITLE, CONTENT, WDATE, PARENT, DEL, READCOUNT)  
VALUES(SEQ_BBS.NEXTVAL, ?, (SELECT NVL(MAX(REF), 0)+1 FROM BBS), 0, 0, ?, ?, SYSDATE, 0, 0, 0);


SELECT*FROM COMMUBBS;

SELECT*FROM CATEGORY;
INSERT INTO CATEGORY(SEQ, TITLE, DESCRIPTION, REG_DATE)
VALUES(CATEGORY_SEQ.NEXTVAL, '애견TIP', '애견팁이당', SYSDATE);

INSERT INTO CATEGORY(SEQ, TITLE, DESCRIPTION, REG_DATE)
VALUES(CATEGORY_SEQ.NEXTVAL, '중고장터', '중고장터닷', SYSDATE);

INSERT INTO CATEGORY(SEQ, TITLE, DESCRIPTION, REG_DATE)
VALUES(CATEGORY_SEQ.NEXTVAL, '자유게시판', '자유게시판이당', SYSDATE);


--------------유 저------------------

create table denguser(
    seq number(8) primary key,
    email varchar2(50) unique not null,
    password varchar2(50) not null,
    reg_date date not null,
    last_update date not null,
    auth number(1) not null
);
SELECT*FROM denguser;

INSERT INTO denguser(SEQ, EMAIL, PASSWORD, REG_DATE, LAST_UPDATE, AUTH)
VALUES(denguser_seq.NEXTVAL, 'aa', 'aa', SYSDATE, SYSDATE, 0);


--02/23-------
select*from CATEGORY;
select*from COMMUBBS;
select*from denguser;

SELECT a.seq, a.TITLE as title, target_user_seq, READCOUNT, a.reg_date, a.last_update as last_update, a.del, b.title as category_name, c.email as user_email   
FROM COMMUBBS A, CATEGORY B,  DENGUSER c 
WHERE A.TARGET_CATEGORY = B.TARGET_CATEGORY AND a.target_user_seq = c.seq AND a.DEL=0 
ORDER BY a.reg_date DESC ;

 SELECT a.seq, a.TITLE as title, a.target_user_seq, a.target_category,  readcount, a.last_update as last_update, del, b.title as category_name, c.email as user_email  FROM COMMUBBS A, CATEGORY B, DENGUSER c  WHERE A.TARGET_CATEGORY = B.TARGET_CATEGORY AND a.target_user_seq = c.seq AND A.SEQ=1
SELECT a.seq, a.TITLE as title, a.target_user_seq, a.target_category,  readcount, a.last_update as last_update, del, b.title as category_name, c.email as user_email  FROM COMMUBBS A, CATEGORY B, DENGUSER c  WHERE A.TARGET_CATEGORY = B.TARGET_CATEGORY AND a.target_user_seq = c.seq AND A.SEQ=1
select target_category, a.title, target_user_seq,reg_date, del, b.title 
from COMMUBBS a, category b
where a.target_category = b.seq;

" SELECT a.seq, a.TITLE as title, target_user_seq, readcount, a.reg_date, a.last_update as last_update, del, b.title as category_name, A.READCOUNT, c.email as user_email  "
				+ " FROM COMMUBBS A, CATEGORY B, DENGUSER c " 
				+ " WHERE A.TARGET_CATEGORY = B.TARGET_CATEGORY AND a.target_user_seq = c.seq AND DEL=0 "
				+ " AND " + Searchtype + " LIKE '%" + SearchWord + "%'" + " ORDER BY a.REG_DATE DESC ";

SELECT a.TITLE, b.title as category, target_user_seq, del, a.reg_date
FROM COMMUBBS A, CATEGORY B
WHERE A.TARGET_CATEGORY = B.TARGET_CATEGORY
ORDER BY REG_DATE DESC;

SELECT a.seq, a.TITLE as title, target_user_seq, readcount, a.reg_date, a.last_update as last_update, del, b.title as category_name, A.READCOUNT, c.email as user_email   FROM COMMUBBS A, CATEGORY B, DENGUSER c  WHERE A.TARGET_CATEGORY = B.TARGET_CATEGORY AND a.target_user_seq = c.seq AND DEL=0  AND email LIKE '%eunmin%' ORDER BY a.REG_DATE DESC 

DROP TABLE denguser
CASCADE CONSTRAINT;

DROP TABLE category
CASCADE CONSTRAINT;

DROP TABLE commubbs
CASCADE CONSTRAINT;

DROP SEQUENCE category_seq;
DROP SEQUENCE commubbs_seq;

DROP TABLE COMMUBBS
CASCADE CONSTRAINT;

DROP SEQUENCE COMMUBBS_SEQ;


CREATE SEQUENCE CATEGORY_SEQ START WITH 1 INCREMENT BY 1;
CREATE TABLE CATEGORY(
    SEQ NUMBER(8) PRIMARY KEY,
    TARGET_CATEGORY NUMBER(8), 
    TITLE VARCHAR2(100),
    DESCRIPTION VARCHAR2(1000),
    REG_DATE DATE
);


INSERT INTO CATEGORY(SEQ, TARGET_CATEGORY, TITLE, DESCRIPTION, REG_DATE)
VALUES(CATEGORY_SEQ.NEXTVAL,1, '애견TIP', '애견팁이당', SYSDATE);

INSERT INTO CATEGORY(SEQ, TARGET_CATEGORY, TITLE, DESCRIPTION, REG_DATE)
VALUES(CATEGORY_SEQ.NEXTVAL,2, '중고장터', '중고장터닷', SYSDATE);

INSERT INTO CATEGORY(SEQ, TARGET_CATEGORY, TITLE, DESCRIPTION, REG_DATE)
VALUES(CATEGORY_SEQ.NEXTVAL,3, '자유게시판', '자유게시판이당', SYSDATE);

CREATE SEQUENCE COMMUBBS_SEQ START WITH 1 INCREMENT BY 1;
CREATE TABLE COMMUBBS(
    SEQ NUMBER(8) PRIMARY KEY,
    TITLE VARCHAR2(100),
    PIC1 VARCHAR2(200),
    CONTENT LONG,
    TARGET_USER_SEQ NUMBER(8),
    FOREIGN KEY (TARGET_USER_SEQ) REFERENCES denguser(seq),
    TARGET_CATEGORY NUMBER(8),
    FOREIGN KEY (TARGET_CATEGORY) REFERENCES CATEGORY(SEQ),
    READCOUNT NUMBER(8),
    REG_DATE DATE,
    LAST_UPDATE DATE,
    DEL NUMBER(1)
);


INSERT INTO COMMUBBS(SEQ, TITLE, PIC1, CONTENT, TARGET_USER_SEQ, TARGET_CATEGORY, READCOUNT, REG_DATE, LAST_UPDATE, DEL )
VALUES(COMMUBBS_SEQ.NEXTVAL, '제목', '이미지주소', '내용', 1, 1, 0, SYSDATE, SYSDATE, 0);


DROP TABLE AFTERBBS
CASCADE CONSTRAINT;

DROP SEQUENCE AFTERBBS_SEQ;

CREATE SEQUENCE AFTERBBS_SEQ START WITH 1 INCREMENT BY 1;
create table AFTERBBS(
    seq number(8) primary key,
    title varchar2(100),
    pic1 varchar2(200),
    content long,
    TARGET_USER_SEQ NUMBER(8),
    FOREIGN KEY (TARGET_USER_SEQ) REFERENCES denguser(seq),
    REG_DATE DATE,
    LAST_UPDATE DATE,
    READCOUNT NUMBER(8),
    DEL NUMBER(1)
);

select*from denguser;

select*from COMMUBBS;

SELECT a.seq, a.TITLE as title, content, target_user_seq, a.target_category,  readcount, a.reg_date as reg_date, del, b.title as category_name, c.email as user_email  FROM COMMUBBS A, CATEGORY B, DENGUSER c  WHERE A.TARGET_CATEGORY = B.TARGET_CATEGORY AND a.target_user_seq = c.seq AND A.SEQ=2;




SELECT a.seq, a.TITLE as title, content, target_user_seq, a.target_category,  readcount, a.reg_date as reg_date, del, b.title as category_name, c.email as user_email   FROM COMMUBBS A, CATEGORY B, denguser c WHERE A.TARGET_CATEGORY = B.TARGET_CATEGORY AND  a.target_user_seq = c.seq and  A.SEQ=1;


	SELECT*FROM DENGUSER;

	DROP TABLE COMMUBBS
	CASCADE CONSTRAINT;

	DROP SEQUENCE COMMUBBS_SEQ;

	CREATE SEQUENCE COMMUBBS_SEQ START WITH 1 INCREMENT BY 1;
	CREATE TABLE COMMUBBS(
	    SEQ NUMBER(8) PRIMARY KEY,
	    TITLE VARCHAR2(100),
	    PIC1 VARCHAR2(200),
	    CONTENT LONG,
	    TARGET_USER_SEQ NUMBER(8),
	    FOREIGN KEY (TARGET_USER_SEQ) REFERENCES DENGUSER(SEQ),
	    TARGET_CATEGORY NUMBER(8),
	    FOREIGN KEY (TARGET_CATEGORY) REFERENCES CATEGORY(SEQ),
	    READCOUNT NUMBER(8),
	    REG_DATE DATE,
	    LAST_UPDATE DATE,
	    DEL NUMBER(1)
	);
	
	
	DROP TABLE LIKETABLE 
	CASCADE CONSTRAINT;
	
	DROP SEQUENCE LIKE_SEQ;

	
	CREATE SEQUENCE LIKE_SEQ START WITH 1 INCREMENT BY 1;
	CREATE TABLE LIKETABLE(
	SEQ NUMBER(8) PRIMARY KEY,   
	BBS_CATEGORY NUMBER(8),
	TARGET_USER_SEQ NUMBER(8),
	FOREIGN KEY (TARGET_USER_SEQ) REFERENCES denguser(seq),
	TARGET_BBS_SEQ NUMBER(8)
	);
	
	
	select*from denguser;
	select*from commubbs;
	
	INSERT INTO COMMUBBS(SEQ, TITLE, PIC1, CONTENT, TARGET_USER_SEQ,  TARGET_CATEGORY, READCOUNT, REG_DATE, LAST_UPDATE, LIKE_COUNT, DEL ) 
	VALUES(COMMUBBS_SEQ.NEXTVAL, 'ㅇㅇㅇ', '', '<p>ㅇㅇㅇㅇ</p>', 1, 1, 0, SYSDATE, SYSDATE, 0, 0);
	
	
	INSERT INTO LIKETABLE (SEQ, TARGET_USER_SEQ, TARGET_BBS_SEQ)  
	VALUES(LIKE_SEQ.NEXTVAL, 2, 8); 
	
	select*from liketable;
	
	
drop table animalbbs
	CASCADE CONSTRAINT;
	DROP SEQUENCE animalbbs_seq;
	
create SEQUENCE animalbbs_seq start with 1 increment by 1;
create table animalbbs(
    seq number(8) primary key,
    title varchar2(100),
    name varchar2(50),
    age number(2),
    kinds varchar2(100),
    type varchar2(100),
    location varchar2(200),
    medicine number(1),
    neutralization number(1),
    gender number(1),
    descripttion varchar2(3000),
    pic1 varchar2(200),
    content long,
    TARGET_USER_SEQ NUMBER(8),
    TARGET_CONTACT varchar2(20),
    TARGET_DESCRIPTION   varchar2(3000),
    REG_DATE DATE,
    LAST_UPDATE DATE,
    DEL NUMBER(1),
    READCOUNT NUMBER(8),
    TARGET_COMPLETE_EMAIL VARCHAR2(100),
    FOREIGN KEY (TARGET_USER_SEQ) REFERENCES denguser(seq)
);
	UPDATE  COMMUBBS  SET LIKE_COUNT=LIKE_COUNT+1, del = 1 
	WHERE SEQ=?
	
	
	select count(*) as likecount from liketable where target_bbs_seq = 12;
	commit;
	
	DROP TABLE AFTERBBS 
	CASCADE CONSTRAINT;
	
	DROP SEQUENCE AFTERBBS_SEQ;
	
	
CREATE SEQUENCE AFTERBBS_SEQ START WITH 1 INCREMENT BY 1;
create table AFTERBBS(
    seq number(8) primary key,
    title varchar2(100),
    pic1 varchar2(500),
    content long,
    TARGET_USER_SEQ NUMBER(8),
    FOREIGN KEY (TARGET_USER_SEQ) REFERENCES denguser(seq),
    REG_DATE DATE,
    LAST_UPDATE DATE,
    READCOUNT NUMBER(8),
    DEL NUMBER(1)


);

-- 분양글 table
	DROP TABLE animalbbs 
	CASCADE CONSTRAINT;
	
	DROP SEQUENCE animalbbs_seq;
	
create SEQUENCE animalbbs_seq start with 1 increment by 1;
create table animalbbs(
    seq number(8) primary key,
    title varchar2(100),
    name varchar2(50),
    age number(2),
    kinds varchar2(100),
    type varchar2(100),
    location varchar2(200),
    medicine number(1),
    neutralization number(1),
    gender number(1),
    descripttion varchar2(3000),
    pic1 varchar2(200),
    content long,
    TARGET_USER_SEQ NUMBER(8),
    TARGET_CONTACT varchar2(20),
    TARGET_DESCRIPTION   varchar2(3000),
    REG_DATE DATE,
    LAST_UPDATE DATE,
    DEL NUMBER(1),
    READCOUNT NUMBER(8),
    FOREIGN KEY (TARGET_USER_SEQ) REFERENCES denguser(seq)
);





create SEQUENCE BOOK_SEQ start with 1 increment by 1;
create table BOOK(
    SEQ NUMBER(8) primary key,
    TARGET_USER_SEQ NUMBER(8),
    TARGET_USER_EMAIL VARCHAR2(100),
    CONTENT LONG,
    TARGET_LIST_SEQ NUMBER(8),
    TARGET_COMPLETE_EMAIL VARCHAR2(100),
    DEL NUMBER(30),
    FOREIGN KEY (TARGET_USER_SEQ) REFERENCES denguser(SEQ)
);



SELECT a.seq, a.TITLE as title, target_user_seq, READCOUNT, a.reg_date as reg_date, a.last_update as last_update, a.del, b.title as category_name, c.email as user_email   
FROM COMMUBBS A, CATEGORY B,  DENGUSER c 
WHERE A.TARGET_CATEGORY = B.seq AND a.target_user_seq = c.seq AND a.DEL=0 ORDER BY a.REG_DATE DESC 


alter table category drop column status;
alter table category add  status number(3);

select * from category;

update category set status=200;


INSERT INTO CATEGORY(SEQ, TARGET_CATEGORY, TITLE, DESCRIPTION, REG_DATE, status)
VALUES(CATEGORY_SEQ.NEXTVAL,1, '애견TIP', '애견팁이당', SYSDATE, 200);

INSERT INTO CATEGORY(SEQ, TARGET_CATEGORY, TITLE, DESCRIPTION, REG_DATE, status)
VALUES(CATEGORY_SEQ.NEXTVAL,2, '중고장터', '중고장터닷', SYSDATE, 200);

INSERT INTO CATEGORY(SEQ, TARGET_CATEGORY, TITLE, DESCRIPTION, REG_DATE, status)
VALUES(CATEGORY_SEQ.NEXTVAL,3, '자유게시판', '자유게시판이당', SYSDATE, 200);


drop table AFTERCOMMENT
cascade constraint;
drop sequence AFTERCOMMENT_SEQ

--입양 후기 댓글
CREATE SEQUENCE AFTERCOMMENT_SEQ START WITH 1 INCREMENT BY 1;
CREATE TABLE AFTERCOMMENT(
    SEQ NUMBER(8) PRIMARY KEY,
    TARGET_AFTER_SEQ NUMBER(8),
    FOREIGN KEY (TARGET_AFTER_SEQ) REFERENCES AFTERBBS(SEQ),
    CONTENT VARCHAR2(3000),
    TARGET_USER_SEQ NUMBER(8),
    FOREIGN KEY (TARGET_USER_SEQ) REFERENCES DENGUSER(SEQ),
TARGET_USER_EMAIL VARCHAR2(50),
    FOREIGN KEY (TARGET_USER_EMAIL) REFERENCES DENGUSER(EMAIL),
    REG_DATE date,
    DEL NUMBER(1),
    STEP NUMBER(5),
    DEPTH NUMBER(5)
);


create sequence event_seq start with 1 increment by 1;
create table event(
	seq number(8),
	title varchar2(100),
	content long,
	start_date varchar2(100),
	end_date varchar2(100),
	location varchar2(200)
);


drop table commucomment cascade constraints;
drop sequence COMMUCOMMENT_SEQ;



--커뮤니티 댓글
CREATE SEQUENCE COMMUCOMMENT_SEQ START WITH 1 INCREMENT BY 1;
CREATE TABLE COMMUCOMMENT(
    SEQ NUMBER(8) PRIMARY KEY,
    TARGET_AFTER_SEQ NUMBER(8),
    FOREIGN KEY (TARGET_AFTER_SEQ) REFERENCES AFTERBBS(SEQ),
    CONTENT VARCHAR2(3000),
    TARGET_USER_SEQ NUMBER(8),
    FOREIGN KEY (TARGET_USER_SEQ) REFERENCES DENGUSER(SEQ),
TARGET_USER_EMAIL VARCHAR2(50),
    FOREIGN KEY (TARGET_USER_EMAIL) REFERENCES DENGUSER(EMAIL),
    REG_DATE date,
    DEL NUMBER(1),
    STEP NUMBER(5),
    DEPTH NUMBER(5)
);



drop table animalcomment cascade constraints;
drop sequence ANIMALCOMMENT_SEQ;



--분양글 댓글
CREATE SEQUENCE ANIMALCOMMENT_SEQ START WITH 1 INCREMENT BY 1;
CREATE TABLE ANIMALCOMMENT(
    SEQ NUMBER(8) PRIMARY KEY,
    TARGET_AFTER_SEQ NUMBER(8),
    FOREIGN KEY (TARGET_AFTER_SEQ) REFERENCES AFTERBBS(SEQ),
    CONTENT VARCHAR2(3000),
    TARGET_USER_SEQ NUMBER(8),
    FOREIGN KEY (TARGET_USER_SEQ) REFERENCES DENGUSER(SEQ),
TARGET_USER_EMAIL VARCHAR2(50),
    FOREIGN KEY (TARGET_USER_EMAIL) REFERENCES DENGUSER(EMAIL),
    REG_DATE date,
    DEL NUMBER(1),
    STEP NUMBER(5),
    DEPTH NUMBER(5)
);
