/*
    �⺻Ű(primary key) ���̺� ������ �⺻Ű �����
*/

create table primary_test(
    student_id number(10) primary key, --�ζ��� ���(�ڿ� �ٷ� �����ִ� ��)
    name varchar2(20)
);

insert into primary_test 
values('',''); -- ����. primary key�� null ���X

insert into primary_test 
values(1212,''); -- ����

insert into primary_test 
values(1212,''); -- ����. primary key�� �ߺ� ���X

-- [����] primary_test2 ���̺� �⺻Ű�� �ƿ����� ������� �����ϼ���
-- (�÷�: student_id, name)
create table primary_test2(
    student_id number(10),
    name varchar2(20),
    constraint student_pk primary key(student_id) -- �ƿ����� ���
    -- �ƿ����ι������ �ϴ� ������, 
    -- �������Ǹ�, �⺻Ű���� ���� �� �ֱ� ������ ���߿� ��Ʈ���� ���� �ִ�. 
    -- alter�� ���ؼ� ������ ���� �ִ�.
);

select * from primary_test2;

-- ������ �⺻Ű ���� �ϰ�, ���߿� �⺻Ű �߰��ϱ�
create table primary_test3(
    student_id number(10),
    name varchar2(20)
);

-- ���� ���̺� �⺻Ű�� �߰��ϼ���.
alter table primary_test3
add constraint student_pk2 primary key(student_id);
-- add constraint �������Ǹ�(�⺻Ű��) primary key(�ʵ��);
-- �������Ǹ��� �ٸ� ���̺��� ���̰� �ִ� �̸��̸� �� �� ����. �ߺ��� �ȵǳ���.

/* �ܷ�Ű �������� */
-- �ζ��� ���
-- �ʵ�� constraint �������Ǹ�(�ܷ�Ű��) references �θ����̺�(�θ����̺��� ����Ű�ʵ��)
create table fk_test(
    department_id constraint dept_fk
    references departments(department_id) -- �ζ��� ���
    --�ܷ�Ű�� ������ ���� ��� ���̺��� ��� �Ӽ����� ���� �ϰڴٰ� ������ ����� �Ѵ�.
    --�����ϴ� ���̱� ������ ������Ÿ���� ���� �ʿ����.
);

select department_id from departments;

insert into fk_test values(100); -- ����
insert into fk_test values(300); -- ����. �θ����̺��� ����Ű�� 300�̶�� ���� ���
select * from fk_test;

-- �ƿ����� ������� fk_test2 �����
-- constraint �������Ǹ� foreign key(���⼭�����ʵ��) references �������̺�(����Ű��)
create table fk_test2(
    department_id,
    constraint dept_fk2 
    foreign key(department_id) 
    references departments(department_id) --�ƿ����ι��
);

-- ���̺��� �����ϰ� ���� �ܷ�Ű �����ϱ�
desc departments;
create table fk_test3(
    department_id number(4)
    -- �� ���� ������Ÿ���� ������ϴµ�, �̶��� department_id�� ������Ÿ�԰� �����ִ� ���� ����.
    -- �ٵ� ���� �̷��� �Ⱦ���, �ζ��� �ƿ����� ��ĸ� ���� ������
    -- �����Ե� ���� �κ� ��Ȯ�� ������. �׸�ŭ ���� �Ⱦ��� ����̶� �׷��� ����.
);

alter table fk_test3
add constraint dept_fk3 foreign key(department_id)
references departments(department_id);



/* check ���� ���� */
create table check_test(
    gender varchar2(10) not null,
    constraint chk_gender check(gender in('M','F'))
);

create table check_test2(
    gender varchar2(10) not null,
    constraint chk_gender2 check(gender in('��','��'))
);

insert into check_test values('��'); -- üũ �������� ����
insert into check_test values('M'); -- ����ε� ����
select * from check_test;

create table student(
    stu_id number(10),
    name varchar2(20),
    age number,
    birthday date,
    regDate date default sysdate
);

-- check ���������� �̿��� ������ ��ȿ�� �˻�
alter table student
add constraint age_chk
check(round((regDate - birthday)/365) = age);
-- 365�� ������ 1������� ������ְ� �Ҽ����ڸ��� �ݿø� ����.

select * from student;
insert into student(stu_id, name, age, birthday) values(489018,'���Ͽ�',20,'1996-01-18');
--> üũ �������� ���� 
insert into student(stu_id, name, age, birthday) values(489018,'���Ͽ�',25,'1996-01-18');
-- ���������� ���Ե�.

/*
���࿡ ���̺��� �����ϰ�, üũ���������� �ֱ� ���� ���� �־�� ��쿡 
��ȿ�� �˻翡 ���� �ʴ� ���� �̹� �� �ִ� ��쿡�� üũ ���������� �� �� ����.
*/
