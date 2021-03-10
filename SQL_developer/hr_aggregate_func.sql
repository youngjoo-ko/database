-- 함수
-- 1.집계 함수(aggregate)
-- : 여러행 또는 테이블 전체행으로부터 하나의 집계결과값을 반환함.
-- 집계함수는 where절에서 사용 불가
-- count, max, min, avg, sum

-- sum() 함수
select sum(salary) from employees;

-- count() 함수
select count(*) from employees; -- 레코드의 전체 수
select count(employee_id) from employees;
select count(first_name), count(distinct first_name) from employees; -- 중복제거
select count(distinct last_name) from employees;

-- avg() 함수
-- 직원 전체 평균급여 구하기
select avg(salary) from employees;

--부서 아이디가 80인 직원들의 평균급여 구하기
select avg(salary) from employees where department_id=80;

-- max() 함수
-- 직원 중 최대 급여인 사원 조회
select max(salary) from employees;

-- 가장 최근에 입사한 사원 조회
select max(hire_date) from employees;
select hire_date from employees order by hire_date desc;

-- min() 함수
-- 최고참 사원의 입사일
select min(hire_date) from employees;

-- number function
-- abs() 절대값
select abs(-23) from dual; -- dual 은 오라클에서 제공하는 dummy 테이블

-- round() 함수
select round(0.123), round(0.543) from dual;
-- 소수점 자리 지정하여 반올림
select round(0.123445633, 6), round(2.523526643, 4) from dual;

-- trunc(n1, n2) 함수 truncate 잘라내다, 소수점 뒤 숫자 모두 제거
select trunc(1234.121312) from dual;
-- 소수점 2번째자리 이후 모두 잘라내기
select trunc(1234.125312, 2) from dual;

-- ceil(), floor() 천정값, 바닥값
select ceil(32.8) ceil from dual;
select ceil(32.3) ceil from dual;

select floor(32.8) ceil from dual;
select floor(32.3) ceil from dual;

-- power() 함수 n승 구하기
select power(4,2) power1 from dual;

-- mod() 함수 나머지 구하기
select mod(7,4) mod1 from dual;

-- sqrt() 제곱근 구하기
select sqrt(2) sqrt, sqrt(3) sqrt2 from dual;
