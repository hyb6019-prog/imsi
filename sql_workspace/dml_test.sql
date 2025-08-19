/*
    회원정보를 저장하는 테이블
    아이디 / 비밀번호 / 이름 / 나이 / 전화번호 / 성별 / 회원가입일

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
insert : 테이블에 데이터를 삽입하는 구문(동작 시 테이블의 row가 늘어남)
*/
/*
insert 문범 1
insert into 테이블이름(컬럽이름1, 컬럼이름2, 컬럼이름3....) values(값1,값2,값3......);
*/
insert into 
    member_tbl(member_id, member_pw, member_name, member_age, member_phone, member_gender, enroll_date)
    values('user01','1234','유저1',20,'010-1111-1111','남',sysdate);

--컬럼순서 잘못되면 다른 순서로 입력됨
insert into
    member_tbl(member_pw, member_id, member_name, member_age, member_phone, member_gender, enroll_date) --컬럼순서 잘못되면 다른 순서로 입력됨
    values('user02','1222','유저2',30,'010-2222-2222','여',sysdate);
--컬럼이 빠지면 밸류값이 같이 빠져야됨(null값 입력됨) / 그게 아닌 컬럼이나 밸류값이 하나씩 빠지면 오류
insert into
    member_tbl(member_id, member_pw, member_age, member_phone, member_gender, enroll_date)
    values('user03','3333','유저#',33,'010-3333-3333','여',sysdate);
    
/*
insert 문법2
insert into 테이블이름 values(값1,값2,값3....)
*/
insert into member_tbl
    values('user04','4444','유저4',44,'010-4444-4444','남',sysdate+1);

-- 컬럼없이 밸류값도 안넣고 삽입하려면 오류 / null값을 넣어줘야 됨 
insert into member_tbl
    values('user05','5555',null,55,'010-5555-5555','여',sysdate);


/*
update : 테이블에 기록된 필드의 값을 수정하는 구분
    -> 업데이트 수행 시 row수는 변화 없음

update 문법
update 테이블이름 set 컬럼이름1 = 수정값1, 컬럼이름2 = 수정값2, 컬럼이름3 = 수정값3.... where 조건식
*/

select * from member_tbl;

update member_tbl set member_name = '유저3' where member_id='user03';

update member_tbl set member_name='유저5', member_age=50, member_gender='남' where member_id='user05';

update member_tbl set member_age = 30 where member_gender='여';  --where 조건에 맞는 행은 모두 수정

update member_tbl set member_age = 30;

commit;
rollback;

-- 두번째 컬럼값 입력 후 ,를 찍으면 오류
update member_tbl set member_pw = '1222', member_id='user02', where member_name = '유저2'; 


/*
delete : 테이블의 행을 삭제하는 구문
    -> 수행 시 테이블의 행이 감소
delete 문법
deleet from 테이블이름 where 지울 행에 대한 조건 / 특정 컬럼의 행값만 지우고 싶으면 update로 null값 입력
*/

delete from member_tbl where member_id = 'user04';
delete from member_tbl where member_id = 'user03';
select sysdate from dual;
delete from member_tbl where to_char(enroll_date, 'yyyy-mm-dd') = to_char(sysdate, 'yyyy-mm-dd') -- 날짜타입끼리 연산하려면 to_char로 바꿔서 해주면 됨

select member_id, enroll_date, , sysdate, sysdate - enroll_date  from member_tbl;

commit;


    
-- ==============================   ===========================

CREATE TABLE BRANDS(
    BRAND_ID    NUMBER          PRIMARY KEY,
    BRAND_NAME  VARCHAR2(100)   NOT NULL
);
select * from brands;

----sequence 수정/삭제
--alter sequence test_seq2
--        --start with 5               는 변경 불가. 필요하면 삭제 후 새로 만들어야 됨
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

INSERT INTO BRANDS VALUES (SEQ_BRAND_ID.NEXTVAL, '삼성');
INSERT INTO BRANDS VALUES (SEQ_BRAND_ID.NEXTVAL, '애플');

select * from brands;

create table shop_buy2(
    buy_no          number              primary key,
    buy_propuct     varchar2(30)        not null,
    buy_id          varchar2(20)        references shop_member(user_id),    -- 외래키 컬럼레벨 설정
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
    
INSERT INTO PRODUCTS VALUES (SEQ_PRODUCT_NO.NEXTVAL, '갤럭시S8', 800000, 100, 'S8','Y');
INSERT INTO PRODUCTS VALUES (SEQ_PRODUCT_NO.NEXTVAL, '갤럭시S9', 900000, 100, 'S9','N');
INSERT INTO PRODUCTS VALUES (SEQ_PRODUCT_NO.NEXTVAL, '갤럭시S10', 1000000, 100, 'S10','N');
INSERT INTO PRODUCTS VALUES (SEQ_PRODUCT_NO.NEXTVAL, '아이폰9S', 900000, 200, '9S','N');
INSERT INTO PRODUCTS VALUES (SEQ_PRODUCT_NO.NEXTVAL, '아이폰10S', 1000000, 200, '10S','N');   
    
select * from products; 

SELECT PRODUCT_NAME, PRODUCT_PRICE, BRAND_NAME, SOLD_OUT  
FROM PRODUCTS JOIN BRANDS ON (BRAND_ID = BRAND_CODE);    
    
    
--alter table test_tbl
--drop constraint SYS_C007053; --SYS_C007053은 기존 제약조건 이름
--
--alter table test_tbl
--modify test_data null;      -- not null 제약조건은 삭제할때도 modify 
    