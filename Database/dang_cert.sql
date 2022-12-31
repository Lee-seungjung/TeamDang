-- 이메일 인증번호(dang_cert)
create table dang_cert(
cert_email varchar2(320) primary key,
cert_serial varchar2(6) not null,
cert_validtime date default sysdate
);

commit;