-- 댕댕이(dang_puppy)
create table dang_puppy(
puppy_no number primary key,
puppy_reg_no varchar2(20),  
user_no references dang_user(user_no) on delete cascade,
puppy_name varchar2(15) not null,
puppy_gender char(1),
puppy_age number
);
