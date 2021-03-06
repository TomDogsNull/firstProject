멤버 테이블 (TEST01_MEMBER)

ID(아이디), PWD(비번), NAME(이름), EMAIL(이메일), ADDRESS1(주소1), ADDRESS2(주소2) ,
 AUTH(권한 관리자 3 , 일반회원 1 ) , PHONE(핸드폰번호), DEL(탈퇴 유무), AUTHKEY(이메일 체크검증), AUTHSTATUS(이메일 확인 유무)  

DROP TABLE TEST01_MEMBER
CASCADE CONSTRAINTS;

CREATE TABLE TEST01_MEMBER (
ID VARCHAR2(50) PRIMARY KEY,
PWD VARCHAR2(50) NOT NULL,
NAME VARCHAR2(50) NOT NULL,
EMAIL VARCHAR2(50) UNIQUE NOT NULL,
ADDRESS1 VARCHAR2(50) NOT NULL,
ADDRESS2 VARCHAR2(50),
AUTH NUMBER(1) NOT NULL,
PHONE VARCHAR2(50) UNIQUE NOT NULL,
DEL NUMBER(1) NOT NULL,
AUTHKEY VARCHAR2(50),
AUTHSTATUS NUMBER(1) NOT NULL
);

- 푸드 게시판 테이블 (TEST01_FOOD)
FOOD_SEQ(FOOD게시판 글번호, 기본키), ID(작성자 아이디,외래키),TITLE(글제목), 
TOTAL_CNT(총 인원수), JOIN_CNT(참여인원 수 AJAX 필요), MEETINGDAY(모임날짜 DATE PICKER),
CONTENT(내용), WDATE(글쓴날짜), READ_CNT(조회수), LIKE_CNT(좋아요 수, 좋아요 수의 TOTAL COUNT는 DB에서 COUNT로 갯수 파악 AJAX로 처리할 예정 )  , files[] (

토탈 참여인원을 놓고   참여버튼을 눌러야만 댓글을 쓸 수 있게 

조회수
DROP TABLE TEST01_FOOD
CASCADE CONSTRAINTS;

DROP SEQUENCE SEQ_FOOD;

CREATE TABLE TEST01_FOOD (

FOOD_SEQ NUMBER(8) PRIMARY KEY,
ID VARCHAR2(50) NOT NULL,
TITLE VARCHAR2(200) NOT NULL,
TOTAL_CNT NUMBER(8) NOT NULL,
JOIN_CNT NUMBER(8) NOT NULL,
MEETINGDAY DATE NOT NULL,
CONTENT VARCHAR2(4000) NOT NULL,
WDATE DATE NOT NULL,
READ_CNT NUMBER(8) NOT NULL,
LIKE_CNT NUMBER(8) NOT NULL,
LOCAL VARCHAR2(50) NOT NULL,
DEL NUMBER(1) NOT NULL

);

ALTER TABLE TEST01_FOOD
ADD CONSTRAINT FK_FOOD_ID FOREIGN KEY(ID)
REFERENCES TEST01_MEMBER(ID);

CREATE SEQUENCE SEQ_FOOD
START WITH 1
INCREMENT BY 1;






- attach 테이블 (TEST01_attach)


FULLNAME(첨부파일 이름 , 기본키) , FOOD_SEQ(원 게시물 번호 , 외래키), RDATE(등록날짜) 

DROP TABLE TEST01_ATTACH
CASCADE CONSTRAINTS;

CREATE TABLE TEST01_ATTACH(

FULLNAME VARCHAR2(2000) PRIMARY KEY,
FOOD_SEQ NUMBER(8) NOT NULL,
RDATE DATE NOT NULL
);

ALTER TABLE TEST01_ATTACH
ADD CONSTRAINT FK_ATTACH_FSEQ FOREIGN KEY(FOOD_SEQ)
REFERENCES TEST01_FOOD(FOOD_SEQ);

- like 테이블 (TEST01_LIKE)

LIKE_SEQ(SEQ, 기본키) , FOOD_SEQ(글번호,외래키) , ID(아이디,외래키)
좋아요 수의 TOTAL COUNT는 DB에서 COUNT로 갯수 파악 

DROP TABLE TEST01_LIKE
CASCADE CONSTRAINTS;

DROP SEQUENCE SEQ_LIKE;


CREATE TABLE TEST01_LIKE(
LIKE_SEQ NUMBER(8) PRIMARY KEY,
FOOD_SEQ NUMBER(8) NOT NULL,
ID VARCHAR2(50) NOT NULL
);

CREATE SEQUENCE SEQ_LIKE
START WITH 1
INCREMENT BY 1;

ALTER TABLE TEST01_LIKE
ADD CONSTRAINT FK_LIKE_FSEQ FOREIGN KEY(FOOD_SEQ)
REFERENCES TEST01_FOOD(FOOD_SEQ);

ALTER TABLE TEST01_LIKE
ADD CONSTRAINT FK_LIKE_ID FOREIGN KEY(ID)
REFERENCES TEST01_MEMBER(ID);


- 댓글 테이블 따로 관리 ? (TEST01_REPLY)  
JSP include로 처리 
REPLY_SEQ(댓글번호,PRIMARY KEY) , ID(아이디, 외래키 MEMBER?), CONTENT(내용),
REF(),STEP() ,DEPTH(),WDATE(글 작성 날짜),DEL(삭제), FOOD_SEQ(원래게시판 번호 , 외래키 FOOD)


DROP TABLE TEST01_REPLY
CASCADE CONSTRAINTS;

DROP SEQUENCE SEQ_REPLY;


CREATE TABLE TEST01_REPLY(
REPLY_SEQ NUMBER(8) PRIMARY KEY,
ID VARCHAR2(50) NOT NULL,
CONTENT VARCHAR2(2000) NOT NULL,
REF NUMBER(8) NOT NULL,
STEP NUMBER(8) NOT NULL,
DEPTH NUMBER(8) NOT NULL,
WDATE DATE NOT NULL,
DEL NUMBER(1) NOT NULL,
FOOD_SEQ NUMBER(8) NOT NULL
);

CREATE SEQUENCE SEQ_REPLY
START WITH 1
INCREMENT BY 1;


ALTER TABLE TEST01_REPLY
ADD CONSTRAINT FK_REPLY_FSEQ FOREIGN KEY(FOOD_SEQ)
REFERENCES TEST01_FOOD(FOOD_SEQ);

ALTER TABLE TEST01_REPLY
ADD CONSTRAINT FK_REPLY_ID FOREIGN KEY(ID)
REFERENCES TEST01_MEMBER (ID);



-공지사항 OR 후기 게시판 OR QNA 

DROP TABLE TEST01_NOTICE
CASCADE CONSTRAINTS;

DROP SEQUENCE SEQ_NOTICE;

CREATE TABLE TEST01_NOTICE(
NOTICE_SEQ NUMBER(8) PRIMARY KEY,
ID VARCHAR2(50) NOT NULL,
TITLE VARCHAR2(200) NOT NULL,
CONTENT VARCHAR2(2000) NOT NULL,
READCOUNT NUMBER(8) NOT NULL,
RDATE DATE NOT NULL
);

CREATE SEQUENCE SEQ_NOTICE
START WITH 1
INCREMENT BY 1;

ALTER TABLE TEST01_NOTICE
ADD CONSTRAINT FK_NOTICE_ID FOREIGN KEY(ID)
REFERENCES TEST01_MEMBER(ID);

--join table  

DROP TABLE TEST01_JOIN
CASCADE CONSTRAINTS;

DROP SEQUENCE SEQ_JOIN;

CREATE TABLE TEST01_JOIN(
JOIN_SEQ NUMBER(8) PRIMARY KEY,
ID VARCHAR2(50) NOT NULL,
FOOD_SEQ NUMBER(8) NOT NULL,
DEL NUMBER(1) NOT NULL
);

CREATE SEQUENCE SEQ_JOIN
START WITH 1
INCREMENT BY 1;

ALTER TABLE TEST01_JOIN
ADD CONSTRAINT FK_JOIN_ID FOREIGN KEY(ID)
REFERENCES TEST01_MEMBER(ID);

ALTER TABLE TEST01_JOIN
ADD CONSTRAINT FK_JOIN_FSEQ FOREIGN KEY(FOOD_SEQ)
REFERENCES TEST01_FOOD(FOOD_SEQ);


--DONATION table  

DROP TABLE TEST01_DONATION
CASCADE CONSTRAINTS;

DROP SEQUENCE SEQ_DONATION;

CREATE TABLE TEST01_DONATION(
DONATION_SEQ NUMBER(8) PRIMARY KEY,
ID VARCHAR2(50) NOT NULL,
NAME VARCHAR2(50) NOT NULL, 
PHONE VARCHAR2(50) NOT NULL,
DONATION NUMBER(10) NOT NULL,
RDATE DATE NOT NULL
);

CREATE SEQUENCE SEQ_DONATION
START WITH 1
INCREMENT BY 1;

ALTER TABLE TEST01_DONATION
ADD CONSTRAINT FK_DONATION_ID FOREIGN KEY(ID)
REFERENCES TEST01_MEMBER(ID);




