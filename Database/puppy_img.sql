-- 댕댕이 프로필(puppy_img)
create table puppy_img(
puppy_no references dang_puppy(puppy_no) on delete cascade,
attachment_no references attachment(attachment_no) on delete cascade
);