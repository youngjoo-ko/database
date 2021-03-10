/* group by �� ������ �߿�*/
select distinct department_id from employees;
select department_id from employees group by department_id;

-- �μ��� �޿� �հ�
select department_id, sum(salary) from employees group by department_id;

-- �μ��� ������� �μ��� �� �޿�, �μ��� ��� �޿� ���ϱ�
select * from employees;
select department_id, count(employee_id) "�����", sum(salary) "�μ��� �� �޿�", avg(salary) "�μ��� ��ձ޿�" 
from employees 
group by department_id;

-- �� �μ��� ���޺� ������� ��ձ޿� ���ϱ�(�μ��� �������� ����, �޿��� õ������ �߶� ǥ��)
select department_id , job_id , count(employee_id) "�����", to_char(sum(salary), '999,999') "�μ��� �� �޿�", to_char(avg(salary), '999,999') "���޺� ��ձ޿�" 
from employees 
group by department_id, job_id 
order by department_id;

-- 80�� �μ��� ���޺� �ѱ޿�, ��ձ޿� ���ϱ�
select department_id , job_id , to_char(sum(salary), '999,999') "�μ��� �� �޿�", to_char(avg(salary), '999,999') "���޺� ��ձ޿�" 
from employees 
where department_id=80
group by department_id, job_id;


/*having �� : group by�� �Բ� ���̸� �׷��� ������ ������ �� ��� ��, ���ǿ� �´� �׷� ��������*/
-- �μ��� ����� ��ȸ
select department_id, count(*) from employees group by department_id;
-- �μ��� ����(null ���� �ִ�) ����� �����ϰ� ��ȸ
select department_id �μ�id, count(*) ����� 
from employees 
where department_id is not null 
group by department_id;
-- �� �ڵ忡�� �ٽ� ������� 10�� �̻��� �μ��� ��ȸ
select department_id �μ�id, count(*) ����� 
from employees 
where department_id is not null -- and count(*) >= 10 �� �����Լ��� where������ ��� �Ұ��ϱ� ������ ���� �߻�
group by department_id
having count(*) >= 10; -- �׷��� ������ ������ �� ���