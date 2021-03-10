/* ���ڿ� �Լ�*/
-- concat(str1, str2) : �� ���ڿ� �����ִ� �Լ�
select concat('Hello', 'bye'), concat('good', 'night') from dual;
select concat('Hello', 'bye'), 'good' || 'night' from dual; -- concat ��� ��Ƽ�ö��� 2���� ��ü ����

-- initcap(str) ù ���ڸ� �빮�ڷ� �ٲ��ִ� �Լ�
select initcap('good morning') from dual; -- �߰��� �����ڰ� /,\,| ������,���� ������ �ܾ��� ù���ڵ� �빮�ڷ� ǥ����
select initcap('good/morning hello') from dual;
select initcap('good|morning hello') from dual;

-- lower(), upper() �Լ�
select lower('GOOD'), upper('good') from dual;

-- LPAD(), RPAD() �Լ� : ���ʿ� padding, �����ʿ� padding ���� �ִ� �Լ�
select lpad('good', 6, '+') lpad1, lpad('good', 12, '$') lpad2 from dual; -- ������ 1����Ʈ�� ����
select rpad('ȫ�浿', 9, '+') rpad1 from dual; -- �ѱ��� 2����Ʈ�� ����

-- ltrim(), rtrim() �Լ� : ����/�����ʿ��� ���� ���� �����ִ� �Լ�
-- �߰� ���ڸ� ���� �� ����
-- ���ڿ��� �ߺ��� ���ڴ� ��� ������
select ltrim('goodbye', 'g'), ltrim('goodbye', 'o'), ltrim('goodbye', 'go') from dual;
select rtrim('goodbye', 'e'), rtrim('goodbye', 'odbye') from dual;

-- trim() : ��������
select length('  good  ') from dual; -- ���ڿ� ���� ���ϱ�
select trim('  good  ') from dual;

-- substr() �Լ� : ���� �������� �Լ�
-- 8��° ���ں��� 4�� ������(1���� ������)
select substr('good morning john', 8, 4) from dual; 
-- 8��° ���ں��� ��� ������
select substr('good morning john', 8) from dual; 
-- �ڿ������� 4���� ������
select substr('good morning john', -4) from dual; 
-- �ڿ��� 4��° ���ڿ��� 2���� ������
select substr('good morning john', -4, 2) from dual; 
-- �ƹ��͵� �������� ����
select substr('good morning john', -4, 0) from dual; 



-- replace() �Լ� : ���� �Ǵ� ���ڿ� �� ü
-- replace(��ü�ϰ� ���� ���ڿ�, ��ü�� ���� ����, ��ü�� ���ڿ�)
select replace('good morning', 'morning', 'evening') from dual;


-- instr() : ���ڿ��� ��ġ���� ã�� �Լ�???????
-- instr(��� ���ڿ�, ã�� ����, ���� ��ġ, ���°)
-- ���ڿ��� 1��°���� �����ؼ� ���� ��o���� ã�ƶ�
select instr('good morning john', 'o', 1) from dual;
/* 1��°�ڸ����� ��, 'g'�������� 'o'�� ã�Ƴ����Ŵ�.
    �ٵ� 2��°�ڸ��� 'o'�� �ֱ� ������ �ٷ� 2�� �˻��� ���� ��.
    
    �ɼǿ� 1�� �ƴ϶� 4���ٸ�,
    4 ��, 'd'�������� 'o'�� ã�� ������ ��.
    �׷��� 'd' �ڿ� �ִ� 'morning'�� 'o'�� �ֱ� ������ 
    �� 'o'�� �ڸ����� �˻��ؿ´�. =7
    �� ��, �˻�������ġ�� 4��°�ΰ� ������, ���ڿ��� ��ġ���� 'd'�������� �����ϴ°� X
    
    �׷��� 4��° 'o'�� �ִ� 'john'�� �ִ� 'o'�� ã�ƿ��� �����Ÿ�
    ����° 'o'�ڸ� = 7�̴ϱ� 8 �̻��� �ɼǰ����� �־���� 4��° 'o'�� ã�� �� �ִ�.
    
    �ٵ� �̷����ϸ� �ʹ� ����ϱ� 
    instr('good morning john','o',1,4) �̰��� �̿�
    ���ڿ����� 'o'�� ã�� �ǵ�, 1��°='g'���� �˻��� �����ؼ� 4��° 'o'�� �ִ�
    ��ġ���� �ٷ� ��ȯ���ش�.
    */
    

select instr('good morning john', 'o', 1, 4) from dual;
-- ����° ��n���� ��ġ��
select instr('good morning john', 'n', 1, 3) from dual;


-- nvl() : null ���� �ٸ� �����ͷ� �����ϴ� �Լ�
select first_name, nvl(commission_pct, 0) commission from employees;


