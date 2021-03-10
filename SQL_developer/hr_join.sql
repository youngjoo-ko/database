/* 1. ���̺� join : �Ϲ������� �������� ����� �ǹ��Ѵ� */

select * from employees;
select * from departments;
select * from jobs;
select * from locations;

-- 2�� ���̺� �����ϱ�(�� ���̺��� ������ �ʵ尡 �����ؾ� �Ѵ� : ���Ἲ, ������ �������� �ɰ��� ������ �ִ°�)
select emp.department_id, first_name, last_name, dep.department_name
from employees emp, departments dep
where emp.department_id = dep.department_id;

-- 3���� ���̺� �����ϱ�(������ �̸�, �̸���, �μ� ���̵�, department_name, job_title ��������)
select employee_id, first_name, last_name, email, emp.department_id,  dep.department_name, job_title
from employees emp, departments dep, jobs 
where emp.department_id = dep.department_id and emp.job_id = jobs.job_id
order by employee_id;

-- 4�� ���̺� ����(�ٹ� ��ġ �ľ� / ������ �̸�, �̸���, �μ����̵�, �μ���, ���޸�, �ٹ���ġ ������ ��������)
-- ���� ���ϵ��� ������̵� ��������
select employee_id, first_name, last_name, email, emp.department_id,  dep.department_name, job_title, lo.location_id
from employees emp, departments dep, jobs, locations lo
where emp.department_id = dep.department_id and emp.job_id = jobs.job_id and dep.location_id = lo.location_id
order by employee_id; -- ����� 107���ε� 106�� ������ ������ 1���� �μ����̵� null ���̱� ����

-- 4�� ���̺� ����(�þ�Ʋ���� �ٹ��ϴ� ������ �̸�, �̸���, �μ����̵�, �μ���, ���޸�, �ٹ���ġ ������ ��������)
select first_name, last_name, emp.email, emp.department_id,  dep.department_name, job_title, lo.location_id, lo.city
from employees emp, departments dep, jobs, locations lo
where emp.department_id = dep.department_id and emp.job_id = jobs.job_id and dep.location_id = lo.location_id and lo.city = 'Seattle';

/* ���� ���� : �ڽ��� ���̺��� �������� ���̺�ó�� ����ϴ� �� , �� ���̺� �ȿ� ���� �ٸ��̸��� �ʵ尪���� ������ �� ��� ����  */
select * from employees;
select emp1.employee_id, emp1.first_name, emp2.employee_id ���id, emp2.first_name ����̸�
from employees emp1, employees emp2
where emp1.manager_id = emp2.employee_id;


/* 2. �ܺ� join : left �ܺ�����, right �ܺ����� 2������ ����*/
-- �������� ������ null �� ������ ������� 107�������� 106������ ��ȸ��
select emp.employee_id, emp.first_name, dep.department_name
from employees emp, departments dep
where emp.department_id = dep.department_id;

-- ���� �ܺ��������� �ٲٸ�
select emp.employee_id, emp.first_name, dep.department_name
from employees emp, departments dep -- ���⼭ �� �� 
where emp.department_id = dep.department_id(+); -- ������ �������� �������� �þ Left Outer join
--where emp.department_id(+) = dep.department_id; -- �������� �������� ������ �þ Right Outer join
select * from departments;
select * from employees;

--[����] ��� ����� employee_id�� first_name, department_name, city�� ����Ͻÿ�
select emp.employee_id, emp.first_name, dep.department_name, lo.city
from employees emp, departments dep, locations lo
where emp.department_id = dep.department_id(+) and dep.location_id = lo.location_id(+);

--[����] ��� ����� ���id�� firstname �׸��� ���id�� ����̸��� ���
select emp1.employee_id ���id, emp1.first_name ����̸�, emp2.employee_id ���id, emp2.first_name ����̸�
from employees emp1, employees  emp2
where emp1.manager_id = emp2.employee_id(+);

select * from locations;
select * from departments;
select * from employees;