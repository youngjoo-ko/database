/* DDL(Data Definition Language) : ������ ���Ǿ�
    : Create��, Alter(����: add(�߰�), modify(����), drop(����)), Drop��, Truncate��
*/

desc employees;

-- ���̺� ����
create table employees2(
    employee_id number(10), -- �ִ� 10���� ����
    name varchar2(20), --�ִ� 20����
    salary number(7,2) -- 7�ڸ� ���ڰ� ���µ� �Ҽ��� 2�ڸ� ����
);

desc employees2;

-- �Ȱ��� ������ ���ο� ���̺��� ���� ��
create table employees3
as
select * from employees2;

desc employees3;

-- ���� ���� employees3�� ���ο� �Ӽ�(�ʵ�)�� �߰��ϰ� ���� ��
-- �÷� �߰�
alter table employees3 add(
    manager_id varchar2(20)
);

-- �Ӽ��� �����ϰ� ���� ��
-- �÷� ����
alter table employees3 modify(
    manager_id varchar2(10)
);

-- �Ӽ��� ������ ���� alter�� drop �Բ� ���.
-- �����ϴ� �� drop ���� �����Ұ��� �ڿ� column �ٿ��ָ� �ȴ�. 
-- drop column �Ӽ���
-- �÷� ����
alter table employees3 drop column manager_id;

-- ���̺� ������ ������ ����
drop table employees3;

desc employees2;

-- ������ ����������, ���ڵ�(Ʃ��)�� ������.
truncate table employees2;

/*
    drop�� �ƿ� ���̺��� �����ϴ� ��. 
    truncate�� ���̺��� ���ΰ� �� ���� ���ڵ��(Ʃ�õ�)�� �����ϴ� ��.
*/

