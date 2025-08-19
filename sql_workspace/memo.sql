create table memo_tbl(
    memo_id         number              primary key,        -- 메모 아이디
    memo_writer     varchar2(50)        not null,           -- 작성자
    memo_content    varchar2(1000)      not null,           -- 메모 내용
    write_date      date                not null            -- 메모 작성일
);
select * from memo_tbl;
delete from memo_tbl;

create sequence memo_seq;                                   -- 메모 아이디를 자동으로 채번할 시퀀스
insert into memo_tbl values(memo_seq.nextval, '유저01' , '하하하' , sysdate);
commit;
create sequence memo_seq
start with 1
increment by 1
maxvalue 1000000
nocycle
;