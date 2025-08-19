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

-- 4. EMPLOYEE 테이블에서 고용일(HIRE_DATE) 이름(EMP_NAME),월급(SALARY)를 출력하시오
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
select DISTINCT job_code from employee;


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

-- 정렬
-- order by
-- select된 결과에 대해 정렬을 할 때 사용 / 작성위치는 select의 가장 마지막, 실행순서도 가장 마지막

/*
        데이터 정렬 방법
        nember          문자(char,varchar2)       DATE                null
ASC -- 작은수->큰수          사전순(ㄱ~ㅎ)         빠른날->늦은날       null을 가장 아래         오름차순
DESC --큰수->작은수          사전역순(ㅎ~ㄱ)       늦은날->빠른날       nulld을 가장 위에        내림차순

*/

select *                 --3
from employee            --1
--where                  --2
-- 정렬하고 싶은 컬럼 입력 / 기본 asc 상태로 asc는 생략 가능 / 
--nulls first : null값을 가장 먼저 출력 / nulls last : null값을 가장 마지막에 출력
--order by dept_code asc nulls first;     --4 
order by dept_code asc, emp_name desc; -- 코드로 정렬 후 같은 값끼리 이름으로 정렬


select *
from employee
order by 1 asc;

select emp_name, salary, dept_code
from employee
order by 1 asc; -- 정렬기준 컬럼을 입력할때 조회결과 기준으로 조회된 컬럼의 위치를 입력해도 됨

select emp_name as 이름, salary 급여, dept_code 부서코드
from employee
order by 이름 asc;    -- select가 다 끝난 상태로 정렬 / 숫자대신 별명기준으로 정렬 가능

select emp_name as 이름, salary 급여, dept_code 부서코드, job_code 
from employee
order by job_code asc;      --조회결과에 포함되지 않은 컬럼도 정렬기준으로 사용 가능(테이블에 존재하면)

--======실습예제========
--1. 입사일이 5년 이상, 10년 이하인 직원의 이름, 주민번호, 급여, 입사일을 이름순으로 검색하여라
select * from employee;
select emp_name, emp_no, salary, hire_date
from employee
where (sysdate-hire_date)/365 between 5 and 10
order by emp_name;

--2. 근속년수가 10년 이상인 직원들을 검색하여
--   출력 결과는 이름, 급여, 근속년수를 근속년수가 오름차순으로 정렬하여 출력하여라
--   단, 급여는 50% 인상된 급여로 출력되도록 하여라.
select emp_name, salary*1.5, (sysdate-hire_date) / 365 근속년수
from employee
where (sysdate-hire_date)/365 >= 10
order by 3;


--3. 입사일 99/01/01 ~ 10/01/01 인 사람 중에서 급여가 2000000원 이하인 사람으 이름, 주민번호, 이메일, 폰번호, 급여
select emp_name, emp_no, email, phone, salary
from employee
where hire_date between '99/01/01' and '10/01/01' and salary <= 2000000;

--4.
select emp_name, emp_no, salary, dept_code
from employee
where emp_no like '___4__-2%' and salary between 2000000 and 3000000
order by emp_no desc;


--3. 함수--------------------------------------------------------------------------------

-- 문자처리함수 --

-- length
-- length(컬럼 | string) : 주어진 컬럼 또는 값의 길이(문자 개수)를 반환하는 함수
-- lengthb(컬럼| string) : 주어진 컬럼 또는 값의 길이(byte)를 반환하는 함수
select 
    emp_name, length(emp_name), lengthb(emp_name), email, length(email), lengthb(email)
from employee;

--instr(string1, string2, number1, number2) : 찾는 문자가 지정위치부터 지정한 횟수만큼 나타난 위치를 반환
select instr('Hello World Hi High', 'H',1,1) from dual;
select instr('Hello World Hi High', 'H',1,2) from dual;
select instr('Hello World Hi High', 'H',1,3) from dual;
select instr('Hello World Hi High', 'H',1,4) from dual; -- 4번째 H가 없으므로 출력값은 0
select instr('Hello World Hi High', 'H',2,1) from dual; -- 찾기 시작하는게 e부터 시작
select instr('Hello World Hi High', 'H',2,2) from dual;
select instr('Hello World Hi High', 'H',2,3) from dual;
select instr('Hello World Hi High', 'H',-1,1) from dual; --시작위치는 -음수 가능 / 역방향 검색
select instr('Hello World Hi High', 'H',-1,2) from dual;
select instr('Hello World Hi High', 'H',-1,3) from dual;


-- LPAD / RPAD : 주어진 컬럼 | 문자열에 임의의 문자열을 왼쪽/오른쪽에 덧붙여서 길이 n(byte수)의 문자열을 반환
-- LPAD(string, n(byte수), 채울문자)

select email, lengthb(email), lpad(email, 20, '#'), rpad(email, 10, '#')
from employee;

-- trim : 주어진 컬럼이나 문자열의 앞/뒤 양쪽에 있는 지정한 문자를 제거한 나머지
select 'zzzzKHzzzz' from dual;
select trim(leading 'z' from 'zzzzKHzzzz') from dual;   --앞쪽 제거
select trim(trailing 'z' from 'zzzzKHzzzz') from dual;  --뒤쪽 제거
select trim(both 'z' from 'zzzzKHzzzz') from dual;      --양쪽 제거
select trim('z' from 'zzzzKHzzzz') from dual;           --기본값이 both
select trim('   KH    '), '    KH    'from dual;        --아무것도 쓰지않으면 공백문자 날림

-- LTRIM / RTRIM : 주어진 컬럼이나 문자열의 왼쪽/오른쪽에서 지정한 str에 포함된 모든문자를 제거한 나머지를 반환
select ltrim('123123KH','123') from dual;
select ltrim('123123123123123123332232323KH','123') from dual; --두번째 ''안에 있는 문자3개를 순서에 관계없이 제거
select ltrim('123123123123123123332232323KH','231') from dual;
select rtrim('123123123123123123332232323KH','231') from dual; 

-- substr : 주어진 컬럼이나 문자열에서 지정한 위치부터 지정한 갯수의 문자열을 잘라내어 리턴하는 함수
-- substr(string, position, length)
select substr('showmethemoney',5,2) from dual;
select substr('showmethemoney',7) from dual; --length 숫자를 입력하지 않으면 7번부터 끝까지
select substr('showmethemoney',-8,3) from dual;

select emp_name, substr(emp_name,1,1), substr(emp_name,2)
from employee;

--lower(소문자) / upper(대문자) / initcap(각 단어별 첫글자만 대문자)

select lower('Welcom to My World') from dual;
select upper('Welcom to My World') from dual;
select initcap(lower('Welcom to My World')) from dual;

-- concat : 컬럼 또는 문자열을 2개 전달받아서 하나로 합친 후 리턴
select concat('가나다라','abcd') from dual;
select '가나다라'||'abcd'||1234 from dual;  --concat 보다는 연결연산자가 더 편함

--replace : 컬럼 또는 문자열을 두 개 받아서 변경 후 리턴(하나는 대상, 하나는 변경할 것)
select email, replace(email, 'kh.or.kr', 'iei.co.kr') from employee;




-- 숫자 처리 함수 --

-- abs : 절대값 리턴
select abs(10) from dual;
select abs(-10) from dual;

-- mod : 입력받은 수를 나눈 나머지를 리턴
select 10/3 from dual; --자바와 다르게 3.333333333으로 연산
select mod(10,3) from dual;
-- rouund/floor/ceil(반올림/버림/올림)

select round(126.556) from dual;
select round(126.456,3) from dual; --3번째 숫자는 소수점 자릿수를 정하는 숫자
select round(126.456,2) from dual;
select round(126.456,1) from dual;
select round(126.456,0) from dual;
select round(126.456,-1) from dual; --점을 기준으로 반대로
select round(126.456,-2) from dual;

select floor(123.456), ceil(123.456) from dual;




-- 날짜 처리 함수 --

-- sysdate : 시스템에 저장되어있는 현재 날짜를 반환하는 함수 / 시간까지 포함
select sysdate, current_date, localtimestamp, current_timestamp from dual;

-- months_between : 날짜 두개를 전달받아, 개월수를 숫자형으로 리턴하는 함수
select emp_name, hire_date, months_between(sysdate, hire_date) 근무개월수 from employee;

-- add_months : 인자로 전달받은 날짜에 전달받은 수만큼 개월수를 더해서 날짜를 리턴
select emp_name, hire_date, add_months(hire_date, 3) from employee;

-- next_day : 인자로 전달받은 날짜에 인자로 전달받은 요일 중 가장 가까운 다음요일을 출력
select sysdate, next_day(sysdate, '월요일') from dual;  --미래 방향으로만 계산
select sysdate, next_day(sysdate, '2') from dual;       --숫자로 요일 특정시 1=일요일 ~ 7=토요일

-- last_day : 인자로 전달받은 날짜가 속한 달의 마지막 날짜를 구해서 리턴
select sysdate, last_day(sysdate) from dual; -- 그 달의 마지막 날짜

-- extract : 날짜데이터에서 년, 월, 일 정보만 추출
select sysdate, extract(year from sysdate), extract(month from sysdate), extract(day from sysdate) from dual;

-- 형변환 함수 --

select * from employee where emp_id=205;
select 100+'100' from dual;
select 100+'100a' from dual;  --a는 형변환 안됨
desc employee;

-- to_char : 날짜형 또는 숫자형 데이터를 문자형으로 변환할때 사용
select sysdate from dual;
select to_char(sysdate, 'yyyy-mm-dd') from dual;
select to_char(sysdate, 'yyyy/mm/dd') from dual;
select to_char(sysdate, 'yyyy/mm/dd/day') from dual;
select to_char(sysdate, 'yyyy/month/dd/day') from dual;
select to_char(sysdate, 'yyyy/mm/dd hh:mi:ss') from dual;
select to_char(sysdate, 'yyyy/mm/dd hh24:mi:ss') from dual;
select to_char(sysdate, 'yyyy/mm/dd hh"시"mi"분"ss"초"') from dual;
select to_char(sysdate, 'yyyy/mm/dd pmhh12:mi:ss') from dual;

-- 숫자 -> 문자         1,000,000
--9로 쓰면 안쓰는 부분 짤라내기, 0으로 쓰면 안쓰는 부분도 표시
select to_char(1000000, '999,999,999'), to_char(1000000, '000,000,000'), to_char(1000000, '000,000') from dual; 
--L을 붙이면 현지 로컬 통화단위고 표시됨 / 소수점도 표시 가능
select emp_name, salary, to_char(salary, '999,999,999'), to_char(salary, 'L999,999,999.999') 
from employee;

-- to_date : 숫자나 문자형 데이터를 날짜데이터로 변환
select to_date(2000010113, 'yyyymmddhh24') from dual;
select to_char(to_date(2000010113,'yyyymmddhh24'),'yyyy-mm-dd hh24:mi:ss'), to_char(sysdate, 'yyyy-mm-dd hh:mi:ss') from dual;

-- to_number : 문자형 데이터를 숫자로 변환
select to_number('1,000,000', '9,999,999') from dual;



-- 기타 함수 --

-- nvl : null로 되어있는 컬럼의 값을 지정한 숫자 혹은 문자로 변경하여 리턴
-- 보너스에 매개변수로 문자열을 넣으면 오류 / 원래 입력 가능한 타입으로 넣어줘야 됨
select emp_name, salary, bonus, nvl(bonus, 0), salary + salary*bonus, salary + salary*nvl(bonus,0)
from employee;

select emp_name, nvl(dept_code, 0) from employee; -- 여기서 0은 문자'0'으로 형변환이 자동으로 되어 입력됨
select emp_name, nvl(dept_code, '부서없음') from employee;

-- decode : 선택함수 -> 여러가지 경우에 선택을 할 수 있는 기능을 제공 -> switch와 비슷 -> 일치하는 값
-- decode(표현식, 조건1, 결과1, 조건2, 결과2, 조건3, 결과3,....)
select emp_name, emp_no, decode(substr(emp_no,8,1), '1','남자','2','여자', '3','남자','4','여자') as 성별
from employee;

-- case : 선택함수 -> 여러가지 경우에 선택을 할 수 있는 기능을 제공 -> if~else if -> 범위 가능
select emp_name, emp_no,
    case
        when substr(emp_no,8,1) = 1 or substr(emp_no,8,1) = 3 then '남자' --when 조건이 트루일때 then 뒤에 출력
        when substr(emp_no,8,1) in (2,4) then '여자'
        else '해당되는게 없으면 이거 나옴'
    end
    as 성별
from employee;

-- 그룹함수 : 하나이상의 행을 그룹으로 묶어 연산하여 총합, 평균 등을 하나의 컬럼으로 리턴하는 함수
-- sum : 해당컬럼의 값들의 총 합을 구하는 함수
select sum(salary) from employee;

select sum(salary) 
from employee 
where dept_code = 'D8'; --동작순서에 따라 작동해서 d8인 사람의 샐러리를 합함

--남자 직원들의 급여 총합
select sum(salary) from employee where substr(emp_no, 8, 1) = 1;

-- avg : 해당 컬럼의 값들의 평균을 구하는 함수
select avg(salary) from employee where substr(emp_no, 8, 1) = 1;

-- count : 조회결과의 행의 수를 반환하는 함수 / 몇개 조회됐는지 표시 / row 수 
select count(salary) from employee;
select count(*) from employee;
select count(*) from employee where dept_code='D8';

--min, max : 해당컬럼의 값 중 최소값/최대값을 리턴하는 함수
select max(salary), min(salary) from employee;

-- 그룹함수 사용 시 주의 사항 : 그룹함수를 사용하면 일반컬럼과 같이 조회할 수 없음-> 조회결과의 row수가 다르기때문에
select emp_name, sum(salary) from employee;     --x
select sum(salary), avg(salary) from employee;  --o

select dept_code from employee;
select count(dept_code) from employee;  --null은 그룹함수 연산에서 제외

select bonus from employee;
select avg(bonus) from employee;  --null을 빼고 연산된 값
select avg(nvl(bonus,0)) from employee; --nvl을 대입해줘야 계산이 됨

--== 실습 예제 --
--1. 직원명과 이메일, 이메일 길이를 출력하시오
--이름    이메일     이메일길이
--ex) 홍길동, hong@kh.or.kr
select emp_name, email, length(email)
from employee;

--2. 직원의 이름과 이메일 주소 중 아이디 부분만 출력하시오
select emp_name 이름, rtrim(email, '@kh.or.kr') 아이디, replace(email, '@kh.or.kr','') 아이디, substr(email,1,instr(email,'@',1,1)-1)
from EMPLOYEE;


--3. 60년생의 직원명과 년생, 보너스 값을 출력하시오
--그때 보너스 값이 null인 경우에는 0이라고 출력되게 만드시오
select emp_name 직원명, substr(emp_no, 1, 2) 년생, nvl(bonus, 0) 보너스
from employee
where substr(emp_no,1,1)=6;

--4. '010'핸드폰 번호를 쓰지 않는 사람의 수를 출력하시오 ( 뒤에 단위는 명을 붙이시오)
select * from employee;
select count(*) from employee where dept_code='D8';
select count(*)||'명'
from employee
where phone not like '010%'; 
--where substr(phone, 1,3) != '010';

--5. 직원명과 입사년월을 출력하시오
--   단, 아래와 같이 출력되도록 만들어 보시오
--      직워명         입사년월
--   ex)전형돈         2012년12월
--   ex)전지연         1997년 3월
select to_char(sysdate, 'yyyy/mm/dd hh"시"mi"분"ss"초"') from dual;

select emp_name, to_char(hire_date, 'fmyyyy"년"mm"월"'), extract(year from hire_date)||'년'||extract(month from hire_date)||'월'
from employee;

--6. 직원명과 주민번호를 조회하시오.
select email, lengthb(email), lpad(email, 20, '#'), rpad(email, 10, '#')
from employee;
select substr('showmethemoney',7) from dual; --length 숫자를 입력하지 않으면 7번부터 끝까지
select emp_name, rpad(substr(emp_no, 1,8), 14, '*') 주민번호
from employee;

--7. 직원명, 직급코드, 연봉(원) 조회
--   단, 연봉은 L57,000,000으로 표시되게 함
--   연봉은 보너스포인트가 적용된 1년치 급여임
select emp_name, salary, to_char(salary, '999,999,999'), to_char(salary, 'L999,999,999.999') 
from employee;

select emp_name, job_code, to_char((salary+salary*nvl(bonus,0))*12,'L999,999,999') 연봉
from employee;

--8. 부서코드가 D5, D9인 직원들 중에서 2004년도에 입사한 직원의 수 조회함.
--   사번 사원명 부서코드 입사일
select emp_id, emp_name, dept_code, hire_date
from employee
--where dept_code in ('D5','D9') and hire_date like '04%';
--where substr(hire_date,1,2) = '104'
where extract(year from hire_date) = 2004;

--9. 직원명, 입사일, 오늘까지의 근무일수 조회
--   * 주말 포함, 소수점 아래 버림
--select emp_name 직원명, hire_date 입사일, round(sysdate-hire_date, 0) 근무일수
select emp_name 직원명, hire_date 입사일, floor(sysdate-hire_date) 근무일수
from employee;

--10. 모든 직원의 나이 중 가장 많은 나이와 가장 적은 나이를 출력.
--    나이 계산할 때 만나이가 아닌 한국 나이로 계산
select to_date(2000010113, 'yyyymmddhh24') from dual;
select substr('showmethemoney',5,2) from dual;
select to_char(sysdate, 'yyyy/mm/dd') from dual;
select sysdate from employee;
select round(126.456,0) from dual;
select max(salary), min(salary) from employee;

--select max(round((to_date(substr(emp_no,1,2), 'yy')-sysdate) / 365)), min(round((to_date(substr(emp_no,1,2), 'yy')-sysdate) / 365))
select 
    extract(year from sysdate) - (1900 + substr(emp_no,1,2))+1 나이,
    extract(year from sysdate) - extract(year from to_date(substr(emp_no,1,2),'rr'))+1 나이,
    to_char(to_date(substr(emp_no,1,2),'rr'),'yyyy-mm-dd hh24:mi:ss')
from employee;


select * from employee;

--11. 회사에서 야근을 해야되는 부서를 발표하여야 한다.
select emp_name, emp_no,
    case
        when substr(emp_no,8,1) = 1 or substr(emp_no,8,1) = 3 then '남자' --when 조건이 트루일때 then 뒤에 출력
        when substr(emp_no,8,1) in (2,4) then '여자'
        else '해당되는게 없으면 이거 나옴'
    end
    as 성별
from employee;

select emp_name, dept_code,
case
    when dept_code in ('D5','D6','D9') then '야근'
    else '야근없음'
end as 야근유무
from employee
order by 2;

--12. 부서코드가 D5이면 총무부, D6이면 기획부, D9이면 영업부로 처리하시오.
select emp_name, emp_no, decode(substr(emp_no,8,1), '1','남자','2','여자', '3','남자','4','여자') as 성별
from employee;


select emp_name, dept_code, decode(dept_code, 'D5','총무부','D6','기획부','D9','영업부') as 부서명
from employee
where dept_code in ('D5','D6','D9');

--13. 직워명, 부서코드, 생년월일, 나이 조회
select to_char(sysdate, 'yyyy/mm/dd hh"시"mi"분"ss"초"') from dual;
select to_date(2000010113, 'yyyymmddhh24') from dual;
select emp_name, dept_code, to_char(substr(emp_no,1,6), 'yy"년 "mm"월 "dd"일"');
select
    emp_name,
    dept_code, 
    substr(emp_no,1,2)||'년 '||substr(emp_no,3,2)||'월 '||substr(emp_no,5,2)||'일 ' 생년월일,
--    to_char(to_date(substr(emp_no,1,6),'rrmmdd'),'yy"년" mm"월" dd"일"') 생년월일
    round((sysdate-to_date(substr(emp_no,1,2), 'rr'))/365, 0)+1 나이
from employee
where emp_id not in ('200','201','214');


--14. 직원들의 입사일로 부터 년도만 가지고, 각 년도별 입사인원수를 구하시오.
select emp_name, hire_date, dept_code from employee;
select count(*) from employee where dept_code='D8';
select * from employee;

select count(extract(year from hire_date))
from employee
where extract(year from hire_date) = '1999';

select * from EMPLOYEE;

    --case 방법
select 
    SUM(case when extract(year from hire_date) = 1999 then 1 else 0 end )as "1999년",
    SUM(case when extract(year from hire_date) = 2000 then 1 else 0 end )as "2000년",
    SUM(case when extract(year from hire_date) = 2001 then 1 else 0 end )as "2001년",
    SUM(case when extract(year from hire_date) = 2002 then 1 else 0 end )as "2002년",
    SUM(case when extract(year from hire_date) = 2003 then 1 else 0 end )as "2003년",
    SUM(case when extract(year from hire_date) = 2004 then 1 else 0 end )as "2004년",
    count(*) 전체직원수
from employee;

    --decode 방법
select
    count(decode(extract(year from hire_date),1999,1)) "1999년",
    count(decode(extract(year from hire_date),2000,1)) "2000년",
    count(decode(extract(year from hire_date),2001,1)) "2001년",
    count(decode(extract(year from hire_date),2002,1)) "2002년",
    count(decode(extract(year from hire_date),2003,1)) "2003년",
    count(decode(extract(year from hire_date),2004,1)) "2004년",
    count(*) 전체직원수
from employee;


----- group by ----

/*
select          5
from            1
[where]         2
[group by]      3       -- 그룹 기준점(컬럼) 생성
[having]        4
[order by]      6
*/
select dept_code, sum(salary), floor(avg(salary)), count(*)
from employee
group by dept_code;
-- 
select dept_code, decode(substr(emp_no,8,1),1,'남',2,'여') 성별, count(*)인원수 --count는 그룹바이로 설정된 조건을 기준으로 카운트
from employee
group by dept_code, decode(substr(emp_no,8,1),1,'남',2,'여')
order by dept_code;

select
    dept_code, floor(avg(salary))
from employee
group by dept_code
having floor(avg(salary)) >= 3000000;

















