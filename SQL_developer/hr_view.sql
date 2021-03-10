/*
    ��(view)
    : ���������� �������� �ʴ� ������ ���̺�
    : �ϳ� �̻��� ���̺��� ��ȸ�ϴ� select���� ��������� ������ ��ü
    
    �뵵
    : ����(select���� �������� �ؼ��ϱ� ���� ���)
    : ���ȼ�(���̺��� Ư�� ���� �����ϰ� ���� ���� �� ���)
    
    ����
    : create view ���̸�(�÷�1, �÷�2, ..)
      as select��
      
*/


CREATE VIEW v_emp(emp_id, first_name, job_id, hire_date, dept_id)
AS 
SELECT employee_id, first_name, job_id, hire_date, department_id
from employees
where job_id = 'ST_CLERK'; 

select * from v_emp;

-- �����ؾ� �� �� �Ϲ������� ���� ���Ǵ� ���(�ش� �䰡 �����ϸ� REPLACE, �������� ������ CREATE)
CREATE OR REPLACE VIEW v_emp2(emp_id, first_name, job_id, hire_date, dept_id)
AS 
SELECT employee_id, first_name, job_id, hire_date, department_id
from employees
where job_id = 'SH_CLERK'; 

select * from v_emp2;
DESC v_emp2;

-- �Ʒ� �ڵ� ���� ��� emp_id�� not null���� null ������� �ٲ�
CREATE OR REPLACE VIEW v_emp2(emp_id, first_name, job_id, hire_date, dept_id)
AS 
SELECT nvl(employee_id, null), nvl(first_name, null), job_id, hire_date, department_id
from employees
where job_id = 'SH_CLERK'; 

desc employees; -- ���� ���̺��� null ���´� �ٲ��� ����

-- �̸� �ٲٱ�
update v_emp2 set first_name = 'Kim' where first_name = 'Kelly';
select * from v_emp2; -- view�� row ������
select * from employees; -- ���̺��� row�� ������


update v_emp2 set first_name = 'Kelly' where first_name = 'Kim'; -- �ٽ� �ȹٲ�????

-- ���ʽ� ���� ���� ���ϱ�
select employee_id, first_name, (salary*12 + (salary*nvl(commission_pct, 0))) ����
from employees;

-- ���� view�� �ٲٱ�
create view v_emp_sal(emp_id, first_name, annual_sal)
as 
select employee_id, first_name, (salary*12 + (salary*nvl(commission_pct, 0))) ����
from employees;

-- view�� ������ �� ���� �����ϱ�
create view v_emp_sal_readonly(emp_id, first_name, annual_sal)
as 
select employee_id, first_name, (salary*12 + (salary*nvl(commission_pct, 0))) ����
from employees
with read only; -- �б⸸ ����

-- ���̺� ������ �̿��� �� �����
create view v_join(���, �̸�, �μ���ȣ, �μ���, �Ի���)
as
select emp.employee_id, emp.first_name||''||emp.last_name, -- ��, �̸� ��ħ
emp.department_id, dept.department_name, emp.hire_date
from employees emp, departments dept
where emp.department_id = dept.department_id;

select * from v_join order by ���;

--10���� �Ի����� ���� 100000�̻� �޴� ����� ���̵�� �̸�, �μ����̵�, �Ի��� ��ȸ(�μ����̵�� 50, ��å�� ST_CLERK)�ϴ� view �����
create or replace view v_sample -- ���� �ʵ���� ���� �������� ������ select �ؿ� �ʵ�� �״�� �����ȴ�
as
select employee_id, first_name, last_name, department_id, hire_date
from employees
where (salary*12 + (salary*nvl(commission_pct, 0))) >= 40000
and department_id = 50 and job_id = 'ST_CLERK'
and hire_date < sysdate-(365*10); 

select * from v_sample;
