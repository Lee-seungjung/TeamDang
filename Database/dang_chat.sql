
-- dang_chat(채팅)

-- 시퀀스
create sequence dang_chat_seq;

-- 테이블
create table dang_chat(
chat_no number primary key,
room_no references room(room_no) on delete cascade,
user_no number not null,
member_nick varchar2(30) not null,
chat_type varchar2(5) check(chat_type in ('text' ,'image')) not null,
chat_content varchar2(3000) not null,
chat_date date default sysdate not null,
chat_status number default 1 not null
);
