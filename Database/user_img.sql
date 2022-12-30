-- 회원 프로필(user_img)
create table user_img(
user_no references dang_user(user_no) on delete cascade,
attachment_no references attachment(attachment_no) on delete cascade
);