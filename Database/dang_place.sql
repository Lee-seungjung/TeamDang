--모임장소 테이블 생성 구문
create table dang_place(
place_no number primary key,
place_x number,
place_y number,
place_area varchar2(15) not null,
place_sort varchar2(9) check(place_sort in('전체','카페','음식점','미용','운동장','공원')),
place_name varchar2(60),
place_info varchar2(300),
place_address varchar2(300),
place_operation varchar2(30),
place_off varchar2(30),
place_tel varchar2(13),
place_url varchar2(4000)
);

--모임장소 PK 시퀀스 번호 생성 구문
create sequence dang_place_seq;