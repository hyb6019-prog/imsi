create table user_tbl(
    user_no     number          primary key,
    user_id     varchar2(20)    unique not null,
    user_name   varchar2(30)    not null
);
-- 트랜잭션을 통해서 관리되는 작업은 DML(insert/update/delete)에 해당
insert into user_tbl values(1,'user01','유저1');
insert into user_tbl values(2,'user02','유저2');
insert into user_tbl values(3,'user03','유저3');
select * from user_tbl;

commit; --현재까지 작업한 내용 저장

insert into user_tbl values(4,'user04','유저4');
insert into user_tbl values(5,'user05','유저5');
savepoint spl; -- 임시 저장 포인트 생성
insert into user_tbl values(6,'user06','유저6');

rollback;   -- 가장 최근에 commit한 시점으로 돌아감(데이터상태)

update user_tbl set user_id='user1111' where user_no=1;
delete from user_tbl where user_no=3;

rollback; -- 다시 유저3까지만 입력된 상태로 돌아감
rollback to spl; --임시 저장 포인트된 데이터 상태로 돌아감 , 한번 되돌아가면 다시 저장포인트 생성해야 사용 가능

--USER_TBL에서 데이터가 삭제되면 삭제된 회원 정보를 저장하는 테이블
create table del_user_tbl(
    del_user_id     varchar2(20),
    del_user_data   date
);
select * from user_tbl;
select * from del_user_tbl;
-- user04라는 회원이 회원을 탈퇴하면 -> user_tbl에서 user04를 삭제, del_user_tbl에 해당데이터를 입력
delete from user_tbl where user_id='user06';
insert into del_user_tbl values('user06',sysdate);
insert into del_user_tbl values('user06','adsfasdfasdf'); -- 일부러 오류내기 위해 만든거...
commit; --del과 ins를 세트로 묶어서 작업 후 커밋을 해줘야 오류가 있어도 되돌리기 좋음 둘 중 하나만 하고 커밋하는 순간 다른 하나가 오류 시 난감해짐
rollback;

52
insert into user_tbl values(4,'user04','유저4');



























