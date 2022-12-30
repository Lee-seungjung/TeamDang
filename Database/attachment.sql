--첨부파일 테이블 생성 구문
create table attachment(
attachment_no number primary key,
attachment_name varchar2(256) not null,
attachment_type varchar2(30) not null,
attachment_size number not null,
attachment_date date not null
);

--첨부파일 PK 시퀀스 번호 생성 구문
create sequence attachment_seq;
