--댕모임 지역 테이블 생성 구문
create table dang_region(
dang_area_no number PRIMARY KEY,
dang_area_name varchar2(30) not null,
dang_area_x number not null,
dang_area_y number not null
);

--댕모임 지역 PK 시퀀스 번호 생성 구문
create sequence dang_region_seq;
