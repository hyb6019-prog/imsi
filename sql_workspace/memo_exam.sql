create table memo_tbl(
    memo_id         number          primary key,
    memo_title      varchar2(200)   not null,
    memo_content    varchar2(1000)  not null,
    memo_writer     varchar2(50)    not null,
    write_date      char(10)        not null
);
create SEQUENCE memo_seq;
Drop sequence memo_seq;
commit;

select * from memo_tbl;


insert into memo_tbl values (memo_seq.nextval, '馬馬', '馬馬馬馬馬', '政煽01', to_char(sysdate, 'yyyy-mm-dd'));
insert into memo_tbl values (memo_seq.nextval, '馬馬2', '馬馬馬馬馬2', '政煽02', to_char(sysdate, 'yyyy-mm-dd'));

select * from memo_tbl where memo_writer = '馬馬馬';