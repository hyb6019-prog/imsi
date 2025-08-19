/*
테이블 생성 구문
create table 테이블이름(컬럼이름1 자료형(크기), 컬럼이름2 자료형(크기).......)

create table 테이블이름(
    컬럼이름1       자료형(크기),
    컬럼이름2       자료형(크기),
    ...
)
-> 컬럼이름,테이블이름 작성 시 카멜표기법, 파스칼표기법 모두 사용 불가능 ->대/소문자 구분x
phoneNumber
PhoneNumber
->단어와 단어 사이를 언더스코어(_)로 연결 : 스네이크 표기법
phone_number

*/


/*
회원정보를 저장하는 테이블
    -> 아이디 / 비밀번호 / 이름 / 나이 / 전화번호 / 성별 / 회원가입일
     테이블 이름 : member_tbl, member, user_tbl.....
        -> user_tbl
     항목             컬럼이름              자료형
     아이디 ->        user_id              문자열-> varchar2(20)
     비밀번호 ->      user_pw              문자열-> varchar2(30) / char(60) --char(60)은 나중에 암호화할때 사용
     이름 ->          user_name            문자열-> varchar2(30)
     나이 ->          user_age             숫자  -> number
     전화번호 ->      user_phone           문자열-> char(13)
     성별 ->          user_gender          문자열-> char(6)
     회원가입일       user_date             날짜-> date       
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

-- 컬럼에 설명 달아주기
comment on column user_tbl.user_id is '회원 아이디';     
comment on column user_tbl.user_pw is '회원 비밀번호';   


insert into 
    member_tbl(member_id, member_pw, member_name, member_age, member_phone, member_gender, enroll_date)
    values('user01','1234','유저1',20,'010-1111-1111','남',sysdate);
    
    
insert into
    user_tbl(user_id, user_pw, user_name, user_age, user_phone, user_gender, user_date)
    values('user01','1111','유저01',10,'010-1111-1111','남',sysdate);
insert into
    user_tbl(user_id, user_pw, user_name, user_age, user_phone, user_gender, user_date)
    values('user02','2222','유저02',20,'010-2222-2222','여',sysdate);
insert into
    user_tbl(user_id, user_pw, user_name, user_age, user_phone, user_gender, user_date)
    values('user03','3333','유저03',30,'010-3333-3333','남',sysdate);
insert into
    user_tbl(user_id, user_pw, user_name, user_age, user_phone, user_gender, user_date)
    values('user04','4444','유저04',40,'010-4444-4444','여',sysdate);
insert into
    user_tbl(user_id, user_pw, user_name, user_age, user_phone, user_gender, user_date)
    values('user05','5555','유저05',50,'010-5555-5555','남',sysdate);
insert into
    user_tbl(user_id, user_pw, user_name, user_age, user_phone, user_gender, user_date)
    values('user06','6666','유저06',60,'010-6666-6666','여',sysdate);

/*
not null : 해당 컬럼에 null을 허용하지 않음 / 반드시 데이터를 기록해야만 하는 경우 사용
        -> insert/update 시 null 을 사용할 수 없음
*/

create table user_tbl_nn(
    user_id     varchar2(20)    not null,       -- not null 제약조건은 컬럼레벨에서만 설정 가능
    user_pw     varchar2(30)    not null,
    user_name   varchar2(30),
    user_age    number,
    user_phone  char(13)        not null,
    user_gender char(6),
    user_date   date
);
select * from user_tbl_nn;
insert into user_tbl_nn values('user01','1111','유저1',22,'010-1111-1111','남자',sysdate);
insert into user_tbl_nn values('user02','2222','유저2',33,'010-2222-2222','여자',null); --not null이 없는 컬럼에만 null값 입력됨
update user_tbl_nn set user_pw = null where user_id='user01';  --x


/*
unique(unique key) : 컬럼 입력값에 대해서 중복을 제한하는 제약조건
*/

create table user_tbl_uk1(
    user_id     varchar2(20)    unique,         --컬럼레벨에서 제약조건 설정
    user_pw     varchar2(30),
    user_name   varchar2(30),
    user_age    number,
    user_phone  char(13)        unique,         --컬럼레벨에서 제약조건 설정
    user_gender char(6),
    user_date   date
);
select * from user_tbl_uk1;
insert into user_tbl_uk1 values('user01','1111','유저1',20,'010-1111-1111','여자',sysdate);
insert into user_tbl_uk1 values('user02','2222','유저2',22,'010-2222-2222','여자',sysdate);
insert into user_tbl_uk1 values('user03','3333','유저3',23,'010-3333-3333','여자',sysdate);
update user_tbl_uk1 set user_phone = '010-2222-2222' where user_id='user01';  --x



create table user_tbl_uk2(
    user_id     varchar2(20), 
    user_pw     varchar2(30),
    user_name   varchar2(30),
    user_age    number,
    user_phone  char(13),
    user_gender char(6),
    user_date   date,
    unique(user_id),              --테이블레벨에서 제약조건 설정
    unique(user_phone)
);
select * from user_tbl_uk2;
insert into user_tbl_uk2 values('user01','1111','유저1',20,'010-1111-1111','여자',sysdate);
insert into user_tbl_uk2 values('user02','2222','유저2',22,'010-2222-2222','여자',sysdate);
insert into user_tbl_uk2 values('user03','3333','유저3',23,'010-2222-2222','여자',sysdate); --삽입x
insert into user_tbl_uk2 values('user04','4444','유저4',24,null,'여자',sysdate); --unique를 걸어도 null 입력됨
insert into user_tbl_uk2 values('user05','5555','유저5',25,null,'여자',sysdate); --null은 중복되어도 가능함


create table user_tbl_uk3(
    user_id     varchar2(20), 
    user_pw     varchar2(30),
    user_name   varchar2(30),
    user_age    number,
    user_phone  char(13),
    user_gender char(6),
    user_date   date,
    unique(user_id, user_phone)             ----테이블 레벨에서 제약조건 설정 / Id와 phone이 동시에 겹쳤을 경우 / 복합키
);
select * from user_tbl_uk3;
insert into user_tbl_uk3 values('user01','1111','유저1',20,'010-1111-1111','여자',sysdate);
insert into user_tbl_uk3 values('user02','2222','유저2',22,'010-2222-2222','여자',sysdate);
insert into user_tbl_uk3 values('user03','3333','유저3',23,'010-2222-2222','여자',sysdate); -- phone만 중복이므로 삽입
insert into user_tbl_uk3 values('user02','3333','유저3',23,'010-2222-2222','여자',sysdate); -- id,phone 모두 중복이므로 삽입x
insert into user_tbl_uk3 values('user02','3333','유저3',23,'010-1111-1111','여자',sysdate); -- id는 중복이지만 phone은 중복이 아니므로 삽입



/*
primary key : 테이블에서 한 행의 정보를 구분하기 위한 식별자역할(제약조건은 not null + unique)
            -> 한 테이블당 1개만 설정 가능
*/

create table user_tbl_pk1(
    user_id     varchar2(20)    primary key,    --컬럼레벨에서 설정 
    user_pw     varchar2(30),
    user_name   varchar2(30),
    user_age    number,
    user_phone  char(13),
    user_gender char(6),
    user_date   date
);
select * from user_tbl_pk1;
insert into user_tbl_pk1 values('user01','1111','유저1',20,'010-1111-1111','여자',sysdate);
insert into user_tbl_pk1 values('user02','2222','유저2',22,'010-2222-2222','여자',sysdate);
insert into user_tbl_pk1 values('user02','3333','유저3',23,'010-3333-3333','여자',sysdate);


create table user_tbl_pk2(
    user_id     varchar2(20), 
    user_pw     varchar2(30),
    user_name   varchar2(30),
    user_age    number,
    user_phone  char(13),
    user_gender char(6),
    user_date   date,
    primary key(user_id)       --테이블 레벨에서 설정
);
select * from user_tbl_pk2;
insert into user_tbl_pk2 values('user01','1111','유저1',20,'010-1111-1111','여자',sysdate);
insert into user_tbl_pk2 values('user02','2222','유저2',22,'010-2222-2222','여자',sysdate);
insert into user_tbl_pk2 values('user02','3333','유저3',23,'010-3333-3333','여자',sysdate);


create table user_tbl_pk3(
    user_id     varchar2(20), 
    user_pw     varchar2(30),
    user_name   varchar2(30),
    user_age    number,
    user_phone  char(13),
    user_gender char(6),
    user_date   date,
    primary key(user_id, user_pw)       --테이블 레벨에서 설정(복합키 설정)
);

/*
외래키 설정을 위한 가정
1) 쇼핑몰 데이터베이스 구현
2) 이 쇼핑몰은 반드시 회원가입을 하고 로그인을 한 상태로만 물건구입 가능
3) 구매자정보는 회원 테이블에서 가져올 수 있어야 함
*/
create table shop_member(
    user_no     number          primary key,
    user_id     varchar2(20)    not null unique,        --여러 제약조건을 한번에 넣으려면 띄어쓰기로 구분
    user_pw     varchar2(30)    not null,
    user_name   varchar2(30) 
);
select * from shop_member;
insert into shop_member values(1,'user01','1111','유저1');
insert into shop_member values(2,'user02','2222','유저2');
insert into shop_member values(3,'user03','3333','유저3');

create table shop_buy1(
    buy_no          number              primary key,
    buy_propuct     varchar2(30)        not null,
    buy_id          varchar2(20),
    buy_date        date
);
select * from shop_buy1;
insert into shop_buy1 values(1,'아이폰','user01',sysdate);
insert into shop_buy1 values(2,'에어컨','user00',sysdate);  --아이디로 샵멤버 조회가 안되는 문제

create table shop_buy2(
    buy_no          number              primary key,
    buy_propuct     varchar2(30)        not null,
    buy_id          varchar2(20)        references shop_member(user_id),    -- 외래키 컬럼레벨 설정
    buy_date        date
);
select * from shop_buy2;
select user_id from shop_member;
insert into shop_buy2 values(1,'아이폰','user01',sysdate);
insert into shop_buy2 values(2,'에어컨','user00',sysdate);     -- 참조 무결성이 깨짐

create table shop_buy3(
    buy_no          number              primary key,
    buy_propuct     varchar2(30)        not null,
    buy_id          varchar2(20),
    buy_date        date,
    foreign key(buy_id) references shop_member(user_id)     -- 외래키 테이블레벨 설정
);
select * from shop_buy3;
insert into shop_buy3 values(1,'아이폰','user01',sysdate);
insert into shop_buy3 values(2,'에어컨','user00',sysdate); 

create table shop_buy4(
    buy_no          number              primary key,
    buy_propuct     varchar2(30)        not null,
    user_no         number references shop_member(user_no),
    buy_date        date
);
insert into shop_buy4 values(1,'아이폰','1',sysdate);
select * from shop_member;
select * from shop_buy4;

create table shop_buy5( --unique or primary 가 아닌 컬럼을 참조해서 생성불가
    buy_no          number              primary key,
    buy_propuct     varchar2(30)        not null,
    user_no         number references shop_member,        --primary key를 참조하는 경우 컬럼이름 생략 가능
    buy_date        date
);
select * from shop_member;
select * from shop_buy5;
insert into shop_buy5 values(1,'모니터','2',sysdate);
delete from shop_member where user_no=3;        --잘 지워짐
delete from shop_member where user_no=2;        --x 참조하고 있어서 못지움 / 참조하고 있는 구매목록을 지운 후 제거해야 됨
delete from shop_buy5 where user_no=2;
delete from shop_member where user_no=1;        --x 

select
    buy_no, buy_product, user_name, buy_date
from shop_buy2
join shop_member on (buy_id = user_id);

--참조키 지


create table shop_buy6(
    buy_no          number              primary key,
    buy_propuct     varchar2(30)        not null,
    user_no         number references shop_member on delete set null, --primary key를 참조하는 경우 컬럼이름 생략 가능 / 부모데이터가 사라지면 자식데이터는 null값으로 바뀜
    buy_date        date
);
select * from shop_member;
select * from shop_buy6;
insert into shop_buy6 values(1,'모니터','1',sysdate);
insert into shop_buy6 values(2,'과자','2',sysdate);
delete from shop_member where user_no=2;


create table shop_buy7(
    buy_no          number              primary key,
    buy_propuct     varchar2(30)        not null,
    user_no         number references shop_member on delete cascade, --primary key를 참조하는 경우 컬럼이름 생략 가능 / 부모데이터를 참조하고 있던 자식데이터까지 모두 삭제
    buy_date        date
);
select * from shop_member;
select * from shop_buy7;
insert into shop_buy7 values(1,'모니터','1',sysdate);
insert into shop_buy7 values(2,'과자','2',sysdate);

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
    user_gender char(6) check(user_gender in ('남자', '여자')),
    user_date   date
);
select * from user_tbl_check;
insert into user_tbl_check values('user01','1111','유저1',20,'010-1111-1111','남자',sysdate);
insert into user_tbl_check values('user01','1111','유저1',20,'010-1111-1111','여자',sysdate);
insert into user_tbl_check values('user01','1111','유저1',20,'010-1111-1111','남',sysdate);    -- 설정된 문자가 아닌 다른 문자를 입력하면 삽입x


--default : insert 작업 시 기본값 설정가능

create table user_tbl_default(
    user_id     varchar2(20), 
    user_pw     varchar2(30),
    user_name   varchar2(30),
    user_age    number default 0 not null, -- not null이 걸려있을때 default 사용(insert시에만)
    user_phone  char(13),
    user_gender char(6),
    user_date   date
);
select * from user_tbl_default;
insert into 
    user_tbl_default(user_id,user_pw,user_name,user_age,user_phone,user_gender,user_date)
    values('user01','1111','유저1',20,'010-1111-1111','남자',sysdate);
insert into 
    user_tbl_default(user_id,user_pw,user_name,user_age,user_phone,user_date)
    values('user02','2222','유저2',22,'010-2222-2222',sysdate);       --성별 컬럼과 값을 모두 제거 후 삽입하면 null값으로 입력됨
insert into 
    user_tbl_default(user_id,user_pw,user_name,user_date)
    values('user03','3333','유저3',sysdate);             -- 나이,전화번호,성별 제거 후 삽입 / 전화번호와 성별은 null값 입력, age는 디폴트값을 0으로 입력해서 0삽입, 디폴트는 insert에만 작동됨
insert into
   user_tbl_default values('user04','4444','유저1','010-4444-4444','여자',sysdate); --컬럼없는 insert문으로 삽입시 age 디폴트값 입력안됨, 삽입도 안됨 / 컬럼없는 insert문은 컬럼과 동일한 순서로 값을 입력해주는 방법이기 때문
insert into
   user_tbl_default values('user04','4444','유저1',default,'010-4444-4444','여자',sysdate); -- insert 한정으로 default를 값으로 입력가능

-- create로 만든 테이블은 '정의어'





-- select문을 이용해서 테이블 복사
-- 컬럼이름, 자료형(길이), 조회된 데이터까지 복사
-- 제약조건은 복사x(not null만 복사)
create table user_tbl_copy
as                          --uk2 테이블 복사 방법
select * from user_tbl_uk2; 

select * from user_tbl_copy;

create table user_tbl_copy1
as                          
select * from user_tbl_uk2 where 1=0; 

select * from user_tbl_uk2 where 1=0;  -- 한줄도 출력하지 않는 조건식 / 테이블의 구조만 복사하고 밸류값은 필요없을때


--Alter : DDL의 한 종류로 CREATE로 만들어진 내용을 수정할 때 사용
select * from user_tbl_copy;

-- 컬럼추가
alter table user_tbl_copy
add (user_addr varchar2(50));   -- 데이터는 일단 null로 세팅됨

alter table user_tbl_copy
add (test_col varchar2(20) default 'test' not null);  --not null을 설정해서 추가하면 안됨 / 기본값으로 null값을 넣어야 하므로 이럴때 default를 씀

-- 컬럼 수정
alter table user_tbl_copy
modify user_name varchar2(60);

alter table user_tbl_copy
modify user_gender char(3); -- 기존 데이터 수정없이 3바이트로 바꿔지지 않음. 기존 데이터를 먼저 다 바꾸고 난 후 작업해야 됨
update user_tbl_copy set user_gender='여';   --char타입은 '여___'로 어차피 6바이트를 잡아서 수정이 안됨
alter table user_tbl_copy
modify user_gender varchar2(3); --그래서 varchar2로 먼저 바꾼 후 수정해야됨

-- 컬럼 삭제
alter table user_tbl_copy
drop column test_col;   
--만약 외래키로 참조하고 있는 경우 컬럼삭제 안됨
--casecade를 사용해 강제로 제약조건 삭제는 가능


-- 컬럼 이름 변경
alter table user_tbl_copy
rename column user_addr to user_address;

-- 테이블에 적용되어 있는 제약조건 확인하는 문법
select
    uc.constraint_name,
    uc.constraint_type,
    uc.table_name,
    ucc.column_name,
    uc.search_condition
from user_constraints uc
join user_cons_columns ucc on (uc.constraint_name = ucc.constraint_name)
where uc.table_name = 'ALTER_TEST'; --테이블명은 반드시 대문자

create table test_tbl(
    test_no         number          primary key,
    test_data       varchar2(20)    unique,
    test_data2      varchar2(30)    not null,
    test_data3      varchar2(20)    
);

-- 제약조건 추가
alter table test_tbl
add constraint test_tbl_unq unique(test_data2);

alter table test_tbl
modify test_data constraint test_data_nn not null; --not null 제약조건은 modify로 추가


-- 제약조건 삭제
alter table test_tbl
drop constraint SYS_C007053; --SYS_C007053은 기존 제약조건 이름

alter table test_tbl
modify test_data null;      -- not null 제약조건은 삭제할때도 modify


-- 제약조건 이름 변경
alter table test_tbl
rename constraint SYS_C007052 to test_tbl_pk;


select * from test_tbl;
-- 테이블 이름 변경
alter table test_tbl
rename to alter_test;

select * from alter_test;

select * from user_tables;
COMMIT;



select * from alter_test;
-- 테이블 삭제
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
drop table drop_test1 cascade constraints; --다른 테이블에서 참고하고 있을때 제약조건 모두 날려버리고 테이블 지우는 방법


















