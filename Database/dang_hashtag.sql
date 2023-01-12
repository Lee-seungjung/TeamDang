-- 댕모임 해시태그
create table dang_hashtag (
hashtag_no number primary key,
dang_no references dang(dang_no) on delete cascade,
hashtag_content varchar2(30)
);

-- 시퀀스 생성
create sequence dang_hashtag_seq;
