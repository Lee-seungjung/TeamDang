-- 게시글 첨부파일(board_img)
create table board_img(
board_no references dang_board(board_no) on delete cascade,
attachment_no references attachment(attachment_no) on delete cascade
);