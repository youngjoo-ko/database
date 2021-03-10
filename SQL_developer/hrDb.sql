desc employees;
-- *�� ��� ���� �ǹ�
select * from employees;
-- ��Ʈ ������ ���̽��� ����� ��� ���� Ȯ��
select * from employees where last_name='Smith';
-- �μ��� ���� Ȯ��
select * from departments;
desc departments;
-- ��Ʈ������ 'Ernst' ������ ���̵�� �޿� ��ȸ
select last_name, employee_id, salary, first_name from employees where last_name='Ernst';
-- �ʵ���� ������ �� �ִ�
select employee_id as "��� id" from employees;
-- ��� id, �������� �ʵ���� ���� �� ��ȸ
select employee_id  as "��� id" from employees;
select salary as "����" from employees;
select employee_id as "��� id", salary as "����" from employees;
select employee_id �������, salary �����ޡ� from employees;

-- �ߺ������ϱ�  distinct
select job_id from employees;
select distinct job_id from employees;

-- ������(���, ��, ��, ��Ÿ)
select employee_id, first_name, salary*12 from employees;

-- �ʵ���� �ѱ۷� �����Ͽ� ���� ��ȸ
select employee_id ����� id��, first_name ���̸���, salary*12 �������� from employees;

-- �񱳿����� �̿��Ͽ� �޿��� 5000�̻��� ������ �̸��� �޿� ��ȸ�ϱ�
select last_name, salary from employees where salary>=5000;

-- �Ի糯¥�� 2004�� ������ ������ �̸�, ����, �Ի糯¥ ��ȸ
select frist_name, last_name, salary, hire_date from employees where hire_date>=��04/01/01��


-- ��������(and, or, not)
-- �μ���ȣ�� 50�̸鼭  job_id�� sh_clerk�� ������ �̸�, job_id, �μ�id ��ȸ
select last_name,  first_name job_id, departments_id from employees where department_id=50 and job_id=��SH_CLERK��;

-- �μ����̵� 50�̰ų� �Ŵ��� id�� 100�� ���� �̸�, �μ�id ��ȸ
select last_name, first_name, departments_id from employees where department_id=50 or manager_id=100��;

-- �μ� id�� 50�� �ƴ� ������ �̸��� �μ�id ��ȸ(3���� ����̻�)
select first_name, last_name, department_id from employees where not(department_id=50);

select first_name, last_name, department_id from employees where not department_id != 50;

select first_name, last_name, department_id from employees where not department_id ^= 50;

select first_name, last_name, department_id from employees where not department_id <> 50;

-- �޿��� 4000~8000 ������ ���� �̸��� �޿� ��ȸ
select first_name, last_name, salary from employees where salary between 4000 and 8000;
select first_name, last_name, salary from employees where salary>=4000 and salary<=8000;

-- �޿��� 6500, 7700, 13000�� ���� �̸��� �޿� ��ȸ 
select first_name, last_name, salary from employees where salary=6500 or salary=7700 or salary=13000;
select first_name, last_name, salary from employees where salary in(6500,7700,13000);

-- first name�� D�� �����ϴ� ����� ��ȸ
select first_name, last_name from employees where first_name like 'D%';

-- first name�� d�� ������ ����� ��ȸ
select first_name, last_name from employees where first_name like '%d';

-- first name�� �տ��� ����° ���ڰ� a�� ����� ��ȸ
select first_name, last_name from employees where first_name like '__a%';

-- ���ʽ��� ���� ��� ��ȸ
select first_name, last_name, commission_pct from employees where commission_pct is null;

-- ���ʽ� �޴� ��� ��ȸ
select first_name, last_name, commission_pct from employees where commission_pct is not null;

/* �������� ����(ascending sort)�������� , ��������(descending sort) ����*/
select phone_number, salary from employees where salary>=9000 order by employee_id asc;


