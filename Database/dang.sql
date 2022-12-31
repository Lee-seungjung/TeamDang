-- dang(댕모임)

-- 시퀀스
create sequence dang_seq;

-- 테이블 생성
create table dang(
dang_no number primary key,
user_no references dang_user(user_no) on delete set null,
dang_name varchar2(60) not null,
dang_info varchar2(300) not null,
dang_headmax number not null,
dang_head number not null,
dang_createtime date default sysdate not null,
dang_like number default 0 not null,
dang_private char(1) not null,
dang_pw number,
district_no references dang_region(district_no) on delete set null
);
