--모임장소 첨부파일 테이블 생성
create table place_img(
place_no references dang_place(place_no) on delete cascade,
attachment_no number references attachment(attachment_no) on delete cascade
);