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

--첨부파일 테이블 생성 구문
create table attachment(
attachment_no number primary key,
attachment_name varchar2(256),
attachment_type varchar2(30),
attachment_size number,
attachment_date date
);

--첨부파일 PK 시퀀스 번호 생성 구문
create sequence attachment_seq;

--모임장소 테이블 생성 구문
create table dang_place(
place_no number primary key,
place_x number,
place_y number,
place_sort varchar2(9) check(place_sort in('전체','카페','음식점','미용','운동장','공원')),
place_name varchar2(60),
place_info varchar2(300),
place_address varchar2(300),
place_operation varchar2(30),
place_off varchar2(30),
place_tel varchar2(13),
place_url varchar2(4000)
);

alter table dang_place add place_area varchar2(15) not null

--모임장소 PK 시퀀스 번호 생성 구문
create sequence dang_place_seq;

--모임장소 첨부파일 테이블 생성
create table place_img(
place_no references dang_place(place_no) on delete cascade,
attachment_no number references attachment(attachment_no) on delete cascade
);

--댕모임 일정 테이블 생성 구문
create table dang_schedule(
schedule_no number primary key,
member_no number references dang_member(member_no) on DELETE set null,
place_no number references dang_place(place_no) on DELETE set null,
schedule_title varchar2(60) not null,
schedule_content varchar2(300) not null,
schedule_headmax number not null,
schedule_head number DEFAULT 1 not null,
schedule_start date,
schedule_end date
);

--모임장소 PK 시퀀스 번호 생성 구문
create sequence dang_schedule_seq;

--출석 테이블 생성 구문
create table dang_attendance(
member_no references dang_member(member_no) on delete cascade,
attendance_date date DEFAULT sysdate not null
);

--댕모임 지역 테이블 생성 구문
create table dang_region(
dang_no references dang(dang_no) on delete cascade,
dang_area
);
