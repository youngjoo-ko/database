-- �Լ�
-- 1.���� �Լ�(aggregate)
-- : ������ �Ǵ� ���̺� ��ü�����κ��� �ϳ��� ���������� ��ȯ��.
-- �����Լ��� where������ ��� �Ұ�
-- count, max, min, avg, sum

-- sum() �Լ�
select sum(salary) from employees;

-- count() �Լ�
select count(*) from employees; -- ���ڵ��� ��ü ��
select count(employee_id) from employees;
select count(first_name), count(distinct first_name) from employees; -- �ߺ�����
select count(distinct last_name) from employees;

-- avg() �Լ�
-- ���� ��ü ��ձ޿� ���ϱ�
select avg(salary) from employees;

--�μ� ���̵� 80�� �������� ��ձ޿� ���ϱ�
select avg(salary) from employees where department_id=80;

-- max() �Լ�
-- ���� �� �ִ� �޿��� ��� ��ȸ
select max(salary) from employees;

-- ���� �ֱٿ� �Ի��� ��� ��ȸ
select max(hire_date) from employees;
select hire_date from employees order by hire_date desc;

-- min() �Լ�
-- �ְ��� ����� �Ի���
select min(hire_date) from employees;

-- number function
-- abs() ���밪
select abs(-23) from dual; -- dual �� ����Ŭ���� �����ϴ� dummy ���̺�

-- round() �Լ�
select round(0.123), round(0.543) from dual;
-- �Ҽ��� �ڸ� �����Ͽ� �ݿø�
select round(0.123445633, 6), round(2.523526643, 4) from dual;

-- trunc(n1, n2) �Լ� truncate �߶󳻴�, �Ҽ��� �� ���� ��� ����
select trunc(1234.121312) from dual;
-- �Ҽ��� 2��°�ڸ� ���� ��� �߶󳻱�
select trunc(1234.125312, 2) from dual;

-- ceil(), floor() õ����, �ٴڰ�
select ceil(32.8) ceil from dual;
select ceil(32.3) ceil from dual;

select floor(32.8) ceil from dual;
select floor(32.3) ceil from dual;

-- power() �Լ� n�� ���ϱ�
select power(4,2) power1 from dual;

-- mod() �Լ� ������ ���ϱ�
select mod(7,4) mod1 from dual;

-- sqrt() ������ ���ϱ�
select sqrt(2) sqrt, sqrt(3) sqrt2 from dual;
