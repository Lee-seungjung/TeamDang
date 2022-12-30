-- report_img(신고 첨부파일)

-- 테이블 등록
create table report_img(
report_no references dang_report(report_no) on delete cascade,
attachment_no references attachment(attachment_no) on delete cascade
);
