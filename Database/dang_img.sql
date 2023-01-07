-- 댕모임 프로필 첨부파일
create table dang_img(
dang_no references dang(dang_no) on delete cascade,
attachment_no references attachment(attachment_no) on delete cascade
);