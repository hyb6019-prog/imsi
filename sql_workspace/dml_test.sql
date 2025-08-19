/*
    ȸ�������� �����ϴ� ���̺�
    ���̵� / ��й�ȣ / �̸� / ���� / ��ȭ��ȣ / ���� / ȸ��������

*/

create table member_tbl(
    member_id       varchar2(20),
    member_pw       varchar2(30),
    member_name     varchar2(30),
    member_age      number,
    member_phone    char(13),
    member_gender   char(3),
    enroll_date     date
);



select * from member_tbl;
/*
insert : ���̺� �����͸� �����ϴ� ����(���� �� ���̺��� row�� �þ)
*/
/*
insert ���� 1
insert into ���̺��̸�(�÷��̸�1, �÷��̸�2, �÷��̸�3....) values(��1,��2,��3......);
*/
insert into 
    member_tbl(member_id, member_pw, member_name, member_age, member_phone, member_gender, enroll_date)
    values('user01','1234','����1',20,'010-1111-1111','��',sysdate);

--�÷����� �߸��Ǹ� �ٸ� ������ �Էµ�
insert into
    member_tbl(member_pw, member_id, member_name, member_age, member_phone, member_gender, enroll_date) --�÷����� �߸��Ǹ� �ٸ� ������ �Էµ�
    values('user02','1222','����2',30,'010-2222-2222','��',sysdate);
--�÷��� ������ ������� ���� �����ߵ�(null�� �Էµ�) / �װ� �ƴ� �÷��̳� ������� �ϳ��� ������ ����
insert into
    member_tbl(member_id, member_pw, member_age, member_phone, member_gender, enroll_date)
    values('user03','3333','����#',33,'010-3333-3333','��',sysdate);
    
/*
insert ����2
insert into ���̺��̸� values(��1,��2,��3....)
*/
insert into member_tbl
    values('user04','4444','����4',44,'010-4444-4444','��',sysdate+1);

-- �÷����� ������� �ȳְ� �����Ϸ��� ���� / null���� �־���� �� 
insert into member_tbl
    values('user05','5555',null,55,'010-5555-5555','��',sysdate);


/*
update : ���̺� ��ϵ� �ʵ��� ���� �����ϴ� ����
    -> ������Ʈ ���� �� row���� ��ȭ ����

update ����
update ���̺��̸� set �÷��̸�1 = ������1, �÷��̸�2 = ������2, �÷��̸�3 = ������3.... where ���ǽ�
*/

select * from member_tbl;

update member_tbl set member_name = '����3' where member_id='user03';

update member_tbl set member_name='����5', member_age=50, member_gender='��' where member_id='user05';

update member_tbl set member_age = 30 where member_gender='��';  --where ���ǿ� �´� ���� ��� ����

update member_tbl set member_age = 30;

commit;
rollback;

-- �ι�° �÷��� �Է� �� ,�� ������ ����
update member_tbl set member_pw = '1222', member_id='user02', where member_name = '����2'; 


/*
delete : ���̺��� ���� �����ϴ� ����
    -> ���� �� ���̺��� ���� ����
delete ����
deleet from ���̺��̸� where ���� �࿡ ���� ���� / Ư�� �÷��� �ప�� ����� ������ update�� null�� �Է�
*/

delete from member_tbl where member_id = 'user04';
delete from member_tbl where member_id = 'user03';
select sysdate from dual;
delete from member_tbl where to_char(enroll_date, 'yyyy-mm-dd') = to_char(sysdate, 'yyyy-mm-dd') -- ��¥Ÿ�Գ��� �����Ϸ��� to_char�� �ٲ㼭 ���ָ� ��

select member_id, enroll_date, , sysdate, sysdate - enroll_date  from member_tbl;

commit;


    
-- ==============================   ===========================

CREATE TABLE BRANDS(
    BRAND_ID    NUMBER          PRIMARY KEY,
    BRAND_NAME  VARCHAR2(100)   NOT NULL
);
select * from brands;

----sequence ����/����
--alter sequence test_seq2
--        --start with 5               �� ���� �Ұ�. �ʿ��ϸ� ���� �� ���� ������ ��
--increment by 5             
--maxvalue 50                
--nocycle 
--nocache
--;

CREATE SEQUENCE SEQ_BRAND_ID
START WITH 100
INCREMENT BY 100
MAXVALUE 500
NOCYCLE;

alter sequence seq_brand_id
--increment by 100
maxvalue 1000;
--nocycle;

INSERT INTO BRANDS VALUES (SEQ_BRAND_ID.NEXTVAL, '�Ｚ');
INSERT INTO BRANDS VALUES (SEQ_BRAND_ID.NEXTVAL, '����');

select * from brands;

create table shop_buy2(
    buy_no          number              primary key,
    buy_propuct     varchar2(30)        not null,
    buy_id          varchar2(20)        references shop_member(user_id),    -- �ܷ�Ű �÷����� ����
    buy_date        date
);
    
alter table PRODUCTS
drop constraint SYS_C007172;

alter table products
add constraint products_foreign_key(brand_id);
--
--alter table test_tbl
--add constraint test_tbl_unq unique(test_data2);
alter table test_tbl
SYS_C007172
CREATE TABLE PRODUCTS(
    PRODUCT_NO      NUMBER          PRIMARY KEY,
    PRODUCT_NAME    VARCHAR2(20)    NOT NULL,
    PRODUCT_PRICE   NUMBER          NOT NULL,
    BRAND_CODE      NUMBER REFERENCES   BRANDS,
    SERIAL_NO       VARCHAR2(100),
    SOLD_OUT        CHAR(1) DEFAULT 'N' CHECK(SOLD_OUT IN ('Y', 'N'))
);
select * from products;  

select
    uc.constraint_name,
    uc.constraint_type,
    uc.table_name,
    ucc.column_name,
    uc.search_condition
from user_constraints uc
join user_cons_columns ucc on (uc.constraint_name = ucc.constraint_name)
where uc.table_name = 'PRODUCTS';

alter table products
drop constraint SYS_C007170;

alter table PRODUCTS
add constraint PRODUCTS_chcek CHECK(SOLD_OUT IN ('Y', 'N');

CREATE SEQUENCE SEQ_PRODUCT_NO
START WITH 1
INCREMENT BY 1
MAXVALUE 10000
NOCYCLE;
    
INSERT INTO PRODUCTS VALUES (SEQ_PRODUCT_NO.NEXTVAL, '������S8', 800000, 100, 'S8','Y');
INSERT INTO PRODUCTS VALUES (SEQ_PRODUCT_NO.NEXTVAL, '������S9', 900000, 100, 'S9','N');
INSERT INTO PRODUCTS VALUES (SEQ_PRODUCT_NO.NEXTVAL, '������S10', 1000000, 100, 'S10','N');
INSERT INTO PRODUCTS VALUES (SEQ_PRODUCT_NO.NEXTVAL, '������9S', 900000, 200, '9S','N');
INSERT INTO PRODUCTS VALUES (SEQ_PRODUCT_NO.NEXTVAL, '������10S', 1000000, 200, '10S','N');   
    
select * from products; 

SELECT PRODUCT_NAME, PRODUCT_PRICE, BRAND_NAME, SOLD_OUT  
FROM PRODUCTS JOIN BRANDS ON (BRAND_ID = BRAND_CODE);    
    
    
--alter table test_tbl
--drop constraint SYS_C007053; --SYS_C007053�� ���� �������� �̸�
--
--alter table test_tbl
--modify test_data null;      -- not null ���������� �����Ҷ��� modify 
    