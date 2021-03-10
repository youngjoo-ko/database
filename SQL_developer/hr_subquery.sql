/* 서브 쿼리 : 실무에서 많이 사용하는 쿼리 방법 */

-- 평균 급여보다 적은 급여를 받는 사원 조회(셀렉문을 2번 사용해야함)
select round(avg(salary))from employees;
select first_name, last_name, salary
from employees
where salary < 6462;

-- 위 코드를 서브쿼리로 조회하기
select first_name, last_name, salary
from employees
where salary < (select round(avg(salary)) from employees);

select * from locations;
-- locations 에서 state_province 값이 null 인것만 가져오기
select location_id , state_province
from locations
where state_province is null;

select * from departments
where location_id in(
    select location_id
    from locations
    where state_province is null);

-- 결과값이 여러개로 나오는 경우
select location_id
from locations
where country_id='US';

-- in 연산자 사용
select * from departments
where location_id in(
    select location_id
    from locations
    where country_id='US');
    
-- 위 코드를 다음과 같이 바꿔서 표현 가능
select * from departments where location_id in (1400,1500,1600,1700);

-- [문제] 월급이 가장 적은 사원의 이름과 직책명을 조회
select emp.first_name, emp.last_name, jobs.job_title
from employees emp, jobs
where emp.salary = (select min(salary) from employees)
and emp.job_id = jobs.job_id;


-- [문제] 평균 급여보다 많이 받는 사원들의 명단과 직책을 조회
select emp.first_name, emp.last_name, jobs.job_title
from employees emp, jobs
where emp.salary > (select avg(salary) from employees)
and emp.job_id = jobs.job_id;
