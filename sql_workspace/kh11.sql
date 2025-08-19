--=====OBJECT=====================================================


select * from employee;
--copy
create table emp_copy
as
select emp_id, emp_name, email, phone from employee;

select * from emp_copy; --테이블처럼 활용

--view
create view emp_view
as
select emp_id, emp_name, email, phone from employee; --select에 salary*12와 같은 값을 조작한 컬럼을 넣을 수는 없음

select * from emp_view; --테이블처럼 활용, 특정한 사용자에게 컬럼을 일부만 보여주기 위해(관리용)

update employee set phone = '01011111111' where emp_id=219; -- view 생성 후 원본 테이블을 수정해도 view에는 반영이 됨. copy에는 반영이 안됨
update emp_view set phone = '01022222222' where emp_id=220; -- view 에 업데이트해도 원본 테이블까지 수정(상호연관)

--select에 salary*12와 같은 값을 조작한 컬럼을 넣을 수는 없음
--view의 컬럼과 테이블의 컬럼이 다이렉트로 연결된 경우만 사용 가능(편집이 된 경우는 연동불가)

create or replace view emp_view --없으면 만들고 있으면 덮어쓰기
as
select emp_id, emp_name, email, phone, salary from employee; --salary 컬럼을 추가
select * from emp_view;

create force view emp_view -- 기본 테이블이 존재하지 않더라도 일단 뷰를 생성 / 기본값은 noforce
as
select emp_id, emp_name, email, phone, salary from employee;

select * from user_tables;  --view로 구성된 것

--SEQUENCE-------------------
--순차적으로 정수 값을 자동으로 생성하는 객체로, 자동번호 발생기의 역할

--create sequence 시퀀스이름
--start with 숫자
--increament by 숫자
--maxvalue 숫자 | momaxvalue 최대값 지정
--minvalue 숫자 | momaxvalue 최소값 지정
--cycle | nocycle (시퀀스 최대값 도달시 cycle은 기본 start with로 되돌아가고 nocycle은 에러)
--cache | nocache

create sequence test_seq; --모든 옵션 포함해서 생성하는 법

create sequence test_seq
start with 10               --번호 시작 숫자
increment by 10             --번호 생성시 번호 증가 폭
maxvalue 100                --번호 생성 시 최대 숫자
cycle
nocache
;
-- currval : 시퀀스의 현재 숫자를 확인(시퀀스이름.currval)
-- nextval : 시퀀스에게 다음 숫자를 달라고 요청
-- 주의사항은 반드시 nextval을 한번 사용한 후 currval을 요청
select test_seq.nextval from dual;  -- +increament by 번호
select test_seq.currval from dual;  -- 현재 increament by 번호 값 확인

create sequence test_seq2
start with 5               
increment by 5             
maxvalue 50                
nocycle --maxvalue 값을 넘겨서 nextval을 입력하면 에러가 남
nocache
;

select test_seq2.nextval from dual;  
select test_seq2.currval from dual;

--sequence 수정/삭제
alter sequence test_seq2
        --start with 5               는 변경 불가. 필요하면 삭제 후 새로 만들어야 됨
increment by 5             
maxvalue 50                
nocycle 
nocache
;

create table user_tbl(
    user_no         number          primary key,
    user_id         varchar2(20)    unique not null,
    user_name       varchar2(30)    not null
);
select * from user_tbl;
insert into user_tbl values(1, 'user01', '유저1');
insert into user_tbl values(2, 'user03', '유저2');
delete from user_tbl;

create sequence user_seq
start with 10
increment by 1
nocycle;

insert into user_tbl values(user_seq.nextval, 'user01', '유저1');
insert into user_tbl values(user_seq.nextval, 'user00', '유저3');
insert into user_tbl values(user_seq.nextval, 'user03', '유저2');
insert into user_tbl values(user_seq.nextval, 'user03', '유저4'); --id에 유니크 제약조건이 있어서 생성 안됨
insert into user_tbl values(user_seq.nextval, 'user33', '유저4'); --조회하면 시퀀스넘버가 13이 아닌 14번이 생성됨, 위에서 한번 시도를 해서 카운트 되었기 때문
insert into user_tbl values(user_seq.nextval, 'user04', '유저5'); --13에 채워지는 것이 15로 생성됨, 넥스트밸류값을 넣기 때문

--INDEX-------------------
--sql 명령문의 처리 속도를 향상시키기 위해서 컬럼에 대해 생성하는 오라클 객체로 내부구조는 b*트리 형식으로 구성
--장점 : 검색속도가 빨라지고 시스템에 걸리는 부하를 줄여서 시스템 전체 성능 향상
--단점 
--인데스를 위한 추가 저장공간 필요
--인덱스 생성 시간 필요
--데이터 변경작업이 자주일어나는 경우 오히려 성능 저하 발생(자주 데이터 재배치를 해야 하므로)

select      --chun으로 접속
    student_no,
    student_name,
    department_name,
    student_ssn,
    student_address,
    entrance_date,
    professor_name,
    round((select avg(point) from tb_grade g where g.student_no = s.student_no),1) point_avg
from TB_STUDENT s
left join tb_department using(department_no)
left join TB_PROFESSOR on (coach_professor_no = professor_no);

create index grade_student_no_idx on tb_grade(student_no);  --index 생성
drop index grade_student_no_idx;

-- SYNONYM(동의어)  ----------- kh로 전환
-- 비공개 동의어
--권한을 나만 허용
-- 공개 동의어
--권한을 전체 설정

select * from employee;
create synonym emp for employee;        --sysnonym 생성, kh계정에서만 생성 권한을 부여, 비공개 동의어
select * from emp;

                    ----dml_test 전환
select * from employee;     --권한이 없으면 조회 오류
select * from kh.employee;  --권한을 부여받은 후 테이블이 있는 계정인 kh.을 붙여줘야 조회 가능 
select * from emp;          --kh에서 설정한 동의어 조회 안됨

select *from kh.department; --테이블마다 권한 부여 받아야됨
select * from dept;         --어드민에서 ublic으로 모든 계정 동의어 사용 가능하게 설정한 후 조회 가능
select * from dept;         --어드민에서 revoke로 kh.department 조회 권환 회수하면 동의어로 조회 안됨

drop synonym emp;   --kh계정으로 만들었으므로 kh에서 드랍해야 됨
drop public synonym dept;   --어드민계정에서 동의어 만들었으므로 admin에서 드랍

--======= 데이터베이스 정규화 ===========
-- 한 컬럼에 여러 데이터를 한번에 저장하면 데이터 crud가 불편
-- 제1 정규화 : 컬럼이 원자값만 갖도록 설계 / 컬럼 하나에 밸류값이 2개 이상이면 1개로 나누고 row를 추가하는 방법
--각 테이블은 독립적인 데이터로 구성 -> 테이블의 기본키(primary key)는 반드시 1개 row를 지칭할 수 있어야 함

--====데이터베이스 모델링=======
--






