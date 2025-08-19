/*
select * --��ȸ�ϰ� ���� �÷�
from ���̺��̸�;
*/
--employee ���̺��� ��� �÷��� ��ȸ
select * from EMPLOYEE;
select emp_name, email, phone --��ȸ�ϰ� ���� �÷��� �Է�
from employee;

select *
from employee
where emp_name = '�����';  --where ���� ����

select *                --�������3
from employee           --�������1
where dept_code= 'D9';  --�������2

--======�ǽ� ����==========
-- 1. JOB���̺��� JOB_NAME�� ������ ��µǵ��� �Ͻÿ�.
select JOB_NAME
from JOB;

-- 2. DEPARTMENT���̺��� ���� ��ü�� ����ϴ� SELECT���� �ۼ��Ͻÿ�.
select *
from department;

-- 3. EMPLOYEE ���̺��� �̸�(EMP_NAME),�̸���(EMAIL),��ȭ��ȣ(PHONE),�����(HIRE_DATE)�� ����Ͻÿ�.
select * from employee;
select emp_name, email, phone, hire_date
from employee;

-- 4. EMPLOYEE ���̺��� �����(HIRE_DATE) �̸�(EMP_NAME),����(SALARY)�� ����Ͻÿ�
select * from employee;
select EMP_NAME, SALARY, HIRE_DATE
from employee;

-- 5. EMPLOYEE ���̺��� ����(SALARY)�� 2,500,000���̻��� ����� EMP_NAME �� SAL_LEVEL�� ����Ͻÿ�
select * from employee;
select emp_name, sal_level
from employee
where salary >= 2500000;

--select �� ������� ����
select emp_name, salary*12 from employee; --�������� 12���ϱ�(����)

--select ��� �÷��� ��Ī ����
select emp_name as �̸�, salary as "����(��)", salary*12 sal -- (Ư������) ������ ����ǥ ���� ���� / as�� ��������
from employee;

select *from employee;
select emp_name, salary, salary + salary*bonus "���ʽ����� �޿�" --null���� �ִ� ���� ����� null�θ� ��µ�
from employee;

select emp_name, salary||'��','��' --|| or�����ڸ� ���̸� ���� �پ ��µ� /'��'�� ���� ���� �÷������� ������� 
from employee;

--distinct : ��ȸ ������� �ߺ��� row�� ����
select DISTINCT emp_name, job_code from employee; --emp_name�� ���� ������� �ߺ����� ���Ű� �ȵ�(�̸��� �ߺ��� ���� �����Ƿ�)
select DISTINCT job_code from employee;


-- 2.������ ------------------------------------------------------------------------------------------------------

-- ��������
-- �μ��ڵ�(dept_code)�� D6�̰� �޿�(salary)�� 2,00,000���� ���̹޴� ������ �̸�, �μ��ڵ�, �޿� ��ȸ
select emp_name, dept_code, salary
from employee
where dept_code='D6' and salary > 2000000; -- and������
select emp_name, dept_code, salary
from employee
where dept_code='D6' or salary > 2000000; --or������

-- between and -> ���Ϸ��� ���� ������ ������ ���ԵǸ� true�� �����ϴ� ������
-- �޿��� 3500000 ~ 6000000�� ������ �̸�, �޿�
select emp_name, salary
from employee
where salary >= 3500000 and salary <= 6000000;

select emp_name, salary
from employee
where salary BETWEEN 3500000 and 6000000; --between�� ����ϸ� ���ϴ� ��������(�̻�, ����)

-- like : ���Ϸ��� ���� ������ ���ϰ� ��ġ�ϸ� true�� �����ϴ� ������
-- ���ϵ�ī�� : �ƹ��ų� ��ü�ؼ� ��� �� �� �ִ� ����
--  _ : �ƹ��ų� �ѱ��ڸ� ��ü
--  % : 0���� �̻� ��ü
-- ���� '��'���� ������ �̸��� �޿� ��ȸ
select emp_name, salary
from employee
where emp_name like '��__'; -- '=' ��� like / ������ �����ϴ� 3���ڸ� �˻� ����

select emp_name, salary
from employee
where emp_name like '��%'; -- __��� %��� / �� �ڿ� ����ڰ� �ְ� ������� �˻� ����

-- �̸��� �� '_'���� ���ڰ� 3�ڸ��� ������ �̸�, �̸����� ��ȸ
select emp_name, email
from employee
where email like '___#_%' escape '#'; -- #�ڿ� �ִ� _���ڴ� like Ư������ �ƴ�

-- not like
select emp_name, salary
from employee
where emp_name not like '��%'; --�� ���� �������� �ʴ� �̸� �˻�

--=====�ǽ�=====
-- 1. EMPLOYE ���̺��� �̸� ���� ������ ������ ����� �̸��� ����Ͻÿ�
select * from employee;
select emp_name
from employee
where emp_name like '__��';
-- 2. EMPLOYEE ���̺��� ��ȭ��ȣ ó�� 3�ڸ��� 010�� �ƴ� ����� �̸�, ��ȭ��ȣ�� ����Ͻÿ�.
select * from employee;
select emp_name , phone
from EMPLOYEE
where phone not like '010%';
-- 3. EMPLOYEE ���̺��� �����ּ��� 's'�� ���鼭, DEPT_CODE�� D9 �Ǵ� D6�̰�, ������ 270�����̻��� ����� ��ü ������ ����Ͻÿ�.
select * from employee;
select *
from employee
-- and�� or �� and�� ���� ����ǹǷ� ()�� ���� ���ǰ� ǥ��
where email like '%s%' and (dept_code = 'D9' or dept_code = 'D6') and salary >= 2700000; 

-- ���ʽ��� �����ʴ� ������ �̸�, �޿�, ���ʽ� 
select emp_name, salary, bonus
from employee
where bonus is not null; -- null���� ����Ϸ��� '=' ��� is null / is not null
-- �μ��� ���� ������ �̸�, �μ��ڵ�, �޿�
select emp_name, dept_code, salary
from employee
where dept_code is null;

-- in (or �����ڸ� ������ ��ߵɶ�) : �ϳ��� �÷��� �������� ��ġ�ϴ��� ���Ҷ� ����ϴ� ������(or�� ����� ����)
-- �μ��ڵ尡 D6�̰ų� D9�̰ų� D8�� ������ �̸�, �޿�, �μ��ڵ�
select emp_name, salary, dept_code
from employee
where dept_code in ('D6','D9','D8'); -- in�� ���� or�� �ϳ��� �۵��ϰ� �ؼ� �����۾��� �켱���� �����ϱ� ������

select emp_name, salary, dept_code
from employee
where dept_code not in ('D6','D9','D8'); -- ���� != �� not in �ϳ��� ����

-- dual ���̺�: ����Ŭ���� �����ϴ� �׽�Ʈ�� ���̺�(������ ���� x)
-- sysdate : ����ð��� ����Ŭ�� dateŸ������ �������� ��ɾ�
select emp_name, salary, '��', sysdate from employee;
select sysdate from dual; -- ���ó�¥
select sysdate, sysdate + 3, sysdate -3, sysdate + 0.25 from dual; -- sysdate + 1 �Ϸ� �� / - �� ���� / 0.25�� 6�ð�

select (sysdate+1) - sysdate
from dual;

select emp_name, hire_date, sysdate - hire_date from employee;

-- ������ 5000���� �̻��� ������ �̸�,�޿�
select emp_name, salary
from employee
where salary*12 >= 50000000; -- where ������ ���� ����

-- ����
-- order by
-- select�� ����� ���� ������ �� �� ��� / �ۼ���ġ�� select�� ���� ������, ��������� ���� ������

/*
        ������ ���� ���
        nember          ����(char,varchar2)       DATE                null
ASC -- ������->ū��          ������(��~��)         ������->������       null�� ���� �Ʒ�         ��������
DESC --ū��->������          ��������(��~��)       ������->������       nulld�� ���� ����        ��������

*/

select *                 --3
from employee            --1
--where                  --2
-- �����ϰ� ���� �÷� �Է� / �⺻ asc ���·� asc�� ���� ���� / 
--nulls first : null���� ���� ���� ��� / nulls last : null���� ���� �������� ���
--order by dept_code asc nulls first;     --4 
order by dept_code asc, emp_name desc; -- �ڵ�� ���� �� ���� ������ �̸����� ����


select *
from employee
order by 1 asc;

select emp_name, salary, dept_code
from employee
order by 1 asc; -- ���ı��� �÷��� �Է��Ҷ� ��ȸ��� �������� ��ȸ�� �÷��� ��ġ�� �Է��ص� ��

select emp_name as �̸�, salary �޿�, dept_code �μ��ڵ�
from employee
order by �̸� asc;    -- select�� �� ���� ���·� ���� / ���ڴ�� ����������� ���� ����

select emp_name as �̸�, salary �޿�, dept_code �μ��ڵ�, job_code 
from employee
order by job_code asc;      --��ȸ����� ���Ե��� ���� �÷��� ���ı������� ��� ����(���̺� �����ϸ�)

--======�ǽ�����========
--1. �Ի����� 5�� �̻�, 10�� ������ ������ �̸�, �ֹι�ȣ, �޿�, �Ի����� �̸������� �˻��Ͽ���
select * from employee;
select emp_name, emp_no, salary, hire_date
from employee
where (sysdate-hire_date)/365 between 5 and 10
order by emp_name;

--2. �ټӳ���� 10�� �̻��� �������� �˻��Ͽ�
--   ��� ����� �̸�, �޿�, �ټӳ���� �ټӳ���� ������������ �����Ͽ� ����Ͽ���
--   ��, �޿��� 50% �λ�� �޿��� ��µǵ��� �Ͽ���.
select emp_name, salary*1.5, (sysdate-hire_date) / 365 �ټӳ��
from employee
where (sysdate-hire_date)/365 >= 10
order by 3;


--3. �Ի��� 99/01/01 ~ 10/01/01 �� ��� �߿��� �޿��� 2000000�� ������ ����� �̸�, �ֹι�ȣ, �̸���, ����ȣ, �޿�
select emp_name, emp_no, email, phone, salary
from employee
where hire_date between '99/01/01' and '10/01/01' and salary <= 2000000;

--4.
select emp_name, emp_no, salary, dept_code
from employee
where emp_no like '___4__-2%' and salary between 2000000 and 3000000
order by emp_no desc;


--3. �Լ�--------------------------------------------------------------------------------

-- ����ó���Լ� --

-- length
-- length(�÷� | string) : �־��� �÷� �Ǵ� ���� ����(���� ����)�� ��ȯ�ϴ� �Լ�
-- lengthb(�÷�| string) : �־��� �÷� �Ǵ� ���� ����(byte)�� ��ȯ�ϴ� �Լ�
select 
    emp_name, length(emp_name), lengthb(emp_name), email, length(email), lengthb(email)
from employee;

--instr(string1, string2, number1, number2) : ã�� ���ڰ� ������ġ���� ������ Ƚ����ŭ ��Ÿ�� ��ġ�� ��ȯ
select instr('Hello World Hi High', 'H',1,1) from dual;
select instr('Hello World Hi High', 'H',1,2) from dual;
select instr('Hello World Hi High', 'H',1,3) from dual;
select instr('Hello World Hi High', 'H',1,4) from dual; -- 4��° H�� �����Ƿ� ��°��� 0
select instr('Hello World Hi High', 'H',2,1) from dual; -- ã�� �����ϴ°� e���� ����
select instr('Hello World Hi High', 'H',2,2) from dual;
select instr('Hello World Hi High', 'H',2,3) from dual;
select instr('Hello World Hi High', 'H',-1,1) from dual; --������ġ�� -���� ���� / ������ �˻�
select instr('Hello World Hi High', 'H',-1,2) from dual;
select instr('Hello World Hi High', 'H',-1,3) from dual;


-- LPAD / RPAD : �־��� �÷� | ���ڿ��� ������ ���ڿ��� ����/�����ʿ� ���ٿ��� ���� n(byte��)�� ���ڿ��� ��ȯ
-- LPAD(string, n(byte��), ä�﹮��)

select email, lengthb(email), lpad(email, 20, '#'), rpad(email, 10, '#')
from employee;

-- trim : �־��� �÷��̳� ���ڿ��� ��/�� ���ʿ� �ִ� ������ ���ڸ� ������ ������
select 'zzzzKHzzzz' from dual;
select trim(leading 'z' from 'zzzzKHzzzz') from dual;   --���� ����
select trim(trailing 'z' from 'zzzzKHzzzz') from dual;  --���� ����
select trim(both 'z' from 'zzzzKHzzzz') from dual;      --���� ����
select trim('z' from 'zzzzKHzzzz') from dual;           --�⺻���� both
select trim('   KH    '), '    KH    'from dual;        --�ƹ��͵� ���������� ���鹮�� ����

-- LTRIM / RTRIM : �־��� �÷��̳� ���ڿ��� ����/�����ʿ��� ������ str�� ���Ե� ��繮�ڸ� ������ �������� ��ȯ
select ltrim('123123KH','123') from dual;
select ltrim('123123123123123123332232323KH','123') from dual; --�ι�° ''�ȿ� �ִ� ����3���� ������ ������� ����
select ltrim('123123123123123123332232323KH','231') from dual;
select rtrim('123123123123123123332232323KH','231') from dual; 

-- substr : �־��� �÷��̳� ���ڿ����� ������ ��ġ���� ������ ������ ���ڿ��� �߶󳻾� �����ϴ� �Լ�
-- substr(string, position, length)
select substr('showmethemoney',5,2) from dual;
select substr('showmethemoney',7) from dual; --length ���ڸ� �Է����� ������ 7������ ������
select substr('showmethemoney',-8,3) from dual;

select emp_name, substr(emp_name,1,1), substr(emp_name,2)
from employee;

--lower(�ҹ���) / upper(�빮��) / initcap(�� �ܾ ù���ڸ� �빮��)

select lower('Welcom to My World') from dual;
select upper('Welcom to My World') from dual;
select initcap(lower('Welcom to My World')) from dual;

-- concat : �÷� �Ǵ� ���ڿ��� 2�� ���޹޾Ƽ� �ϳ��� ��ģ �� ����
select concat('�����ٶ�','abcd') from dual;
select '�����ٶ�'||'abcd'||1234 from dual;  --concat ���ٴ� ���Ῥ���ڰ� �� ����

--replace : �÷� �Ǵ� ���ڿ��� �� �� �޾Ƽ� ���� �� ����(�ϳ��� ���, �ϳ��� ������ ��)
select email, replace(email, 'kh.or.kr', 'iei.co.kr') from employee;




-- ���� ó�� �Լ� --

-- abs : ���밪 ����
select abs(10) from dual;
select abs(-10) from dual;

-- mod : �Է¹��� ���� ���� �������� ����
select 10/3 from dual; --�ڹٿ� �ٸ��� 3.333333333���� ����
select mod(10,3) from dual;
-- rouund/floor/ceil(�ݿø�/����/�ø�)

select round(126.556) from dual;
select round(126.456,3) from dual; --3��° ���ڴ� �Ҽ��� �ڸ����� ���ϴ� ����
select round(126.456,2) from dual;
select round(126.456,1) from dual;
select round(126.456,0) from dual;
select round(126.456,-1) from dual; --���� �������� �ݴ��
select round(126.456,-2) from dual;

select floor(123.456), ceil(123.456) from dual;




-- ��¥ ó�� �Լ� --

-- sysdate : �ý��ۿ� ����Ǿ��ִ� ���� ��¥�� ��ȯ�ϴ� �Լ� / �ð����� ����
select sysdate, current_date, localtimestamp, current_timestamp from dual;

-- months_between : ��¥ �ΰ��� ���޹޾�, �������� ���������� �����ϴ� �Լ�
select emp_name, hire_date, months_between(sysdate, hire_date) �ٹ������� from employee;

-- add_months : ���ڷ� ���޹��� ��¥�� ���޹��� ����ŭ �������� ���ؼ� ��¥�� ����
select emp_name, hire_date, add_months(hire_date, 3) from employee;

-- next_day : ���ڷ� ���޹��� ��¥�� ���ڷ� ���޹��� ���� �� ���� ����� ���������� ���
select sysdate, next_day(sysdate, '������') from dual;  --�̷� �������θ� ���
select sysdate, next_day(sysdate, '2') from dual;       --���ڷ� ���� Ư���� 1=�Ͽ��� ~ 7=�����

-- last_day : ���ڷ� ���޹��� ��¥�� ���� ���� ������ ��¥�� ���ؼ� ����
select sysdate, last_day(sysdate) from dual; -- �� ���� ������ ��¥

-- extract : ��¥�����Ϳ��� ��, ��, �� ������ ����
select sysdate, extract(year from sysdate), extract(month from sysdate), extract(day from sysdate) from dual;

-- ����ȯ �Լ� --

select * from employee where emp_id=205;
select 100+'100' from dual;
select 100+'100a' from dual;  --a�� ����ȯ �ȵ�
desc employee;

-- to_char : ��¥�� �Ǵ� ������ �����͸� ���������� ��ȯ�Ҷ� ���
select sysdate from dual;
select to_char(sysdate, 'yyyy-mm-dd') from dual;
select to_char(sysdate, 'yyyy/mm/dd') from dual;
select to_char(sysdate, 'yyyy/mm/dd/day') from dual;
select to_char(sysdate, 'yyyy/month/dd/day') from dual;
select to_char(sysdate, 'yyyy/mm/dd hh:mi:ss') from dual;
select to_char(sysdate, 'yyyy/mm/dd hh24:mi:ss') from dual;
select to_char(sysdate, 'yyyy/mm/dd hh"��"mi"��"ss"��"') from dual;
select to_char(sysdate, 'yyyy/mm/dd pmhh12:mi:ss') from dual;

-- ���� -> ����         1,000,000
--9�� ���� �Ⱦ��� �κ� ©�󳻱�, 0���� ���� �Ⱦ��� �κе� ǥ��
select to_char(1000000, '999,999,999'), to_char(1000000, '000,000,000'), to_char(1000000, '000,000') from dual; 
--L�� ���̸� ���� ���� ��ȭ������ ǥ�õ� / �Ҽ����� ǥ�� ����
select emp_name, salary, to_char(salary, '999,999,999'), to_char(salary, 'L999,999,999.999') 
from employee;

-- to_date : ���ڳ� ������ �����͸� ��¥�����ͷ� ��ȯ
select to_date(2000010113, 'yyyymmddhh24') from dual;
select to_char(to_date(2000010113,'yyyymmddhh24'),'yyyy-mm-dd hh24:mi:ss'), to_char(sysdate, 'yyyy-mm-dd hh:mi:ss') from dual;

-- to_number : ������ �����͸� ���ڷ� ��ȯ
select to_number('1,000,000', '9,999,999') from dual;



-- ��Ÿ �Լ� --

-- nvl : null�� �Ǿ��ִ� �÷��� ���� ������ ���� Ȥ�� ���ڷ� �����Ͽ� ����
-- ���ʽ��� �Ű������� ���ڿ��� ������ ���� / ���� �Է� ������ Ÿ������ �־���� ��
select emp_name, salary, bonus, nvl(bonus, 0), salary + salary*bonus, salary + salary*nvl(bonus,0)
from employee;

select emp_name, nvl(dept_code, 0) from employee; -- ���⼭ 0�� ����'0'���� ����ȯ�� �ڵ����� �Ǿ� �Էµ�
select emp_name, nvl(dept_code, '�μ�����') from employee;

-- decode : �����Լ� -> �������� ��쿡 ������ �� �� �ִ� ����� ���� -> switch�� ��� -> ��ġ�ϴ� ��
-- decode(ǥ����, ����1, ���1, ����2, ���2, ����3, ���3,....)
select emp_name, emp_no, decode(substr(emp_no,8,1), '1','����','2','����', '3','����','4','����') as ����
from employee;

-- case : �����Լ� -> �������� ��쿡 ������ �� �� �ִ� ����� ���� -> if~else if -> ���� ����
select emp_name, emp_no,
    case
        when substr(emp_no,8,1) = 1 or substr(emp_no,8,1) = 3 then '����' --when ������ Ʈ���϶� then �ڿ� ���
        when substr(emp_no,8,1) in (2,4) then '����'
        else '�ش�Ǵ°� ������ �̰� ����'
    end
    as ����
from employee;

-- �׷��Լ� : �ϳ��̻��� ���� �׷����� ���� �����Ͽ� ����, ��� ���� �ϳ��� �÷����� �����ϴ� �Լ�
-- sum : �ش��÷��� ������ �� ���� ���ϴ� �Լ�
select sum(salary) from employee;

select sum(salary) 
from employee 
where dept_code = 'D8'; --���ۼ����� ���� �۵��ؼ� d8�� ����� �������� ����

--���� �������� �޿� ����
select sum(salary) from employee where substr(emp_no, 8, 1) = 1;

-- avg : �ش� �÷��� ������ ����� ���ϴ� �Լ�
select avg(salary) from employee where substr(emp_no, 8, 1) = 1;

-- count : ��ȸ����� ���� ���� ��ȯ�ϴ� �Լ� / � ��ȸ�ƴ��� ǥ�� / row �� 
select count(salary) from employee;
select count(*) from employee;
select count(*) from employee where dept_code='D8';

--min, max : �ش��÷��� �� �� �ּҰ�/�ִ밪�� �����ϴ� �Լ�
select max(salary), min(salary) from employee;

-- �׷��Լ� ��� �� ���� ���� : �׷��Լ��� ����ϸ� �Ϲ��÷��� ���� ��ȸ�� �� ����-> ��ȸ����� row���� �ٸ��⶧����
select emp_name, sum(salary) from employee;     --x
select sum(salary), avg(salary) from employee;  --o

select dept_code from employee;
select count(dept_code) from employee;  --null�� �׷��Լ� ���꿡�� ����

select bonus from employee;
select avg(bonus) from employee;  --null�� ���� ����� ��
select avg(nvl(bonus,0)) from employee; --nvl�� ��������� ����� ��

--== �ǽ� ���� --
--1. ������� �̸���, �̸��� ���̸� ����Ͻÿ�
--�̸�    �̸���     �̸��ϱ���
--ex) ȫ�浿, hong@kh.or.kr
select emp_name, email, length(email)
from employee;

--2. ������ �̸��� �̸��� �ּ� �� ���̵� �κи� ����Ͻÿ�
select emp_name �̸�, rtrim(email, '@kh.or.kr') ���̵�, replace(email, '@kh.or.kr','') ���̵�, substr(email,1,instr(email,'@',1,1)-1)
from EMPLOYEE;


--3. 60����� ������� ���, ���ʽ� ���� ����Ͻÿ�
--�׶� ���ʽ� ���� null�� ��쿡�� 0�̶�� ��µǰ� ����ÿ�
select emp_name ������, substr(emp_no, 1, 2) ���, nvl(bonus, 0) ���ʽ�
from employee
where substr(emp_no,1,1)=6;

--4. '010'�ڵ��� ��ȣ�� ���� �ʴ� ����� ���� ����Ͻÿ� ( �ڿ� ������ ���� ���̽ÿ�)
select * from employee;
select count(*) from employee where dept_code='D8';
select count(*)||'��'
from employee
where phone not like '010%'; 
--where substr(phone, 1,3) != '010';

--5. ������� �Ի����� ����Ͻÿ�
--   ��, �Ʒ��� ���� ��µǵ��� ����� ���ÿ�
--      ������         �Ի���
--   ex)������         2012��12��
--   ex)������         1997�� 3��
select to_char(sysdate, 'yyyy/mm/dd hh"��"mi"��"ss"��"') from dual;

select emp_name, to_char(hire_date, 'fmyyyy"��"mm"��"'), extract(year from hire_date)||'��'||extract(month from hire_date)||'��'
from employee;

--6. ������� �ֹι�ȣ�� ��ȸ�Ͻÿ�.
select email, lengthb(email), lpad(email, 20, '#'), rpad(email, 10, '#')
from employee;
select substr('showmethemoney',7) from dual; --length ���ڸ� �Է����� ������ 7������ ������
select emp_name, rpad(substr(emp_no, 1,8), 14, '*') �ֹι�ȣ
from employee;

--7. ������, �����ڵ�, ����(��) ��ȸ
--   ��, ������ L57,000,000���� ǥ�õǰ� ��
--   ������ ���ʽ�����Ʈ�� ����� 1��ġ �޿���
select emp_name, salary, to_char(salary, '999,999,999'), to_char(salary, 'L999,999,999.999') 
from employee;

select emp_name, job_code, to_char((salary+salary*nvl(bonus,0))*12,'L999,999,999') ����
from employee;

--8. �μ��ڵ尡 D5, D9�� ������ �߿��� 2004�⵵�� �Ի��� ������ �� ��ȸ��.
--   ��� ����� �μ��ڵ� �Ի���
select emp_id, emp_name, dept_code, hire_date
from employee
--where dept_code in ('D5','D9') and hire_date like '04%';
--where substr(hire_date,1,2) = '104'
where extract(year from hire_date) = 2004;

--9. ������, �Ի���, ���ñ����� �ٹ��ϼ� ��ȸ
--   * �ָ� ����, �Ҽ��� �Ʒ� ����
--select emp_name ������, hire_date �Ի���, round(sysdate-hire_date, 0) �ٹ��ϼ�
select emp_name ������, hire_date �Ի���, floor(sysdate-hire_date) �ٹ��ϼ�
from employee;

--10. ��� ������ ���� �� ���� ���� ���̿� ���� ���� ���̸� ���.
--    ���� ����� �� �����̰� �ƴ� �ѱ� ���̷� ���
select to_date(2000010113, 'yyyymmddhh24') from dual;
select substr('showmethemoney',5,2) from dual;
select to_char(sysdate, 'yyyy/mm/dd') from dual;
select sysdate from employee;
select round(126.456,0) from dual;
select max(salary), min(salary) from employee;

--select max(round((to_date(substr(emp_no,1,2), 'yy')-sysdate) / 365)), min(round((to_date(substr(emp_no,1,2), 'yy')-sysdate) / 365))
select 
    extract(year from sysdate) - (1900 + substr(emp_no,1,2))+1 ����,
    extract(year from sysdate) - extract(year from to_date(substr(emp_no,1,2),'rr'))+1 ����,
    to_char(to_date(substr(emp_no,1,2),'rr'),'yyyy-mm-dd hh24:mi:ss')
from employee;


select * from employee;

--11. ȸ�翡�� �߱��� �ؾߵǴ� �μ��� ��ǥ�Ͽ��� �Ѵ�.
select emp_name, emp_no,
    case
        when substr(emp_no,8,1) = 1 or substr(emp_no,8,1) = 3 then '����' --when ������ Ʈ���϶� then �ڿ� ���
        when substr(emp_no,8,1) in (2,4) then '����'
        else '�ش�Ǵ°� ������ �̰� ����'
    end
    as ����
from employee;

select emp_name, dept_code,
case
    when dept_code in ('D5','D6','D9') then '�߱�'
    else '�߱پ���'
end as �߱�����
from employee
order by 2;

--12. �μ��ڵ尡 D5�̸� �ѹ���, D6�̸� ��ȹ��, D9�̸� �����η� ó���Ͻÿ�.
select emp_name, emp_no, decode(substr(emp_no,8,1), '1','����','2','����', '3','����','4','����') as ����
from employee;


select emp_name, dept_code, decode(dept_code, 'D5','�ѹ���','D6','��ȹ��','D9','������') as �μ���
from employee
where dept_code in ('D5','D6','D9');

--13. ������, �μ��ڵ�, �������, ���� ��ȸ
select to_char(sysdate, 'yyyy/mm/dd hh"��"mi"��"ss"��"') from dual;
select to_date(2000010113, 'yyyymmddhh24') from dual;
select emp_name, dept_code, to_char(substr(emp_no,1,6), 'yy"�� "mm"�� "dd"��"');
select
    emp_name,
    dept_code, 
    substr(emp_no,1,2)||'�� '||substr(emp_no,3,2)||'�� '||substr(emp_no,5,2)||'�� ' �������,
--    to_char(to_date(substr(emp_no,1,6),'rrmmdd'),'yy"��" mm"��" dd"��"') �������
    round((sysdate-to_date(substr(emp_no,1,2), 'rr'))/365, 0)+1 ����
from employee
where emp_id not in ('200','201','214');


--14. �������� �Ի��Ϸ� ���� �⵵�� ������, �� �⵵�� �Ի��ο����� ���Ͻÿ�.
select emp_name, hire_date, dept_code from employee;
select count(*) from employee where dept_code='D8';
select * from employee;

select count(extract(year from hire_date))
from employee
where extract(year from hire_date) = '1999';

select * from EMPLOYEE;

    --case ���
select 
    SUM(case when extract(year from hire_date) = 1999 then 1 else 0 end )as "1999��",
    SUM(case when extract(year from hire_date) = 2000 then 1 else 0 end )as "2000��",
    SUM(case when extract(year from hire_date) = 2001 then 1 else 0 end )as "2001��",
    SUM(case when extract(year from hire_date) = 2002 then 1 else 0 end )as "2002��",
    SUM(case when extract(year from hire_date) = 2003 then 1 else 0 end )as "2003��",
    SUM(case when extract(year from hire_date) = 2004 then 1 else 0 end )as "2004��",
    count(*) ��ü������
from employee;

    --decode ���
select
    count(decode(extract(year from hire_date),1999,1)) "1999��",
    count(decode(extract(year from hire_date),2000,1)) "2000��",
    count(decode(extract(year from hire_date),2001,1)) "2001��",
    count(decode(extract(year from hire_date),2002,1)) "2002��",
    count(decode(extract(year from hire_date),2003,1)) "2003��",
    count(decode(extract(year from hire_date),2004,1)) "2004��",
    count(*) ��ü������
from employee;


----- group by ----

/*
select          5
from            1
[where]         2
[group by]      3       -- �׷� ������(�÷�) ����
[having]        4
[order by]      6
*/
select dept_code, sum(salary), floor(avg(salary)), count(*)
from employee
group by dept_code;
-- 
select dept_code, decode(substr(emp_no,8,1),1,'��',2,'��') ����, count(*)�ο��� --count�� �׷���̷� ������ ������ �������� ī��Ʈ
from employee
group by dept_code, decode(substr(emp_no,8,1),1,'��',2,'��')
order by dept_code;

select
    dept_code, floor(avg(salary))
from employee
group by dept_code
having floor(avg(salary)) >= 3000000;

















