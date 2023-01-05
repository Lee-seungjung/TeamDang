-- dang_member(댕모임 회원)

-- 시퀀스
create sequence dang_member_seq;

-- 테이블
create table dang_member(
member_no number primary key,
dang_no references dang(dang_no) on delete cascade,
user_no references dang_user(user_no) on delete cascade,
member_nick varchar2(30) not null,
member_owner char(1) default 'N' check(member_owner in('Y','N')) not null,
member_grade varchar2(4) default 'LV.1' check(member_grade in('LV.1', 'LV.2', 'LV.3', 'LV.4', 'LV.5')) not null,
member_score number default 0 not null,
member_joindate date default sysdate not null
);
