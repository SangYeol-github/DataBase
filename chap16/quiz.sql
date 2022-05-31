-- Q1. ���� 1���� 10������ ���� �� �����ʰ� ���� Ȧ���� ����ϴ� PL/SQL ���α׷��� �ۼ��غ�����.
SET SERVEROUTPUT ON;
BEGIN
    FOR I IN 0..10 LOOP
         CONTINUE WHEN MOD(I, 2) = 0;
         DBMS_OUTPUT.PUT_LINE('���� I�� �� : ' || I);
    END LOOP;
END;
/

-- Q2. DEPT ���̺��� DEPTNO�� �ڷ����� ���� ���� V_DEPTNO�� �����մϴ�. �׸��� V_DEPTNO �������� 10, 20, 30, 40�� �������� ��
-- ������ ���� �μ� �̸��� ����ϴ� ���α׷��� �ۼ��� ������. �� �μ� ��ȣ�� 10, 20, 30, 40�� �ƴϸ� N/A�� ����մϴ�.
DECLARE
    V_DEPTNO DEPT.DEPTNO%TYPE := 10;
BEGIN
    CASE V_DEPTNO
        WHEN 10 THEN DBMS_OUTPUT.PUT_LINE('DNAME : ACCOUNTING');
        WHEN 20 THEN DBMS_OUTPUT.PUT_LINE('DNAME : RESEARCH');
        WHEN 30 THEN DBMS_OUTPUT.PUT_LINE('DNAME : SALES');
        WHEN 40 THEN DBMS_OUTPUT.PUT_LINE('DNAME : OPERATIONS');
        ELSE DBMS_OUTPUT.PUT_LINE('DNAME : N/A');
    END CASE;
END;
/