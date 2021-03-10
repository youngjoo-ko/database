/*��¥ ���� �Լ�*/

-- sysdate() ; ���� �ý����� ��¥
select sysdate from dual;


-- months_between(a,b) : a��¥ - b��¥�� ����
select months_between(sysdate, '2020/01/01') from dual;


-- last_day() : ������ ��¥���� �ش� ���� ������ ��¥�� ����
select last_day(sysdate) from dual;
-- �μ�id 50�� ������� �ٹ� ���� �� �ľ�
select first_name, months_between(sysdate, hire_date) from employees where department_id=50;
-- �Ʊ� ���ڿ� �Լ��� �ٸ� �ʵ�� ���� ������°� ������µ� �̰� �� ��������?


-- add_monshs() : ���� �޷κ��� ������ ���� ���� ��¥�� ����
select add_months(sysdate, 7) from dual;


-- next_day(���س�¥, 'ã������') : ���� ��¥ ���Ŀ� ���� ����� �ش� ������ ��¥�� ����
-- 1~7(��~��) ���� ǥ�� ����
select next_day(sysdate, '�Ͽ���') "���� �Ͽ���" from dual;
select next_day(sysdate-8, '�Ͽ���') "���� �Ͽ���" from dual;
select next_day(sysdate, 1) "���� �Ͽ���" from dual;


-- to_char(��¥, '��¥�� �ٲ��� ���ڿ��� ����' )
select to_char(sysdate, 'yyyy-mm-dd') from dual;
select to_char(sysdate, 'yy-mm-dd') from dual;


/* to_date() : ���ڸ� ��¥, �ð� �������� �ٲ��ִ� �Լ�*/
select to_date('20200814', 'yyyy-mm-dd') from dual; -- �̷��� �ϸ� ������ �ȹٲ� ������? ����Ŭ�� ȯ�溯�� ����


-- ����Ŭ�� ȯ�溯�� ��ȸ
select * from v$nls_parameters; -- date format�� yy/mm/dd �� �Ǿ�����

-- ��¥ ������ ���ǵ� ����(����� ����)������ �����ϴ� ���(alter ���)
alter session set nls_date_format = 'yyyy-mm-dd';

select to_char(sysdate, 'hh24:mi:ss') from dual;
select to_date('20201111123022', 'yyyy-mm-dd-hh24-mi-ss') from dual;

-- case() : elseif���� ���� ������ �ϴ� �Լ�
select first_name, department_id, 
    case when department_id=20 then '�����ú�'
         when department_id=60 then '�����'
         when department_id=90 then '������ȹ��'
         else ''
         end "�μ���"
from employees;
         
         

