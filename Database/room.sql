-- room(채팅방)

-- 시퀀스
create sequence room_seq;

-- 테이블 생성
create table room(
room_no number primary key,
dang_no REFERENCES dang(dang_no) on delete cascade
);
