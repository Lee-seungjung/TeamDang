--댕모임 일정 테이블 생성 구문
create table dang_schedule(
schedule_no number primary key,
member_no number references dang_member(member_no) on delete set null,
place_no number references dang_place(place_no) on delete set null,
schedule_title varchar2(60) not null,
schedule_content varchar2(300) not null,
schedule_headmax number not null,
schedule_head number default 1 not null,
schedule_start date,
schedule_end date,
schedule_hour varchar2(5)
);

-- 시퀀스 번호 생성
create sequence dang_schedule_seq;
