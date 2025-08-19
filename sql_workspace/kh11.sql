--=====OBJECT=====================================================


select * from employee;
--copy
create table emp_copy
as
select emp_id, emp_name, email, phone from employee;

select * from emp_copy; --���̺�ó�� Ȱ��

--view
create view emp_view
as
select emp_id, emp_name, email, phone from employee; --select�� salary*12�� ���� ���� ������ �÷��� ���� ���� ����

select * from emp_view; --���̺�ó�� Ȱ��, Ư���� ����ڿ��� �÷��� �Ϻθ� �����ֱ� ����(������)

update employee set phone = '01011111111' where emp_id=219; -- view ���� �� ���� ���̺��� �����ص� view���� �ݿ��� ��. copy���� �ݿ��� �ȵ�
update emp_view set phone = '01022222222' where emp_id=220; -- view �� ������Ʈ�ص� ���� ���̺���� ����(��ȣ����)

--select�� salary*12�� ���� ���� ������ �÷��� ���� ���� ����
--view�� �÷��� ���̺��� �÷��� ���̷�Ʈ�� ����� ��츸 ��� ����(������ �� ���� �����Ұ�)

create or replace view emp_view --������ ����� ������ �����
as
select emp_id, emp_name, email, phone, salary from employee; --salary �÷��� �߰�
select * from emp_view;

create force view emp_view -- �⺻ ���̺��� �������� �ʴ��� �ϴ� �並 ���� / �⺻���� noforce
as
select emp_id, emp_name, email, phone, salary from employee;

select * from user_tables;  --view�� ������ ��

--SEQUENCE-------------------
--���������� ���� ���� �ڵ����� �����ϴ� ��ü��, �ڵ���ȣ �߻����� ����

--create sequence �������̸�
--start with ����
--increament by ����
--maxvalue ���� | momaxvalue �ִ밪 ����
--minvalue ���� | momaxvalue �ּҰ� ����
--cycle | nocycle (������ �ִ밪 ���޽� cycle�� �⺻ start with�� �ǵ��ư��� nocycle�� ����)
--cache | nocache

create sequence test_seq; --��� �ɼ� �����ؼ� �����ϴ� ��

create sequence test_seq
start with 10               --��ȣ ���� ����
increment by 10             --��ȣ ������ ��ȣ ���� ��
maxvalue 100                --��ȣ ���� �� �ִ� ����
cycle
nocache
;
-- currval : �������� ���� ���ڸ� Ȯ��(�������̸�.currval)
-- nextval : ���������� ���� ���ڸ� �޶�� ��û
-- ���ǻ����� �ݵ�� nextval�� �ѹ� ����� �� currval�� ��û
select test_seq.nextval from dual;  -- +increament by ��ȣ
select test_seq.currval from dual;  -- ���� increament by ��ȣ �� Ȯ��

create sequence test_seq2
start with 5               
increment by 5             
maxvalue 50                
nocycle --maxvalue ���� �Ѱܼ� nextval�� �Է��ϸ� ������ ��
nocache
;

select test_seq2.nextval from dual;  
select test_seq2.currval from dual;

--sequence ����/����
alter sequence test_seq2
        --start with 5               �� ���� �Ұ�. �ʿ��ϸ� ���� �� ���� ������ ��
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
insert into user_tbl values(1, 'user01', '����1');
insert into user_tbl values(2, 'user03', '����2');
delete from user_tbl;

create sequence user_seq
start with 10
increment by 1
nocycle;

insert into user_tbl values(user_seq.nextval, 'user01', '����1');
insert into user_tbl values(user_seq.nextval, 'user00', '����3');
insert into user_tbl values(user_seq.nextval, 'user03', '����2');
insert into user_tbl values(user_seq.nextval, 'user03', '����4'); --id�� ����ũ ���������� �־ ���� �ȵ�
insert into user_tbl values(user_seq.nextval, 'user33', '����4'); --��ȸ�ϸ� �������ѹ��� 13�� �ƴ� 14���� ������, ������ �ѹ� �õ��� �ؼ� ī��Ʈ �Ǿ��� ����
insert into user_tbl values(user_seq.nextval, 'user04', '����5'); --13�� ä������ ���� 15�� ������, �ؽ�Ʈ������� �ֱ� ����

--INDEX-------------------
--sql ��ɹ��� ó�� �ӵ��� ����Ű�� ���ؼ� �÷��� ���� �����ϴ� ����Ŭ ��ü�� ���α����� b*Ʈ�� �������� ����
--���� : �˻��ӵ��� �������� �ý��ۿ� �ɸ��� ���ϸ� �ٿ��� �ý��� ��ü ���� ���
--���� 
--�ε����� ���� �߰� ������� �ʿ�
--�ε��� ���� �ð� �ʿ�
--������ �����۾��� �����Ͼ�� ��� ������ ���� ���� �߻�(���� ������ ���ġ�� �ؾ� �ϹǷ�)

select      --chun���� ����
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

create index grade_student_no_idx on tb_grade(student_no);  --index ����
drop index grade_student_no_idx;

-- SYNONYM(���Ǿ�)  ----------- kh�� ��ȯ
-- ����� ���Ǿ�
--������ ���� ���
-- ���� ���Ǿ�
--������ ��ü ����

select * from employee;
create synonym emp for employee;        --sysnonym ����, kh���������� ���� ������ �ο�, ����� ���Ǿ�
select * from emp;

                    ----dml_test ��ȯ
select * from employee;     --������ ������ ��ȸ ����
select * from kh.employee;  --������ �ο����� �� ���̺��� �ִ� ������ kh.�� �ٿ���� ��ȸ ���� 
select * from emp;          --kh���� ������ ���Ǿ� ��ȸ �ȵ�

select *from kh.department; --���̺��� ���� �ο� �޾ƾߵ�
select * from dept;         --���ο��� ublic���� ��� ���� ���Ǿ� ��� �����ϰ� ������ �� ��ȸ ����
select * from dept;         --���ο��� revoke�� kh.department ��ȸ ��ȯ ȸ���ϸ� ���Ǿ�� ��ȸ �ȵ�

drop synonym emp;   --kh�������� ��������Ƿ� kh���� ����ؾ� ��
drop public synonym dept;   --���ΰ������� ���Ǿ� ��������Ƿ� admin���� ���

--======= �����ͺ��̽� ����ȭ ===========
-- �� �÷��� ���� �����͸� �ѹ��� �����ϸ� ������ crud�� ����
-- ��1 ����ȭ : �÷��� ���ڰ��� ������ ���� / �÷� �ϳ��� ������� 2�� �̻��̸� 1���� ������ row�� �߰��ϴ� ���
--�� ���̺��� �������� �����ͷ� ���� -> ���̺��� �⺻Ű(primary key)�� �ݵ�� 1�� row�� ��Ī�� �� �־�� ��

--====�����ͺ��̽� �𵨸�=======
--






