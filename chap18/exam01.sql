-- �ǽ� 18-1 SELECT INTO�� ����� ������ ������ �����ϱ�
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

-- �ǽ� 18-2 ������ �����͸� �����ϴ� Ŀ�� ����ϱ�
DECLARE
-- Ŀ�� �����͸� �Է��� ���� ����
V_DEPT_ROW DEPT%ROWTYPE;

-- ����� Ŀ�� ����(DECLARATION)
CURSOR C1 IS
    SELECT DEPTNO, DNAME, LOC
        FROM DEPT
     WHERE DEPTNO = 40;
     
BEGIN
-- Ŀ�� ����(OPEN)
OPEN C1;

-- Ŀ���κ��� �о�� ������ ���(FETCH)
FETCH C1 INTO V_DEPT_ROW;
DBMS_OUTPUT.PUT_LINE('DEPTNO : ' || V_DEPT_ROW.DEPTNO);
DBMS_OUTPUT.PUT_LINE('DNAEM : ' || V_DEPT_ROW.DNAME);
DBMS_OUTPUT.PUT_LINE('LOC : ' || V_DEPT_ROW.LOC);

-- Ŀ�� �ݱ�(CLOSE)
CLOSE C1;

END;
/

-- 18-3 ���� ���� �����͸� Ŀ���� �����Ͽ� ����ϱ�(LOOP�� ���)
DECLARE
-- Ŀ�� �����͸� �Է��� ���� ����
V_DEPT_ROW DEPT%ROWTYPE;

-- ����� Ŀ�� ����(DECLARATION)
CURSOR C1 IS
    SELECT DEPTNO, DNAME, LOC
        FROM DEPT;
     
BEGIN
-- Ŀ�� ����(OPEN)
OPEN C1;

LOOP
    -- Ŀ���κ��� �о�� ������ ���(FETCH)
    FETCH C1 INTO V_DEPT_ROW;
    
    -- Ŀ���� ��� ���� �о���� ���� %NOTFOUND �Ӽ� ����
    EXIT WHEN C1%NOTFOUND;
    
DBMS_OUTPUT.PUT_LINE('DEPTNO : ' || V_DEPT_ROW.DEPTNO || ' DNAME : ' || V_DEPT_ROW.DNAME || ' LOC : ' || V_DEPT_ROW.LOC);

END LOOP;

-- Ŀ�� �ݱ�(CLOSE)
CLOSE C1;

END;
/

-- �ǽ� 18-4 FOR LOOP���� Ȱ���Ͽ� Ŀ�� ����ϱ�
DECLARE

-- ����� Ŀ�� ����(DECLARATION)
CURSOR C1 IS
    SELECT DEPTNO, DNAME, LOC
        FROM DEPT;
     
BEGIN
    -- Ŀ�� FOR LOOP ���� (�ڵ� OPEN, FETCH, CLOSE)
    FOR C1_REC IN C1 LOOP
        DBMS_OUTPUT.PUT_LINE('DEPTNO : ' || C1_REC.DEPTNO || ' DNAME : ' || C1_REC.DNAME || ' LOC : ' || C1_REC.LOC);

END LOOP;

END;
/

-- �ǽ� 18-5 �Ķ���͸� ����ϴ� Ŀ�� �˾ƺ���
DECLARE
-- Ŀ�� �����͸� �Է��� ���� ����
V_DEPT_ROW DEPT%ROWTYPE;

-- ����� Ŀ�� ����(DECLARATION)
CURSOR C1 (P_DEPTNO DEPT.DEPTNO%TYPE) IS
    SELECT DEPTNO, DNAME, LOC
        FROM DEPT
     WHERE DEPTNO = P_DEPTNO;
     
BEGIN
    -- 10�� �μ� ó���� ���� Ŀ�� ���
    OPEN C1(10);    
        LOOP
            FETCH C1 INTO V_DEPT_ROW;
            EXIT WHEN C1%NOTFOUND;
            DBMS_OUTPUT.PUT_LINE('10�� �μ� - DEPTNO : ' || V_DEPT_ROW.DEPTNO || ' DNAME : ' || V_DEPT_ROW.DNAME || ' LOC : ' || V_DEPT_ROW.LOC);

    END LOOP;
    CLOSE C1;
    
    -- 20�� �μ� ó���� ���� Ŀ�� ���
    OPEN C1(20);    
        LOOP
            FETCH C1 INTO V_DEPT_ROW;
            EXIT WHEN C1%NOTFOUND;
            DBMS_OUTPUT.PUT_LINE('10�� �μ� - DEPTNO : ' || V_DEPT_ROW.DEPTNO || ' DNAME : ' || V_DEPT_ROW.DNAME || ' LOC : ' || V_DEPT_ROW.LOC);

    END LOOP;
    CLOSE C1;
    
END;
/

-- �ǽ� 18-6 Ŀ���� ����� �Ķ���� �Է¹ޱ�
DECLARE
    -- ����ڰ� �Է��� �μ� ��ȣ�� �����ϴ� ���� ����
    V_DEPTNO DEPT.DEPTNO%TYPE;
    
    -- ����� Ŀ�� ����(DECLARATION)
    CURSOR C1(P_DEPTNO DEPT.DEPTNO%TYPE) IS
     SELECT DEPTNO, DNAME, LOC
        FROM DEPT
     WHERE DEPTNO = P_DEPTNO;   
     
BEGIN
    -- INPUT_DEPTNO�� �μ� ��ȣ�� �Է� �ް� V_DEPTNO�� ����
    V_DEPTNO := &INPUT_DEPTNO;
    -- Ŀ�� FOR LOOP ����. C1 Ŀ���� V_DEPTNO�� ����
    FOR C1_REC IN C1(V_DEPTNO) LOOP
        DBMS_OUTPUT.PUT_LINE('DEPTNO : ' || C1_REC.DEPTNO || ' DNAME : ' || C1_REC.DNAME || ' LOC : ' || C1_REC.LOC);

END LOOP;

END;
/

-- �ǽ� 18-7 ������ Ŀ���� �Ӽ� ����ϱ�
BEGIN
    UPDATE DEPT SET DNAME = 'DATABASE'
        WHERE DEPTNO = 50;
        
    DBMS_OUTPUT.PUT_LINE('���ŵ� ���� �� : ' || SQL%ROWCOUNT);
    IF (SQL%FOUND) THEN
        DBMS_OUTPUT.PUT_LINE('���� ��� �� ���� ���� : TRUE');
    ELSE
        DBMS_OUTPUT.PUT_LINE('���� ��� �� ���� ���� : FALSE');
    END IF;
    
     IF (SQL%ISOPEN) THEN
        DBMS_OUTPUT.PUT_LINE('Ŀ���� OPEN ���� : TRUE');
    ELSE
        DBMS_OUTPUT.PUT_LINE('Ŀ���� OPEN ���� : FALSE');
    END IF;
END;
/
-- 1�� ����. ���� ��ĭ�� ä��� ������ ������.
-- ����Ŭ������ SELECT���� DML ��ɾ��� ���� ������ ����� ����ϱ� ���� 1. Ŀ�� ��� �޸� ������ ����� �� �ֽ��ϴ�.
-- 1. Ŀ�� ���� �� ���� ������ �����ϴµ���. ����ڰ� ���� �����Ͽ� ����ϴ�
-- 2. ����� Ŀ�� , �׸��� ���ٸ� ���� ���� SQL���� ������� �� ����Ŭ���� �ڵ����� ���� �Ǵ�
-- 3. ������ Ŀ�� �� �ֽ��ϴ�.
