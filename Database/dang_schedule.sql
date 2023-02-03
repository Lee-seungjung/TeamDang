--댕모임 일정 테이블 생성 구문
create table dang_schedule(
schedule_no number primary key,
member_no number references dang_member(member_no) on delete cascade,
place_no number references dang_place(place_no) on delete cascade,
schedule_title varchar2(60) not null,
schedule_content varchar2(300) not null,
schedule_headmax number not null,
schedule_head number default 1 check(schedule_head >= 0) not null,
schedule_start date,
schedule_hour varchar2(5),
schedule_money number default 0 check(schedule_money >= 0)
);

-- 시퀀스 번호 생성
create sequence dang_schedule_seq;
