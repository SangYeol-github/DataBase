-- �ǽ� 16-4 ���� ���� �� ���� �� ����ϱ�
DECLARE
    V_EMPNO NUMBER(4) := 7788;
    V_ENAME VARCHAR(10);
BEGIN
    V_ENAME := 'SCOTT';
    DBMS_OUTPUT.PUT_LINE('V_EMPNO : ' || V_EMPNO);
    DBMS_OUTPUT.PUT_LINE('V_ENAME : ' || V_ENAME);
END;
/

-- �ǽ� 16-5 ����� ���� ������ �� ����ϱ�
DECLARE
    V_TAX CONSTANT NUMBER(1) := 3;
BEGIN
    DBMS_OUTPUT.PUT_LINE('V_TEX : ' || V_TAX);
END;
/

-- �ǽ� 16-6 ������ �⺻���� ������ �� ����ϱ�
DECLARE
    V_DEPTNO NUMBER(2) DEFAULT 10;
BEGIN
    DBMS_OUTPUT.PUT_LINE('V_DEPTNO : ' || V_DEPTNO);
END;
/

-- �ǽ� 16-7 ������ NOT NULL�� �����ϰ� ���� ������ �� ����ϱ�
DECLARE
    V_DEPTNO NUMBER(2) NOT NULL := 10;
BEGIN
    DBMS_OUTPUT.PUT_LINE('V_DEPTNO : ' || V_DEPTNO);
END;
/

-- �ǽ� 16-8 ������ NOT NULL �� �⺻���� ������ �� ����ϱ�
DECLARE
    V_DEPTNO NUMBER(2) NOT NULL DEFAULT 10;
BEGIN
    DBMS_OUTPUT.PUT_LINE('V_DEPTNO : ' || V_DEPTNO);
END;
/

-- �ǽ� 16-9 ������(��)�� ������ ���� ������ �� ����ϱ�
DECLARE
    V_DEPTNO DEPT.DEPTNO% TYPE := 50;
BEGIN
    DBMS_OUTPUT.PUT_LINE('V_DEPTNO : ' || V_DEPTNO);
END;
/

-- �ǽ� 16-10 ������(��)�� ������ ���� ������ �� ����ϱ�
DECLARE
    V_DEPT_ROW DEPT%ROWTYPE;
BEGIN
    SELECT DEPTNO, DNAME, LOC INTO V_DEPT_ROW
        FROM DEPT
     WHERE DEPTNO = 40;
    DBMS_OUTPUT.PUT_LINE('DEPTNO : ' || V_DEPT_ROW.DEPTNO);
    DBMS_OUTPUT.PUT_LINE('DNAME : ' || V_DEPT_ROW.DNAME);
    DBMS_OUTPUT.PUT_LINE('LOC : ' || V_DEPT_ROW.LOC);
END;
/

-- 1�� ����. ���� ��ĭ�� ä��� ������ ������.
-- PL/SQL���� ���� ����ϴ� �ڷ����� ����, ���ڿ�,��¥ ��� ���� ����Ŭ �����ͺ��̽����� �⺻���� ������ �� ���� ���� �����ϴ� 1. ��Į���� �� �ֽ��ϴ�.
-- 2. ������ �� ����Ŭ �����ͺ��̽��� �����ϴ� Ư�� ���̺� ���� ���ڷ����̳� �ϳ��� �� ������ �����ϴ� �ڷ����Դϴ�.
