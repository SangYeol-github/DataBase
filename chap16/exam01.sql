-- �ǽ� 16-1 Hello PL/SQL ����ϱ�
SET SERVEROUTPUT ON; -- ���� ����� ȭ�鿡 ���
BEGIN
 DBMS_OUTPUT.PUT_LINE('Hello, PL/SLQ!');
END;
/

-- �ǽ� 16-2 �� �� �ּ� ����ϱ�
DECLARE
V_EMPNO NUMBER(4) := 7788;
V_ENAME VARCHAR2(10);
BEGIN
V_ENAME := 'SCOTT';
-- DBMS_OUTPUT.PUT_LINE('V_EMPNO : ' || V_EMPNO);
DBMS_OUTPUT.PUT_LINE('V_ENAME : ' || V_ENAME);
END;
/

-- �ǽ� 16-3 ���� �� �ּ� ����ϱ�
DECLARE
V_EMPNO NUMBER(4) := 7788;
V_ENAME VARCHAR2(10);
BEGIN
V_ENAME := 'SCOTT';
/*
DBMS_OUTPUT.PUT_LINE('V_EMPNO : ' || V_EMPNO);
DBMS_OUTPUT.PUT_LINE('V_ENAME : ' || V_ENAME);
*/
END;
/

-- 1�� ���� ���� ��ĭ�� ä��� �����غ�����.
-- PL/SQL���� ���� ��ɾ ��� �� ���α׷��� �⺻ ������ 1. ��� �̶�� �մϴ�.
-- �⺻ PL/SQL 1. ��� �� ���࿡ ����� ����, ���, Ŀ�� ���� �����ϴ� 2. DECLARE �� ���ǹ�, �ݺ���, SELECT, DML �Լ� �� ����
-- ������ ��ɺθ� �����ϴ� 3. BEGIN, �׸��� PL/SQL���� ������ ���α׷��� ���� ���� �߻��ϴ� ������ ó�� �ϴ�
-- 4. EXCEPTION �� �����˴ϴ�.
