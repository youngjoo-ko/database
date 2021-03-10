/* ���� ���� : �ǹ����� ���� ����ϴ� ���� ��� */

-- ��� �޿����� ���� �޿��� �޴� ��� ��ȸ(�������� 2�� ����ؾ���)
select round(avg(salary))from employees;
select first_name, last_name, salary
from employees
where salary < 6462;

-- �� �ڵ带 ���������� ��ȸ�ϱ�
select first_name, last_name, salary
from employees
where salary < (select round(avg(salary)) from employees);

select * from locations;
-- locations ���� state_province ���� null �ΰ͸� ��������
select location_id , state_province
from locations
where state_province is null;

select * from departments
where location_id in(
    select location_id
    from locations
    where state_province is null);

-- ������� �������� ������ ���
select location_id
from locations
where country_id='US';

-- in ������ ���
select * from departments
where location_id in(
    select location_id
    from locations
    where country_id='US');
    
-- �� �ڵ带 ������ ���� �ٲ㼭 ǥ�� ����
select * from departments where location_id in (1400,1500,1600,1700);

-- [����] ������ ���� ���� ����� �̸��� ��å���� ��ȸ
select emp.first_name, emp.last_name, jobs.job_title
from employees emp, jobs
where emp.salary = (select min(salary) from employees)
and emp.job_id = jobs.job_id;


-- [����] ��� �޿����� ���� �޴� ������� ��ܰ� ��å�� ��ȸ
select emp.first_name, emp.last_name, jobs.job_title
from employees emp, jobs
where emp.salary > (select avg(salary) from employees)
and emp.job_id = jobs.job_id;
