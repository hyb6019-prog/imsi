create user DDL_TEST identified by 1234;
grant connect,resource to DDL_TEST;

alter user ddl_test identified by 2345; -- ���� ��ü ��й�ȣ ����;

drop user ddl_test cascade;


create user test_user identified by 1234; -- user ��ü ���� / ������ ������ ���� ������ ���� ����

-- DCL : ������ ��Ʈ�� ��� (grant, revoke)
grant connect, resource to test_user;
revoke connect from test_user;


create user tcl_test identified by 1234;
grant connect, resource to tcl_test;

create user ddl_ex identified by 1234;
grant connect, resource to ddl_ex;

create user chun identified by 1234;
grant connect, resource to chun;

grant create view to kh;           -- conect, resource �ܿ� �並 �����ϱ� ���� ���� �ο����
grant create synonym to kh;        -- synonym ���� ���� �ο�
grant select on kh.employee to dml_test;    --kh ������ employee ���̺��� dml_test���� ��ȸ �����ϰ� ������ �ο�
grant select on kh.department to dml_test;

revoke select on kh.department from dml_test; --��ȸ ���� ȸ��

create public synonym dept for kh.department;     --public�� ���̸� ��� �������� ���Ǿ ���� ����� �� ����, ���� ���Ǿ�
drop public synonym dept;                         --���ΰ������� ���Ǿ� ��������Ƿ� admin���� ���

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
