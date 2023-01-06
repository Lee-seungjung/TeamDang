-- 댕모임 회원 첨부파일
create table member_img(
member_no references dang_member(member_no) on delete cascade,
attachment_no references attachment(attachment_no) on delete cascade
);