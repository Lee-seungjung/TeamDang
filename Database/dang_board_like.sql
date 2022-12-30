-- 댕모임 게시글 좋아요(dnag_board_like)
create table dang_board_like(
board_no references dang_board(board_no) on delete cascade,
member_no references dang_member(member_no) on delete cascade
);