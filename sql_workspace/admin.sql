create user DDL_TEST identified by 1234;
grant connect,resource to DDL_TEST;

alter user ddl_test identified by 2345; -- 계정 객체 비밀번호 변경;

drop user ddl_test cascade;


create user test_user identified by 1234; -- user 객체 생성 / 생성은 했지만 접속 권한은 주지 않음

-- DCL : 데이터 컨트롤 언어 (grant, revoke)
grant connect, resource to test_user;
revoke connect from test_user;


create user tcl_test identified by 1234;
grant connect, resource to tcl_test;

create user ddl_ex identified by 1234;
grant connect, resource to ddl_ex;

create user chun identified by 1234;
grant connect, resource to chun;

grant create view to kh;           -- conect, resource 외에 뷰를 생성하기 위해 권한 부여방법
grant create synonym to kh;        -- synonym 생성 권한 부여
grant select on kh.employee to dml_test;    --kh 계정의 employee 테이블을 dml_test에서 조회 가능하게 권한을 부여
grant select on kh.department to dml_test;

revoke select on kh.department from dml_test; --조회 권한 회수

create public synonym dept for kh.department;     --public을 붙이면 모든 계정에서 동의어를 같이 사용할 수 있음, 공개 동의어
drop public synonym dept;                         --어드민계정에서 동의어 만들었으므로 admin에서 드랍

create user khtest identified by 1234;
grant connect, resource to khtest;
grant create view to khtest;
grant create synonym to khtest;

create user jdbc_user identified by 1234;
grant connect, resource to jdbc_user;

create user memo identified by 1234;
grant connect, resource to memo;

CREATE USER JDBC_EXAM IDENTIFIED BY 1234;
GRANT CONNECT, RESOURCE TO JDBC_EXAM;

create user memo_exam identified by 9999;
grant connect, resource to memo_exam;

CREATE USER JDBC_EXAM IDENTIFIED BY 1234;
GRANT CONNECT, RESOURCE TO JDBC_EXAM;

CREATE USER EXAM_DB IDENTIFIED BY 1234;
GRANT CONNECT,RESOURCE TO EXAM_DB;

CREATE USER mybatis_test IDENTIFIED BY 1234;
GRANT CONNECT,RESOURCE TO mybatis_test;
