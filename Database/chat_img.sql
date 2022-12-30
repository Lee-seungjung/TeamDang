-- chat_img(채팅사진)

-- 테이블 등록
create table chat_img(
chat_no references dang_chat(chat_no) on delete cascade,
attachment_no references attachment(attachment_no) on delete cascade
);
