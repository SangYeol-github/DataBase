-- Q1. ����� Ŀ���� ����Ͽ� EMP ���̺��� ��ü �����͸� ��ȸ�� �� Ŀ�� ���� �����Ͱ� ������ ���� ��µǵ���
-- PL/SQL���� �ۼ��غ�����.
-- 1. LOOP�� ����� ���
-- 2. FOR LOOP�� ����� ���
-- 1
DECLARE
    V_EMP_ROW EMP%ROWTYPE;
    CURSOR C1 IS
    SELECT * FROM EMP;
BEGIN
OPEN C1;
LOOP
    FETCH C1 INTO V_EMP_ROW;
    EXIT WHEN C1%NOTFOUND;
    DBMS_OUTPUT.PUT_LINE('EMPNO : '    || V_EMP_ROW.EMPNO
                       || ', ENAME : '    || V_EMP_ROW.ENAME
                       || ', JOB : '      || V_EMP_ROW.JOB
                       || ', SAL : '      || V_EMP_ROW.SAL
                       || ', DEPTNO : '   || V_EMP_ROW.DEPTNO		
		       );
   END LOOP;
   
   CLOSE c1;
END;
/

-- 2
DECLARE
   -- ����� Ŀ�� ����(Declaration)
   CURSOR c1 IS
      SELECT *
        FROM EMP;
BEGIN
   -- Ŀ�� FOR LOOP ���� (�ڵ� Open, Fetch, Close)
   FOR c1_rec IN c1 LOOP
      DBMS_OUTPUT.PUT_LINE('EMPNO : '    || c1_rec.EMPNO
                      || ', ENAME : '    || c1_rec.ENAME
                      || ', JOB : '      || c1_rec.JOB
                      || ', SAL : '      || c1_rec.SAL
                      || ', DEPTNO : '   || c1_rec.DEPTNO);
   END LOOP;
END;
/


-- Q2. ���� PL/SQL���� ���� �� �߻��ϴ� ���ܸ� ���� ����� ���� ó���ϴ� ���� ó���θ� �ϼ��ϼ���.
DECLARE 
    V_WRONG DATE;
BEGIN
    SELECT ENAME INTO V_WRONG
        FROM EMP
     WHERE EMPNO = 7369;
     
     DBMS_OUTPUT.PUT_LINE('���ܰ� �߻��ϸ� ���� ������ ������� �ʽ��ϴ�.'); 
     
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('������ �߻��Ͽ����ϴ�.' ||
            TO_CHAR(SYSDATE,'[YYYY"��"MM"��"DD"��" HH24"��"mm"��"SS"��"]'));
        DBMS_OUTPUT.PUT_LINE('���� ó�� : ���� ���� �� ���� �߻�');
        DBMS_OUTPUT.PUT_LINE('SQLCODE : ' || TO_CHAR(SQLCODE));
        DBMS_OUTPUT.PUT_LINE('SQLERRM : ' || SQLERRM);
END;
/