-- 댕댕이 특이사항 (puppy_character)
create table puppy_character(
puppy_no references dang_puppy(puppy_no) on delete cascade,
character_content varchar2(30) not null
);