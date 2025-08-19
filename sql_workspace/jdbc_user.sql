create table member_tbl(
    member_id       varchar2(20)        primary key,
    member_pw       varchar2(30)        not null,
    member_name     varchar2(30)        not null,
    member_phone    char(13)            not null,
    member_age      number              not null,
    member_gender   char(3)             not null,
    enroll_date     date                not null
);
select * from member_tbl;

insert into member_tbl values('user01',1111,'����01','010-1111-1111',11,'��',sysdate);
insert into member_tbl values('user02',2222,'����02','010-2222-2222',22,'��',sysdate);
insert into member_tbl values('user03',3333,'����03','010-3333-3333',33,'��',sysdate);
insert into member_tbl values('user04',4444,'����04','010-4444-4444',44,'��',sysdate);
insert into member_tbl values('user05',5555,'����05','010-5555-5555',55,'��',sysdate);
insert into member_tbl values('user09',9999,'����09','010-9999-9999',99,'��',sysdate);
commit;

select * from member_tbl where MEMBER_NAME like '%����%';
--update runningman set pass = 9999 where nickname = '�߱�ģ��';
update member_tbl set MEMBER_PW = 2222 where member_id = 'user01';

select * from member_tbl where member_id = '%user%';
select * from member_tbl where member_name like '%����%';

select count(*) cnt from member_tbl where member_id = 'user01';

--member_tbl���� �����ϸ� ����ȸ�������� �����ϴ� ���̺�
create table del_member_tbl(
    member_id       varchar2(20)        primary key,
    member_name     varchar2(30)        not null,
    member_phone    char(13)            not null,
    out_date        date                not null
);

select * from member_tbl;

select * from del_member_tbl;
delete from del_member_tbl;
commit;











