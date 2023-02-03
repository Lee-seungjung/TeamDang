-- 댕모임 댓글(dang_reply)
create table dang_reply(
reply_no number primary key,
board_no references dang_board(board_no) on delete cascade,
member_no references dang_member(member_no) on delete cascade,
member_nick varchar2(30) not null, 
reply_content varchar2(300) not null,
reply_writedate date default sysdate not null,
reply_updatedate date,
reply_state char(1) default 'N' check(reply_state in('Y', 'N')) not null
);

-- 시퀀스 생성
create sequence dang_reply_seq;
