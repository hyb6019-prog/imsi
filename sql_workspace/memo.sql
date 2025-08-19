create table memo_tbl(
    memo_id         number              primary key,        -- �޸� ���̵�
    memo_writer     varchar2(50)        not null,           -- �ۼ���
    memo_content    varchar2(1000)      not null,           -- �޸� ����
    write_date      date                not null            -- �޸� �ۼ���
);
select * from memo_tbl;
delete from memo_tbl;

create sequence memo_seq;                                   -- �޸� ���̵� �ڵ����� ä���� ������
insert into memo_tbl values(memo_seq.nextval, '����01' , '������' , sysdate);
commit;
create sequence memo_seq
start with 1
increment by 1
maxvalue 1000000
nocycle
;