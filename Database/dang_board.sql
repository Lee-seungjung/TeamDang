-- 댕모임 게시글(dang_board)
create table dang_board(
board_no number primary key,
member_no references dang_member(member_no) on delete cascade,
dang_no references dang(dang_no) on delete cascade,
member_nick varchar2(30) not null, 
board_content varchar2(4000) not null,
board_like number,
board_writedate date default sysdate,
board_updatedate date,
board_state char(1) default 'N' check(board_state in ('Y', 'N'))
board_category varchar(12) check(board_category in ('가입인사', '공지사항','정모후기','자유글'));
);

-- 시퀀스(dang_board_seq)
create sequence dang_board_seq;
