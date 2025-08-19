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

insert into member_tbl values('user01',1111,'유저01','010-1111-1111',11,'남',sysdate);
insert into member_tbl values('user02',2222,'유저02','010-2222-2222',22,'여',sysdate);
insert into member_tbl values('user03',3333,'유저03','010-3333-3333',33,'남',sysdate);
insert into member_tbl values('user04',4444,'유저04','010-4444-4444',44,'여',sysdate);
insert into member_tbl values('user05',5555,'유저05','010-5555-5555',55,'남',sysdate);
insert into member_tbl values('user09',9999,'유저09','010-9999-9999',99,'남',sysdate);
commit;

select * from member_tbl where MEMBER_NAME like '%유저%';
--update runningman set pass = 9999 where nickname = '중기친구';
update member_tbl set MEMBER_PW = 2222 where member_id = 'user01';

select * from member_tbl where member_id = '%user%';
select * from member_tbl where member_name like '%유저%';

select count(*) cnt from member_tbl where member_id = 'user01';

--member_tbl에서 삭제하면 삭제회원정보를 저장하는 테이블
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











