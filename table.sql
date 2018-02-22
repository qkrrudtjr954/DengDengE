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
create SEQUENCE deng_user_seq start with 1 increment by 1;
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
VALUES(deng_user_seq.NEXTVAL, 'aa', 'aa', SYSDATE, SYSDATE, 0);

