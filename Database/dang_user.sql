-- 회원(dang_user)
create table dang_user(
user_no number primary key,
user_id varchar2(20) not null unique,
user_pw char(60) not null,
user_email varchar2(320) not null unique,
user_nick varchar2(30) not null unique,
user_tel varchar2(11) not null,
user_gender char(1) not null,
user_grade varchar2(9) default '일반' check(user_grade in ('일반', '관리자')),
user_joindate date default sysdate,
user_logindate date
);

-- 시퀀스 생성
create sequence dang_user_seq;
