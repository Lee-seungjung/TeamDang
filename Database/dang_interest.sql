-- 회원 관심지역(dang_interest)
create table dang_interest(
user_no references dang_user(user_no) on delete cascade,
interest_area varchar2(30) not null
);
