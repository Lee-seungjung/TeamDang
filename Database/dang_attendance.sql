--출석 테이블 생성 구문
create table dang_attendance(
member_no references dang_member(member_no) on delete cascade,
attendance_date date DEFAULT sysdate not null
);