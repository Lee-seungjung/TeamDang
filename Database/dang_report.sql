-- dang_report(신고)

-- 시퀀스 등록
create sequence dang_report_seq;

-- 테이블 등록
create table dang_report(
report_no number primary key,
dang_no references dang(dang_no) on delete cascade,
report_user_no number not null,
user_no number not null,
member_nick varchar2(18) not null,
report_content varchar2(300) not null,
report_date date default sysdate not null,
report_state char(6) default '접수' check(report_state in('접수','반려','완료')) not null,
report_alert number default 1 check(report_alert in (0 ,1)) not null
);
