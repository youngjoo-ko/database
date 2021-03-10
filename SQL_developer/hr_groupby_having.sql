/* group by 절 순서가 중요*/
select distinct department_id from employees;
select department_id from employees group by department_id;

-- 부서별 급여 합계
select department_id, sum(salary) from employees group by department_id;

-- 부서별 사원수와 부서별 총 급여, 부서별 평균 급여 구하기
select * from employees;
select department_id, count(employee_id) "사원수", sum(salary) "부서별 총 급여", avg(salary) "부서별 평균급여" 
from employees 
group by department_id;

-- 각 부서의 직급별 사원수와 평균급여 구하기(부서별 오름차순 정렬, 급여는 천단위로 잘라서 표기)
select department_id , job_id , count(employee_id) "사원수", to_char(sum(salary), '999,999') "부서별 총 급여", to_char(avg(salary), '999,999') "직급별 평균급여" 
from employees 
group by department_id, job_id 
order by department_id;

-- 80번 부서의 직급별 총급여, 평균급여 구하기
select department_id , job_id , to_char(sum(salary), '999,999') "부서별 총 급여", to_char(avg(salary), '999,999') "직급별 평균급여" 
from employees 
where department_id=80
group by department_id, job_id;


/*having 절 : group by와 함께 쓰이며 그룹의 조건을 적용할 때 사용 즉, 조건에 맞는 그룹 선택해줌*/
-- 부서별 사원수 조회
select department_id, count(*) from employees group by department_id;
-- 부서가 없는(null 값이 있는) 사원은 제외하고 조회
select department_id 부서id, count(*) 사원수 
from employees 
where department_id is not null 
group by department_id;
-- 위 코드에서 다시 사원수가 10명 이상인 부서만 조회
select department_id 부서id, count(*) 사원수 
from employees 
where department_id is not null -- and count(*) >= 10 은 집계함수로 where절에서 사용 불가하기 때문에 에러 발생
group by department_id
having count(*) >= 10; -- 그룹의 조건을 적용할 때 사용