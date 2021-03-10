/*
    DML(Data Manipulation Language) : ������ ���۾�
    select��, delete��, insert��, update��
    ��������ȸ, �����ͻ���, �����ͻ���, �����ͼ���
    
    --select ����
    select �÷�1, �÷�2, ...
    from ���̺�1, ���̺�2, ...
    where �÷�1=����1, �÷�2=����2, ..., ���ǵ�;
    (group by, having, order by)
    
    --insert ����
    // ���̺��� ���ڵ�(row, tuple)�� �Է��ϴ� ��ɾ�
    insert into ���̺��(�÷�1,�÷�2,...)
    values(��1, ��2, ...);
    
    --insert�� ������ ��! 
    �÷�1=��1, �÷�2=��2, ... �̷��� ¦�������� ���̱� ������
    �÷� ������ ���� ������ �����ؾ���
    ���� ���� ���� �� �÷��� ������Ÿ�԰� ��ġ�ؾ� �Ѵ�.
    
    --update ����
    update ���̺�� set ������ �÷�1=��1, ������ �÷�2=��2, ...
    where ���ǵ�;
    -> � ������ �� ���� �ٲ���ϱ� ������ update���� where�� �ʿ�
    
    --delete ����
    // ���̺��� ���ڵ�(row, tuple)�� ����
    delete from ���̺��
    where ����;
    -> �� �� ���� �� ���� ������, delete�� where�� �ʿ�
*/

-- [����] sample ���̺� �Ʒ� �÷� ������ ���弼��.
-- �μ���ȣ(depNo), �μ���(depName), �μ���ġ(depLoc), �μ��Ŵ���(depMgr)
create table sample(
    depNo number(20),
    depName varchar2(20),
    depLoc varchar2(20),
    depMgr varchar2(10)
);
desc sample;

-- [����] ���� sample ���̺� ���� �־����.
insert into sample values(100, 'IT', 'incheon', 'kim');
-- ��¥�� ��� �Ӽ����� ���� �Ÿ� �Ӽ����� �� �������ְ� �����ص� �ȴ�.
select * from sample;

insert into sample(depNo, depName, depLoc, depMgr) 
values(100, '��ȹ��','����','ȫ�浿'); -- varchar2 Ÿ���� '' �̿�(""�� �� ��)

/*
    ����Ŭ ������ Ÿ��(DataType)
    : �÷��� ����Ǵ� �������� ����(����)
    ����: ������, ������, ��¥(�ð�), LOB(Large Object ū������)
    
    --������ ������
    char(n) : �������� ����(max: 2000byte, default: 1byte) 
    varchar2(n) : �������� ����(max: 4000byte, default: 1byte) 
    nchar(n) : ��������(�����ڵ�(�ٱ����))(max: 2000byte, default: 1byte) 
    nvarchar : ��������(�����ڵ�(�ٱ����))(max: 2000byte, default: 1byte) 
    long : ��������(max: 2GB, default: 1byte) 
    
    --�������� vs ��������
    char(10) <- abc�� ������ 7�� ������ 10�ڸ� ����
    varchar2(10) <- abc�� ������ 7�� ����, ���� ��ŭ 3�ڸ��� ����
    
    --������ ������(��κ� number�� ���)
    number(p, s): p(��ü �ڸ���), s(�Ҽ��� ���� �ڸ�)(max: 22btye)
                  ���� ����(p, s�� �Է����� ������ �ڵ����� ����)
    float(p) : number�� ����Ÿ��(max: 22btye) -���Ǿ�������.�׳��ִ�����������
    binary_float : 32��Ʈ �ε� �Ҽ���(max: 4btye)
    binary_double : 64��Ʈ �ε� �Ҽ���(���� �����ϰ� ��Ÿ�� ��)(max: 8btye)
    
    --��¥ ������(�Ϲ������� date Ÿ���� ���� ���)
    date : ��¥�� �ð�(��/��/��/��/��/��)
    timestamp : ��/��/��/��/��/��/�и���
    
    --LOB Ÿ��(��뷮 ���� Ÿ��)(�ַ� clob, blob ���� ���)
    clob : ���� ��뷮 ��ü�� ������ ��
    nclob : ��뷮 �����ڵ� ������ ������ ��
    blob : ���� ��뷮 ��ü�� ������ ��(�̹���, ������, ����..)
    bfile : ��뷮 ���������� ��ġ, �̸��� ������ ��
    
    
    ���̳ʸ�Ÿ���� �̹���, ������, ���� �����Ŵ� ������ ������
    �����ͺ��̽��� �ִ� �����͵��� �ʵ庰�� ������ �Ǿ��ֱ� ������ ���� ������
    
*/

-- [����] book ���̺��� �����Ͽ� ���ڵ带 �Է��ϼ���.
-- �÷� ����: å�ڵ�, å����, å����, å�Ⱓ��
create table book(
    bCode number(10),
    title varchar2(50),
    writer varchar2(10),
    pubDate date
);

select * from book;

-- ��� �÷����� �Է��� ���� �÷��� ��������
insert into book values(100,'���̽��� ���� Ȱ��','ȫ�浿','2020/03/03');
--dateŸ�� - '20200303'�ص� �ǰ�, '2020-03-03'�ص� �ǰ�, '2020/03/03'�ص� ��.

-- ���� ���̺��� ���������� ���� ������ ��� �Ӽ��� null ���� ���ȴ�.
-- null �� �ֱ�
insert into book
values(200,'java',null,'2019-11-11');

insert into book
values(202, '','','2020-08-01');

insert into book
values(300, 'c���', '��浿', '2019-11-11');

-- [����] 300�� �ڵ��� å������ '�����ͺм�'���� �����ϼ���.(update�� Ȱ��)
update book set title='�����ͺм�' where bCode=300;

-- [����] java å������ ���켼��.
delete from book where title='java';

select * from book;

-- [����] å������ ��� ���켼��. (delete��, truncate�� Ȱ��)
delete book; -- delete Ȱ��
truncate table book; -- truncate Ȱ��


select * from sample;
-- ���ڵ� �߰�
insert into sample
values(200,'������','��õ','����');
insert into sample
values(300,'IT�μ�','�λ�','��泲');

commit; 

/*
����Ŭ������ commit : �����ͺ��̽��� �ݿ���Ű�� ��ɾ�
�����͸� update���� ����ؼ� �����ߴٰ� ���� ��
������ �����Ͱ� �����δ� �����ͺ��̽��� �ݿ��� �ȵ�.
autocommit �� �س����� �ڵ����� �ݿ��� �Ǵµ� 
������ false�� �Ǿ� ���� ��(������ �鿡���� �ڵ����� ������)
autocommit�� �ƴϱ� ������ commit����� ������ �׶� �����ͺ��̽��� �ݿ��� �ȴ�.

rollback
commit�������� ���ư��� ��.
commit�� ������ A����� �ߴٰ� �� ��, A����� �ݿ���Ű���� commit
�ݿ���Ű�� �������� rollback 
rollback�� �ϸ� ���������� commit�� ���� ��ɵ��� �ݿ��� �ȵ�.

commit, rollback ������ transaction���� ���� ���
Ʈ�����(transaction) - ���� ���� �۾� (�������� ������ �ϳ��� �Ѵ�)
A��� Ʈ������� a-1,a-2,a-3 ���μ����� �̷���� ������,
3���� ���μ����� ��� ���������� AƮ�����(��ü����)�� ���� �� �ִ�.
a-2���� ������ ���� rollback �ؼ� �ٽ� ó������ �ؼ� ��� ������ ����� ������ ���� �� �ִ�.
���ݰ��� �̷��ɷ� ���ø� ���� ���.
A����, B���� �ִٰ� �� ��
A���� -> B���·� 1000������ �Ա��ϰ�, 
B���¿��� 1000������ ������ Ʈ������� �����ٰ� �� �� �ִ�.

�� ��, A���� -> B���·� 1000������ ���´µ�, 
�߰��� ��Ʈ��ũ ������ B���¿����� ���� �� �޾Ҵ�.
�׷��� A���¿����� 1000������ ������, ���� �������� ������Ÿ� �ȵǴϱ� 
�ϳ��� Ʈ��������� ����� �Ѵ�. ���� ������ �ԱݵȰ� Ȯ���ϴ°ű��� �ϳ��� Ʈ�����
A���¿��� ���� ������ B���¿��� �������� �ٽ� rollback �޾����� commit
�׷������� ���ǰ�, commit�� rollback�� ���� �߿��� �����̴�.
*/

-- [����] IT�μ��� ��ġ�� ���ַ� �ٲ㺸����.
update sample set deploc='����' where depname='IT�μ�';

select * from sample; -- IT�μ��� ��ġ : ����
rollback;
select * from sample; -- IT�μ��� ��ġ : �λ�
--�ٲ�� �ϰ� ������ ������Ʈ �ϰ� commit ���ֱ�
update sample set deploc='����' where depname='IT�μ�';
commit;

-- ���ڵ带 �Է��ϴ� ������ ��¥�� �ְ� ���� ��(sysdate �̿�)
insert into book(bcode,title,writer,pubdate)
values(201, 'C#','��C', sysdate);
select * from book;
--sysdate ȸ�������� �� ���� ���

create table itBook(
    bCode number(10),
    title varchar2(20),
    author varchar2(10),
    publisher varchar2(20),
    pubDate date default sysdate
);

insert into itBook(bcode, title, author, publisher) 
values(101,'python ����','jh','jh���ǻ�');

select * from itBook;

-- [����] �Ʒ��� ������ member ���̺��� ����� ȸ�������� �߰��ϼ���.
-- �̸�, ���̵�, ��й�ȣ, ����, ��������
create table member(
    name varchar2(20),
    id varchar2(10),
    pw varchar2(10),
    age number(3),
    joinDate date default sysdate
);

insert into member(name, id, pw, age) 
values('ȫ�浿','hong','test1234',23);

select * from member;

/*
������ �������� ���� �־�������,
�����δ� �����ø����̼ǿ��� ȸ�������� �� �� �Է������� �ۼ����ٵ�
�� �Է����� �ۼ��� ���� �ٷ� �����ͺ��̽��� �־��ִ� ���̴�.

�������ӿ�ũ�� flask(���̽����������ӿ�ũ), jango ����� �ִµ�
jango �����ӿ�ũ�� ���߿� ����غ��ٵ� ó������ �̰� ���� �ʴ� ������
ó������ ����ϸ� �� ������ ��Ȯ�� �������� ���ϰ� �������� ���� �Ŷ�
������ �����, �������� �����͵��� ��� �ְ�޴���, õõ�� ������� �� ��. (flask �̿��ؼ�)
jango=spring���� ����
spring�� jsp�� �𸣸鼭 �ϴ� �͵� ����. jsp���� �������� ���� �� �ڿ� spring �ϴ� ��.
python�� ������� ��������ϱ� ���̽����� flask���� ���� �ð� ������ jango�� ��
*/

insert into member(name, id, pw, age) 
values('ȫ�浿','hong','test1234',23);

insert into member(name, id, pw, age) 
values('','','',23);
-- ����� ������ ���� ���⵵ �ϰ�, �̸����� null�� ���µ�
-- ȸ�������� ������ ���� �� ����, null���� ������ �ȵǱ� ������ �������� �̿������ �Ѵ�.
-- �������� : ������ ���Ἲ(��������Ȯ��, �������ϰ���)�� �����ϰ� ���ִ� ��.