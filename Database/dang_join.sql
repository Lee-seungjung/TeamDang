--댕모임 참여회원수 테이블 생성 구문
create table dang_join(
schedule_no references dang_schedule(schedule_no) on delete cascade,
member_no references dang_member(member_no) on delete set null
);

