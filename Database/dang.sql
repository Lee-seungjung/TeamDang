-- dang(댕모임)

-- 시퀀스
create sequence dang_seq;

-- 테이블 생성
create table dang(
dang_no number primary key,
user_no references dang_user(user_no) on delete set null,
district_no references dang_region(district_no) on delete set null,
dang_name varchar2(60) not null,
dang_info varchar2(300) not null,
dang_headmax number not null,
dang_head number not null,
dang_createtime date default sysdate not null,
dang_like number default 0 not null,
dang_private char(1) default 'N' check(dang_private in('Y', 'N')) not null,
dang_pw char(4)
);

alter table dang add user_no references dang_user(user_no) on delete set null;
alter table dang modify dang_private char(1) default 'N' check(dang_private in('Y', 'N'));
alter table dang modify dang_pw char(4);

-- 댕모임 개설 (공개)
-- insert into dang(dang_no, user_no, dang_name, dang_info, dang_headmax, dang_head) values(#{dangNo}, #{userNo}, #{dangName}, #{dangInfo}, #{dangHeadmax}, #{dangHead})

-- 댕모임 개설 (비공개)
-- insert into dang(dang_no, user_no, dang_name, dang_info, dang_headmax, dang_head, dang_private, dang_pw) values(#{dangNo}, #{userNo}, #{dangName}, #{dangInfo}, #{dangHeadmax}, #{dangHead}, 'Y', #{dangPw})
