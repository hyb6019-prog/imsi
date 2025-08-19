/*
���̺� ���� ����
create table ���̺��̸�(�÷��̸�1 �ڷ���(ũ��), �÷��̸�2 �ڷ���(ũ��).......)

create table ���̺��̸�(
    �÷��̸�1       �ڷ���(ũ��),
    �÷��̸�2       �ڷ���(ũ��),
    ...
)
-> �÷��̸�,���̺��̸� �ۼ� �� ī��ǥ���, �Ľ�Įǥ��� ��� ��� �Ұ��� ->��/�ҹ��� ����x
phoneNumber
PhoneNumber
->�ܾ�� �ܾ� ���̸� ������ھ�(_)�� ���� : ������ũ ǥ���
phone_number

*/


/*
ȸ�������� �����ϴ� ���̺�
    -> ���̵� / ��й�ȣ / �̸� / ���� / ��ȭ��ȣ / ���� / ȸ��������
     ���̺� �̸� : member_tbl, member, user_tbl.....
        -> user_tbl
     �׸�             �÷��̸�              �ڷ���
     ���̵� ->        user_id              ���ڿ�-> varchar2(20)
     ��й�ȣ ->      user_pw              ���ڿ�-> varchar2(30) / char(60) --char(60)�� ���߿� ��ȣȭ�Ҷ� ���
     �̸� ->          user_name            ���ڿ�-> varchar2(30)
     ���� ->          user_age             ����  -> number
     ��ȭ��ȣ ->      user_phone           ���ڿ�-> char(13)
     ���� ->          user_gender          ���ڿ�-> char(6)
     ȸ��������       user_date             ��¥-> date       
*/


create table user_tbl(
    user_id     varchar2(20), 
    user_pw     varchar2(30),
    user_name   varchar2(30),
    user_age    number,
    user_phone  char(13),
    user_gender char(6),
    user_date   date
);
select * from user_tbl;

-- �÷��� ���� �޾��ֱ�
comment on column user_tbl.user_id is 'ȸ�� ���̵�';     
comment on column user_tbl.user_pw is 'ȸ�� ��й�ȣ';   


insert into 
    member_tbl(member_id, member_pw, member_name, member_age, member_phone, member_gender, enroll_date)
    values('user01','1234','����1',20,'010-1111-1111','��',sysdate);
    
    
insert into
    user_tbl(user_id, user_pw, user_name, user_age, user_phone, user_gender, user_date)
    values('user01','1111','����01',10,'010-1111-1111','��',sysdate);
insert into
    user_tbl(user_id, user_pw, user_name, user_age, user_phone, user_gender, user_date)
    values('user02','2222','����02',20,'010-2222-2222','��',sysdate);
insert into
    user_tbl(user_id, user_pw, user_name, user_age, user_phone, user_gender, user_date)
    values('user03','3333','����03',30,'010-3333-3333','��',sysdate);
insert into
    user_tbl(user_id, user_pw, user_name, user_age, user_phone, user_gender, user_date)
    values('user04','4444','����04',40,'010-4444-4444','��',sysdate);
insert into
    user_tbl(user_id, user_pw, user_name, user_age, user_phone, user_gender, user_date)
    values('user05','5555','����05',50,'010-5555-5555','��',sysdate);
insert into
    user_tbl(user_id, user_pw, user_name, user_age, user_phone, user_gender, user_date)
    values('user06','6666','����06',60,'010-6666-6666','��',sysdate);

/*
not null : �ش� �÷��� null�� ������� ���� / �ݵ�� �����͸� ����ؾ߸� �ϴ� ��� ���
        -> insert/update �� null �� ����� �� ����
*/

create table user_tbl_nn(
    user_id     varchar2(20)    not null,       -- not null ���������� �÷����������� ���� ����
    user_pw     varchar2(30)    not null,
    user_name   varchar2(30),
    user_age    number,
    user_phone  char(13)        not null,
    user_gender char(6),
    user_date   date
);
select * from user_tbl_nn;
insert into user_tbl_nn values('user01','1111','����1',22,'010-1111-1111','����',sysdate);
insert into user_tbl_nn values('user02','2222','����2',33,'010-2222-2222','����',null); --not null�� ���� �÷����� null�� �Էµ�
update user_tbl_nn set user_pw = null where user_id='user01';  --x


/*
unique(unique key) : �÷� �Է°��� ���ؼ� �ߺ��� �����ϴ� ��������
*/

create table user_tbl_uk1(
    user_id     varchar2(20)    unique,         --�÷��������� �������� ����
    user_pw     varchar2(30),
    user_name   varchar2(30),
    user_age    number,
    user_phone  char(13)        unique,         --�÷��������� �������� ����
    user_gender char(6),
    user_date   date
);
select * from user_tbl_uk1;
insert into user_tbl_uk1 values('user01','1111','����1',20,'010-1111-1111','����',sysdate);
insert into user_tbl_uk1 values('user02','2222','����2',22,'010-2222-2222','����',sysdate);
insert into user_tbl_uk1 values('user03','3333','����3',23,'010-3333-3333','����',sysdate);
update user_tbl_uk1 set user_phone = '010-2222-2222' where user_id='user01';  --x



create table user_tbl_uk2(
    user_id     varchar2(20), 
    user_pw     varchar2(30),
    user_name   varchar2(30),
    user_age    number,
    user_phone  char(13),
    user_gender char(6),
    user_date   date,
    unique(user_id),              --���̺������� �������� ����
    unique(user_phone)
);
select * from user_tbl_uk2;
insert into user_tbl_uk2 values('user01','1111','����1',20,'010-1111-1111','����',sysdate);
insert into user_tbl_uk2 values('user02','2222','����2',22,'010-2222-2222','����',sysdate);
insert into user_tbl_uk2 values('user03','3333','����3',23,'010-2222-2222','����',sysdate); --����x
insert into user_tbl_uk2 values('user04','4444','����4',24,null,'����',sysdate); --unique�� �ɾ null �Էµ�
insert into user_tbl_uk2 values('user05','5555','����5',25,null,'����',sysdate); --null�� �ߺ��Ǿ ������


create table user_tbl_uk3(
    user_id     varchar2(20), 
    user_pw     varchar2(30),
    user_name   varchar2(30),
    user_age    number,
    user_phone  char(13),
    user_gender char(6),
    user_date   date,
    unique(user_id, user_phone)             ----���̺� �������� �������� ���� / Id�� phone�� ���ÿ� ������ ��� / ����Ű
);
select * from user_tbl_uk3;
insert into user_tbl_uk3 values('user01','1111','����1',20,'010-1111-1111','����',sysdate);
insert into user_tbl_uk3 values('user02','2222','����2',22,'010-2222-2222','����',sysdate);
insert into user_tbl_uk3 values('user03','3333','����3',23,'010-2222-2222','����',sysdate); -- phone�� �ߺ��̹Ƿ� ����
insert into user_tbl_uk3 values('user02','3333','����3',23,'010-2222-2222','����',sysdate); -- id,phone ��� �ߺ��̹Ƿ� ����x
insert into user_tbl_uk3 values('user02','3333','����3',23,'010-1111-1111','����',sysdate); -- id�� �ߺ������� phone�� �ߺ��� �ƴϹǷ� ����



/*
primary key : ���̺��� �� ���� ������ �����ϱ� ���� �ĺ��ڿ���(���������� not null + unique)
            -> �� ���̺�� 1���� ���� ����
*/

create table user_tbl_pk1(
    user_id     varchar2(20)    primary key,    --�÷��������� ���� 
    user_pw     varchar2(30),
    user_name   varchar2(30),
    user_age    number,
    user_phone  char(13),
    user_gender char(6),
    user_date   date
);
select * from user_tbl_pk1;
insert into user_tbl_pk1 values('user01','1111','����1',20,'010-1111-1111','����',sysdate);
insert into user_tbl_pk1 values('user02','2222','����2',22,'010-2222-2222','����',sysdate);
insert into user_tbl_pk1 values('user02','3333','����3',23,'010-3333-3333','����',sysdate);


create table user_tbl_pk2(
    user_id     varchar2(20), 
    user_pw     varchar2(30),
    user_name   varchar2(30),
    user_age    number,
    user_phone  char(13),
    user_gender char(6),
    user_date   date,
    primary key(user_id)       --���̺� �������� ����
);
select * from user_tbl_pk2;
insert into user_tbl_pk2 values('user01','1111','����1',20,'010-1111-1111','����',sysdate);
insert into user_tbl_pk2 values('user02','2222','����2',22,'010-2222-2222','����',sysdate);
insert into user_tbl_pk2 values('user02','3333','����3',23,'010-3333-3333','����',sysdate);


create table user_tbl_pk3(
    user_id     varchar2(20), 
    user_pw     varchar2(30),
    user_name   varchar2(30),
    user_age    number,
    user_phone  char(13),
    user_gender char(6),
    user_date   date,
    primary key(user_id, user_pw)       --���̺� �������� ����(����Ű ����)
);

/*
�ܷ�Ű ������ ���� ����
1) ���θ� �����ͺ��̽� ����
2) �� ���θ��� �ݵ�� ȸ�������� �ϰ� �α����� �� ���·θ� ���Ǳ��� ����
3) ������������ ȸ�� ���̺��� ������ �� �־�� ��
*/
create table shop_member(
    user_no     number          primary key,
    user_id     varchar2(20)    not null unique,        --���� ���������� �ѹ��� �������� ����� ����
    user_pw     varchar2(30)    not null,
    user_name   varchar2(30) 
);
select * from shop_member;
insert into shop_member values(1,'user01','1111','����1');
insert into shop_member values(2,'user02','2222','����2');
insert into shop_member values(3,'user03','3333','����3');

create table shop_buy1(
    buy_no          number              primary key,
    buy_propuct     varchar2(30)        not null,
    buy_id          varchar2(20),
    buy_date        date
);
select * from shop_buy1;
insert into shop_buy1 values(1,'������','user01',sysdate);
insert into shop_buy1 values(2,'������','user00',sysdate);  --���̵�� ����� ��ȸ�� �ȵǴ� ����

create table shop_buy2(
    buy_no          number              primary key,
    buy_propuct     varchar2(30)        not null,
    buy_id          varchar2(20)        references shop_member(user_id),    -- �ܷ�Ű �÷����� ����
    buy_date        date
);
select * from shop_buy2;
select user_id from shop_member;
insert into shop_buy2 values(1,'������','user01',sysdate);
insert into shop_buy2 values(2,'������','user00',sysdate);     -- ���� ���Ἲ�� ����

create table shop_buy3(
    buy_no          number              primary key,
    buy_propuct     varchar2(30)        not null,
    buy_id          varchar2(20),
    buy_date        date,
    foreign key(buy_id) references shop_member(user_id)     -- �ܷ�Ű ���̺��� ����
);
select * from shop_buy3;
insert into shop_buy3 values(1,'������','user01',sysdate);
insert into shop_buy3 values(2,'������','user00',sysdate); 

create table shop_buy4(
    buy_no          number              primary key,
    buy_propuct     varchar2(30)        not null,
    user_no         number references shop_member(user_no),
    buy_date        date
);
insert into shop_buy4 values(1,'������','1',sysdate);
select * from shop_member;
select * from shop_buy4;

create table shop_buy5( --unique or primary �� �ƴ� �÷��� �����ؼ� �����Ұ�
    buy_no          number              primary key,
    buy_propuct     varchar2(30)        not null,
    user_no         number references shop_member,        --primary key�� �����ϴ� ��� �÷��̸� ���� ����
    buy_date        date
);
select * from shop_member;
select * from shop_buy5;
insert into shop_buy5 values(1,'�����','2',sysdate);
delete from shop_member where user_no=3;        --�� ������
delete from shop_member where user_no=2;        --x �����ϰ� �־ ������ / �����ϰ� �ִ� ���Ÿ���� ���� �� �����ؾ� ��
delete from shop_buy5 where user_no=2;
delete from shop_member where user_no=1;        --x 

select
    buy_no, buy_product, user_name, buy_date
from shop_buy2
join shop_member on (buy_id = user_id);

--����Ű ��


create table shop_buy6(
    buy_no          number              primary key,
    buy_propuct     varchar2(30)        not null,
    user_no         number references shop_member on delete set null, --primary key�� �����ϴ� ��� �÷��̸� ���� ���� / �θ����Ͱ� ������� �ڽĵ����ʹ� null������ �ٲ�
    buy_date        date
);
select * from shop_member;
select * from shop_buy6;
insert into shop_buy6 values(1,'�����','1',sysdate);
insert into shop_buy6 values(2,'����','2',sysdate);
delete from shop_member where user_no=2;


create table shop_buy7(
    buy_no          number              primary key,
    buy_propuct     varchar2(30)        not null,
    user_no         number references shop_member on delete cascade, --primary key�� �����ϴ� ��� �÷��̸� ���� ���� / �θ����͸� �����ϰ� �ִ� �ڽĵ����ͱ��� ��� ����
    buy_date        date
);
select * from shop_member;
select * from shop_buy7;
insert into shop_buy7 values(1,'�����','1',sysdate);
insert into shop_buy7 values(2,'����','2',sysdate);

delete from shop_member where user_no = 2;
delete from shop_member where user_no = 1;
commit;


--CHECK

create table user_tbl_check(
    user_id     varchar2(20), 
    user_pw     varchar2(30),
    user_name   varchar2(30),
    user_age    number,
    user_phone  char(13),
    user_gender char(6) check(user_gender in ('����', '����')),
    user_date   date
);
select * from user_tbl_check;
insert into user_tbl_check values('user01','1111','����1',20,'010-1111-1111','����',sysdate);
insert into user_tbl_check values('user01','1111','����1',20,'010-1111-1111','����',sysdate);
insert into user_tbl_check values('user01','1111','����1',20,'010-1111-1111','��',sysdate);    -- ������ ���ڰ� �ƴ� �ٸ� ���ڸ� �Է��ϸ� ����x


--default : insert �۾� �� �⺻�� ��������

create table user_tbl_default(
    user_id     varchar2(20), 
    user_pw     varchar2(30),
    user_name   varchar2(30),
    user_age    number default 0 not null, -- not null�� �ɷ������� default ���(insert�ÿ���)
    user_phone  char(13),
    user_gender char(6),
    user_date   date
);
select * from user_tbl_default;
insert into 
    user_tbl_default(user_id,user_pw,user_name,user_age,user_phone,user_gender,user_date)
    values('user01','1111','����1',20,'010-1111-1111','����',sysdate);
insert into 
    user_tbl_default(user_id,user_pw,user_name,user_age,user_phone,user_date)
    values('user02','2222','����2',22,'010-2222-2222',sysdate);       --���� �÷��� ���� ��� ���� �� �����ϸ� null������ �Էµ�
insert into 
    user_tbl_default(user_id,user_pw,user_name,user_date)
    values('user03','3333','����3',sysdate);             -- ����,��ȭ��ȣ,���� ���� �� ���� / ��ȭ��ȣ�� ������ null�� �Է�, age�� ����Ʈ���� 0���� �Է��ؼ� 0����, ����Ʈ�� insert���� �۵���
insert into
   user_tbl_default values('user04','4444','����1','010-4444-4444','����',sysdate); --�÷����� insert������ ���Խ� age ����Ʈ�� �Է¾ȵ�, ���Ե� �ȵ� / �÷����� insert���� �÷��� ������ ������ ���� �Է����ִ� ����̱� ����
insert into
   user_tbl_default values('user04','4444','����1',default,'010-4444-4444','����',sysdate); -- insert �������� default�� ������ �Է°���

-- create�� ���� ���̺��� '���Ǿ�'





-- select���� �̿��ؼ� ���̺� ����
-- �÷��̸�, �ڷ���(����), ��ȸ�� �����ͱ��� ����
-- ���������� ����x(not null�� ����)
create table user_tbl_copy
as                          --uk2 ���̺� ���� ���
select * from user_tbl_uk2; 

select * from user_tbl_copy;

create table user_tbl_copy1
as                          
select * from user_tbl_uk2 where 1=0; 

select * from user_tbl_uk2 where 1=0;  -- ���ٵ� ������� �ʴ� ���ǽ� / ���̺��� ������ �����ϰ� ������� �ʿ������


--Alter : DDL�� �� ������ CREATE�� ������� ������ ������ �� ���
select * from user_tbl_copy;

-- �÷��߰�
alter table user_tbl_copy
add (user_addr varchar2(50));   -- �����ʹ� �ϴ� null�� ���õ�

alter table user_tbl_copy
add (test_col varchar2(20) default 'test' not null);  --not null�� �����ؼ� �߰��ϸ� �ȵ� / �⺻������ null���� �־�� �ϹǷ� �̷��� default�� ��

-- �÷� ����
alter table user_tbl_copy
modify user_name varchar2(60);

alter table user_tbl_copy
modify user_gender char(3); -- ���� ������ �������� 3����Ʈ�� �ٲ����� ����. ���� �����͸� ���� �� �ٲٰ� �� �� �۾��ؾ� ��
update user_tbl_copy set user_gender='��';   --charŸ���� '��___'�� ������ 6����Ʈ�� ��Ƽ� ������ �ȵ�
alter table user_tbl_copy
modify user_gender varchar2(3); --�׷��� varchar2�� ���� �ٲ� �� �����ؾߵ�

-- �÷� ����
alter table user_tbl_copy
drop column test_col;   
--���� �ܷ�Ű�� �����ϰ� �ִ� ��� �÷����� �ȵ�
--casecade�� ����� ������ �������� ������ ����


-- �÷� �̸� ����
alter table user_tbl_copy
rename column user_addr to user_address;

-- ���̺� ����Ǿ� �ִ� �������� Ȯ���ϴ� ����
select
    uc.constraint_name,
    uc.constraint_type,
    uc.table_name,
    ucc.column_name,
    uc.search_condition
from user_constraints uc
join user_cons_columns ucc on (uc.constraint_name = ucc.constraint_name)
where uc.table_name = 'ALTER_TEST'; --���̺���� �ݵ�� �빮��

create table test_tbl(
    test_no         number          primary key,
    test_data       varchar2(20)    unique,
    test_data2      varchar2(30)    not null,
    test_data3      varchar2(20)    
);

-- �������� �߰�
alter table test_tbl
add constraint test_tbl_unq unique(test_data2);

alter table test_tbl
modify test_data constraint test_data_nn not null; --not null ���������� modify�� �߰�


-- �������� ����
alter table test_tbl
drop constraint SYS_C007053; --SYS_C007053�� ���� �������� �̸�

alter table test_tbl
modify test_data null;      -- not null ���������� �����Ҷ��� modify


-- �������� �̸� ����
alter table test_tbl
rename constraint SYS_C007052 to test_tbl_pk;


select * from test_tbl;
-- ���̺� �̸� ����
alter table test_tbl
rename to alter_test;

select * from alter_test;

select * from user_tables;
COMMIT;



select * from alter_test;
-- ���̺� ����
drop table alter_test;

create table drop_test1(
    test_no         number          primary key,
    test_data       varchar2(20)    not null
);

create table drop_test2(
    test_no2         number,
    test_no3         number  references drop_test1
);

alter table drop_test2
drop constraint SYS_C007063;

drop table drop_test1;
drop table drop_test1 cascade constraints; --�ٸ� ���̺��� �����ϰ� ������ �������� ��� ���������� ���̺� ����� ���


















