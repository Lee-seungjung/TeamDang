-- 댕모임 좋아요(dang_like)
create table dang_like(
user_no references dang_user(user_no) on delete cascade,
dang_no references dang(dang_no) on delete cascade
);
