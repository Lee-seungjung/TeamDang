-- 댕모임 게시글(dang_board)
create table dang_board(
board_no number primary key,
member_no references dang_member(member_no) on delete set null,
board_content varchar2(4000) not null,
board_like number,
board_writedate date default sysdate,
board_updatedate date,
board_state char(1) default 'N' check(board_state in ('Y', 'N'))
);