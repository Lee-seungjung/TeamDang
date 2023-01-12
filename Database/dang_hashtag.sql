-- 댕모임 해시태그
create table dang_hashtag (
dang_no references dang(dang_no) on delete cascade,
hashtag_content varchar2(30)
);

