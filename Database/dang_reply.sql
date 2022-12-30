-- 댕모임 댓글(dang_reply)
create table dang_reply(
reply_no number primary key,
board_no references dang_board(board_no) on delete set null,
member_no references dang_member(member_no) on delete set null,
reply_content varchar2(300) not null,
reply_writedate date default sysdate not null,
reply_updatedate date,
reply_state char(1) default 'N' check(reply_state in('Y', 'N'))
);

-- 시퀀스 생성
create sequence dang_reply_seq;