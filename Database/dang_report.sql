-- dang_report(신고)

-- 시퀀스 등록
create sequence dang_report_seq;

-- 테이블 등록
create table dang_report(
report_no number primary key,
member_no references dang_member(member_no) on delete cascade,
report_content varchar2(300) not null,
report_date date default sysdate not null,
report_state char(6) default '접수' check(report_state in('접수','반려','완료')) not null
);
