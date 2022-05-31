-- Q1. ������ ���� ����� �������� PL/SQL���� �ۼ��� ������.
-- 1. EMP ���̺�� ���� �� ������ ������ �� ���̺� EMP_RECORD�� �����ϴ� SQL���� �ۼ��� ������.
-- 2. EMP_RECORD ���̺� ���ڵ带 ����Ͽ� ���ο� ��� ������ ������ ���� �����ϴ� PL/SQL ���α׷��� �ۼ��� ������.

-- 1
CREATE TABLE EMP_RECORD
    AS SELECT * FROM EMP
    WHERE 1 <> 1;

--2
DECLARE
    TYPE REC_EMP IS RECORD(
        EMPNO   EMP.EMPNO%TYPE NOT NULL := 9999,
        ENAME   EMP.ENAME%TYPE,
        JOB     EMP.JOB%TYPE,
        MGR     EMP.MGR%TYPE,
        HIREDATE EMP.HIREDATE%TYPE,
        SAL     EMP.SAL%TYPE,
        COMM    EMP.COMM%TYPE,
        DEPTNO  EMP.DEPTNO%TYPE
    );
    EMP_REC REC_EMP;
BEGIN
    EMP_REC.EMPNO   := 1111;
    EMP_REC.ENAME   := 'TEST_USER';
    EMP_REC.JOB     := 'TEST_JOB';
    EMP_REC.MGR     := NULL;
    EMP_REC.HIREDATE := TO_DATE('20180301','YYYYMMDD');
    EMP_REC.SAL     := 3000;
    EMP_REC.COMM    := NULL;
    EMP_REC.DEPTNO  := 40;
    
    INSERT INTO EMP_RECORD
    VALUES EMP_REC;
END;
/

-- Q2. EMP ���̺��� �����ϴ� ��� ���� ������ �� �ִ� ���ڵ带 Ȱ���ϸ� ���� �迭�� �ۼ��� ������. �׸��� ����� ���� �迭�� ������ ������ ���� ����� ������.
DECLARE
    TYPE ITAB_EMP IS TABLE OF EMP%ROWTYPE
        INDEX BY PLS_INTEGER;
    EMP_ARR ITAB_EMP;
    IDX PLS_INTEGER := 0;
BEGIN
    FOR I IN(SELECT * FROM EMP) LOOP
        IDX := IDX + 1;
        EMP_ARR(IDX).EMPNO      := I.EMPNO;
        EMP_ARR(IDX).ENAME      := I.ENAME;
        EMP_ARR(IDX).JOB        := I.JOB;
        EMP_ARR(IDX).MGR        := I.MGR;
        EMP_ARR(IDX).HIREDATE   := I.HIREDATE;
        EMP_ARR(IDX).SAL        := I.SAL;
        EMP_ARR(IDX).COMM       := I.COMM;
        EMP_ARR(IDX).DEPTNO     := I.DEPTNO;
        
        DBMS_OUTPUT.PUT_LINE(
            EMP_ARR(IDX).EMPNO  || ' : ' ||
            EMP_ARR(IDX).ENAME  || ' : ' ||
            EMP_ARR(IDX).JOB    || ' : ' ||
            EMP_ARR(IDX).MGR    || ' : ' ||
            EMP_ARR(IDX).HIREDATE  || ' : ' ||
            EMP_ARR(IDX).SAL    || ' : ' ||
            EMP_ARR(IDX).COMM  || ' : ' ||
            EMP_ARR(IDX).DEPTNO);
    END LOOP;
END;
/