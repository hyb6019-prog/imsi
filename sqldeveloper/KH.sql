/*
select * --조회하고 싶은 컬럼
from 테이블이름;
*/
--employee 테이블의 모든 컬럼을 조회
select * from EMPLOYEE;
select emp_name, email, phone --조회하고 싶은 컬럼만 입력
from employee;

select *
from employee
where emp_name = '유재식';  --where 조건 설정

select *                --실행순서3
from employee           --실행순서1
where dept_code= 'D9';  --실행순서2

--======실습 예제==========
-- 1. JOB테이블에서 JOB_NAME의 정보만 출력되도록 하시오.
select JOB_NAME
from JOB;

-- 2. DEPARTMENT테이블의 내용 전체를 출력하는 SELECT문을 작성하시오.
select *
from department;

-- 3. EMPLOYEE 테이블에서 이름(EMP_NAME),이메일(EMAIL),전화번호(PHONE),고용일(HIRE_DATE)만 출력하시오.
select * from employee;
select emp_name, email, phone, hire_date
from employee;

-- 4. EMPLOYEE 테이블에서 고용일(HIRE_DATE) 이름(EMP_NAME),월급(SALARY)를 출력하시오.
select * from employee;
select EMP_NAME, SALARY, HIRE_DATE
from employee;

-- 5. EMPLOYEE 테이블에서 월급(SALARY)이 2,500,000원이상인 사람의 EMP_NAME 과 SAL_LEVEL을 출력하시오
select * from employee;
select emp_name, sal_level
from employee
where salary >= 2500000;

--select 시 산술연산 가능
select emp_name, salary*12 from employee; --샐러리에 12곱하기(연봉)

--select 결과 컬럼에 별칭 지정
select emp_name as 이름, salary as "월급(원)", salary*12 sal -- (특수문자) 없으면 따옴표 생략 가능 / as도 생략가능
from employee;

select *from employee;
select emp_name, salary, salary + salary*bonus "보너스포함 급여" --null값이 있는 값은 계산이 null로만 출력됨
from employee;

select emp_name, salary||'원','원' --|| or연산자를 붙이면 값에 붙어서 출력됨 /'원'만 적은 것은 컬럼값으로 강제출력 
from employee;

--distinct : 조회 결과에서 중복된 row를 삭제
select DISTINCT emp_name, job_code from employee; --emp_name을 같이 써버리면 중복값이 제거가 안됨(이름은 중복된 값이 없으므로)



-- 2.연산자 ------------------------------------------------------------------------------------------------------

-- 논리연산자
-- 부서코드(dept_code)가 D6이고 급여(salary)가 2,00,000보다 많이받는 직원의 이름, 부서코드, 급여 조회
select emp_name, dept_code, salary
from employee
where dept_code='D6' and salary > 2000000; -- and연산자
select emp_name, dept_code, salary
from employee
where dept_code='D6' or salary > 2000000; --or연산자

-- between and -> 비교하려는 값이 지정한 범위에 포함되면 true를 리턴하는 연산자
-- 급여를 3500000 ~ 6000000인 직원의 이름, 급여
select emp_name, salary
from employee
where salary >= 3500000 and salary <= 6000000;

select emp_name, salary
from employee
where salary BETWEEN 3500000 and 6000000; --between을 사용하면 비교하는 숫자포함(이상, 이하)

-- like : 비교하려는 값이 지정한 패턴과 일치하면 true를 리턴하는 연산자
-- 와일드카드 : 아무거나 대체해서 사용 할 수 있는 문자
--  _ : 아무거나 한글자를 대체
--  % : 0글자 이상 대체
-- 성이 '전'씨인 직원의 이름과 급여 조회
select emp_name, salary
from employee
where emp_name like '전__'; -- '=' 대신 like / 전으로 시작하는 3글자만 검색 가능

select emp_name, salary
from employee
where emp_name like '전%'; -- __대신 %사용 / 전 뒤에 몇글자가 있건 상관없이 검색 가능

-- 이메일 중 '_'앞의 문자가 3자리인 직원의 이름, 이메일을 조회
select emp_name, email
from employee
where email like '___#_%' escape '#'; -- #뒤에 있는 _글자는 like 특수문자 아님

-- not like
select emp_name, salary
from employee
where emp_name not like '전%'; --전 으로 시작하지 않는 이름 검색

--=====실습=====
-- 1. EMPLOYE 테이블에서 이름 끝이 연으로 끝나는 사원의 이름을 출력하시오
select * from employee;
select emp_name
from employee
where emp_name like '__연';
-- 2. EMPLOYEE 테이블에서 전화번호 처음 3자리가 010이 아닌 사원의 이름, 전화번호를 출력하시오.
select * from employee;
select emp_name , phone
from EMPLOYEE
where phone not like '010%';
-- 3. EMPLOYEE 테이블에서 메일주소의 's'가 들어가면서, DEPT_CODE가 D9 또는 D6이고, 월급이 270만원이상인 사원의 전체 정보를 출력하시오.
select * from employee;
select *
from employee
-- and와 or 중 and가 먼저 연산되므로 ()로 먼저 계산되게 표시
where email like '%s%' and (dept_code = 'D9' or dept_code = 'D6') and salary >= 2700000; 

-- 보너스를 받지않는 직원의 이름, 급여, 보너스 
select emp_name, salary, bonus
from employee
where bonus is not null; -- null값을 출력하려면 '=' 대신 is null / is not null
-- 부서가 없는 직원의 이름, 부서코드, 급여
select emp_name, dept_code, salary
from employee
where dept_code is null;

-- in (or 연산자를 여러번 써야될때) : 하나의 컬럼을 여러값과 일치하는지 비교할때 사용하는 연산자(or로 연결될 때만)
-- 부서코드가 D6이거나 D9이거나 D8인 직원의 이름, 급여, 부서코드
select emp_name, salary, dept_code
from employee
where dept_code in ('D6','D9','D8'); -- in은 여러 or를 하나로 작동하게 해서 연산작업시 우선순위 선정하기 편해짐

select emp_name, salary, dept_code
from employee
where dept_code not in ('D6','D9','D8'); -- 여러 != 를 not in 하나로 묶음

-- dual 테이블: 오라클에서 제공하는 테스트용 테이블(데이터 저장 x)
-- sysdate : 현재시간을 오라클의 date타입으로 가져오는 명령어
select emp_name, salary, '원', sysdate from employee;
select sysdate from dual; -- 오늘날짜
select sysdate, sysdate + 3, sysdate -3, sysdate + 0.25 from dual; -- sysdate + 1 하루 뒤 / - 도 가능 / 0.25는 6시간

select (sysdate+1) - sysdate
from dual;

select emp_name, hire_date, sysdate - hire_date from employee;

-- 연봉이 5000만원 이상인 직원의 이름,급여
select emp_name, salary
from employee
where salary*12 >= 50000000; -- where 에서도 연산 가능