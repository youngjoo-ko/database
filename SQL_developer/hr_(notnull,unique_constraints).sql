/*
    ���Ἲ ��������(constraints)
    : DB�� ��� �ִ� �������� ��Ȯ��(�ϰ���)�� �����ϵ���
      �ϱ� ���� ���������� �ǹ���.
      ��, ����Ȯ�� �ڷᰡ DB�� ����Ǵ� ���� �����ϵ���
      �ϴ� ������ ���Ѵ�. 
    not null : �ΰ��� �Էµ��� ���ϰ� �ϴ� ����
    unique : �ߺ��� ���� �Էµ��� ���ϴ� �ϴ� ����
             (null ���� ����� �� �ִ�. �ߺ��� X)
    primary key(�⺻Ű) : not null + unique
                        (���ϼ��� �����ϴ� Ű)
    foreign key(�ܷ�Ű) : �ٸ� ���̺��� �ʵ�(�÷�)��
                        �����ؼ� ���Ἲ�� �˻��ϴ� ����
    check : �־��� ���� ����ϴ� ��������
            (���� ���, ����: ��, �� �߿� �ϳ��� ���)
            
    ���� ���Ἲ(integrity)�̶�?
    : �ܷ�Ű ���� ���� �����̼�(���̺�)�� �⺻Ű ���� ��ġ�ؾ� �Ѵٴ� ����
    ��, ���̺��� ������ �� ���� �ܷ�Ű ���� ���� �� ����.
    
    �ڽ����̺�(employees)�� �μ����̵�� �ܷ�Ű
    �θ����̺�(departments)�� �μ����̵�� �⺻Ű(����Ű)
    
    �ܷ�Ű�� �ݵ�� ����Ű ���� �ϳ����� �Ѵ�.
    ����Ű�� ���� �ܷ�Ű�� ���� �� ����. 
    
*/

-- not null ��������
create table null_test(
    col_1 varchar2(20) not null,
    col_2 varchar2(20) null,
    col_3 varchar2(20)          -- null�ᵵ�ǰ�, �Ƚᵵ�ǰ�
);

insert into null_test(col_1, col_2)
values('aa','bb');  -- col_3�� null�� ����̶� ����

select * from null_test;

insert into null_test(col_2, col_3)
values('cc','dd');  -- col_1�� null�� ����� �ȵǼ� ����

-- unique ��������
create table unique_test(
    col_1 varchar2(20) unique not null, 
    col_2 varchar2(20) unique,
    col_3 varchar2(20) not null,
    col_4 varchar2(20) not null,
    
    --�ƿ����� ���
    -- constraint �������Ǹ� ��������
    constraint c_unique unique(col_3, col_4)
);

insert into unique_test
values('aa','bb','cc','dd');

insert into unique_test
values('aa','bb','cc','dd');  -- 4�� �÷� �� unique �������Ƕ����� �ߺ��� �� �� ����.

insert into unique_test
values('aa1','bb1','cc1','dd1'); -- ����

insert into unique_test
values('aa2','','cc2','dd2'); -- ����. 
-- 1,3,4��° �÷��� not null �������ǵ� ������
-- 2��° �÷��� unique �������Ǹ� �־ null �� ����

update unique_test
set col_1 = 'aa'
where col_2 = 'bb1'; -- col_1�÷��� aa���� �̹� �ֱ� ������ ���Ἲ�������� ����

select * from unique_test;

-- c_unique ���������� �����ϼ���. (�������Ǹ��� ���̴� ��)
alter table unique_test
drop constraint c_unique;

-- col_3, col_4 �÷��� unique ���������� ����� ����
insert into unique_test
values('aa3','bb3','cc2','dd2'); -- �������� ���� ����.

-- �������� �߰�
alter table unique_test
add constraint c_unique unique(col_3, col_4);
-- �ߺ��� �����͸� ������ �ִ� �ٶ��� ������.

-- ���� �ߺ��� ���ڵ� 2�� �����ϱ�
select * from unique_test;
delete from unique_test where col_3='cc2';
-- ���ǿ� ���� �������� ���ڵ尡 �ѹ��� ������ �� �ִ�.

-- �ߺ��� �� �������ϱ� �ٽ� �������� �߰�
alter table unique_test
add constraint c_unique unique(col_3, col_4);

--���ڵ� �߰�
insert into unique_test
values('aa2','','cc2','dd2');
-- null�� �ߺ��� ����� �ƴ�
insert into unique_test
values('aa3','','cc3','dd3');

insert into unique_test
values('aa4','','cc4','dd4');

insert into unique_test
values('aa5','','cc4','dd5');
-- ���� ������.
/*
��? col_3�� col_4�� ��� unique ������ ��� ������
����� ���� ������ ���� ��.
���� ��� �̷� ����� ������
������ȣ���� �ſ� ���
032)ooo-oooo
032)xxx-xxxx
������ȣ�� ������ �޺κ��� �ٸ��� 2�� ��� ���� �ٸ� �ɷ� ����� �ȴ�.
*/
select * from unique_test;
