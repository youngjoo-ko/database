/* group by 절*/
select distinct department_id from employees;
select department_id from employees group by department_id;

-- 부서별 급여 합계
select department_id, sum(salary) from employees group by department_id;
-- 부서별 사원수와 부서별 총 급여, 부서별 평균 급여 구하기
select * from employees;
select department_id, count(employee_id) "사원수", sum(salary) "부서별 총 급여", avg(salary) "부서별 평균급여" from employees group by department_id;
-- 각 부서의 직급별 사원수와 평균급여 구하기(부서별 오름차순 정렬, 급여는 천단위로 잘라서 표기)
select department_id , job_id , count(employee_id) "사원수", to_char(sum(salary), '999,999') "부서별 총 급여", to_char(avg(salary), '999,999') "직급별 평균급여" from employees group by department_id, job_id order by department_id;
-- 80번 부서의 직급별 총급여, 평균급여 구하기
select department_id , job_id , to_char(sum(salary), '999,999') "부서별 총 급여", to_char(avg(salary), '999,999') "직급별 평균급여" from employees where department_id=80 group by department_id, job_id;