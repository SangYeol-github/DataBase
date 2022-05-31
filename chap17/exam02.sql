-- �ǽ� 17-6 ���� �迭 ����ϱ�
DECLARE
    TYPE ITAB_EX IS TABLE OF VARCHAR2(20)
INDEX BY PLS_INTEGER;

    TEXT_ARR ITAB_EX;
    
BEGIN
    TEXT_ARR(1) := '1ST DATA';
    TEXT_ARR(2) := '2ND DATA';
    TEXT_ARR(3) := '3RD DATA';
    TEXT_ARR(4) := '4TH DATA';
    
    DBMS_OUTPUT.PUT_LINE('TEXT_ARR(1) : ' || TEXT_ARR(1));
    DBMS_OUTPUT.PUT_LINE('TEXT_ARR(2) : ' || TEXT_ARR(2));
    DBMS_OUTPUT.PUT_LINE('TEXT_ARR(3) : ' || TEXT_ARR(3));
    DBMS_OUTPUT.PUT_LINE('TEXT_ARR(4) : ' || TEXT_ARR(4));
END;
/

-- �ǽ� 17-7 ���� �迭 �ڷ����� ���ڵ� ����ϱ�
DECLARE
    TYPE REC_DEPT IS RECORD(
        DEPTNO DEPT.DEPTNO%TYPE,
        DNAME DEPT.DNAME%TYPE
    );
    
    TYPE ITAB_DEPT IS TABLE OF REC_DEPT
        INDEX BY PLS_INTEGER;
        
    DEPT_ARR ITAB_DEPT;
    IDX PLS_INTEGER := 0;
    
BEGIN
    FOR I IN (SELECT DEPTNO, DNAME FROM DEPT) LOOP
        IDX := IDX + 1;
        DEPT_ARR(IDX).DEPTNO := I.DEPTNO;
        DEPT_ARR(IDX).DNAME := I.DNAME;
        
        dbms_output.put_line(DEPT_ARR(IDX).DEPTNO || ' : ' || DEPT_ARR(IDX).DNAME);
    END LOOP;
END;
/

-- 17-8 %ROWTYPE���� ���� �迭 �ڷ��� �����ϱ�
DECLARE
    TYPE ITAB_DEPT IS TABLE OF DEPT%ROWTYPE
        INDEX BY PLS_INTEGER;
        
    DEPT_ARR ITAB_DEPT;
    IDX PLS_INTEGER := 0;
    
BEGIN
    FOR I IN (SELECT * FROM DEPT) LOOP
        IDX := IDX + 1;
        DEPT_ARR(IDX).DEPTNO := I.DEPTNO;
        DEPT_ARR(IDX).DNAME := I.DNAME;
        DEPT_ARR(IDX).LOC := I.LOC;
        
        dbms_output.put_line(DEPT_ARR(IDX).DEPTNO || ' : ' || DEPT_ARR(IDX).DNAME || ' : ' || DEPT_ARR(IDX).LOC);
    END LOOP;
END;
/

-- 17-9 �÷��� �޼��� ����ϱ�
DECLARE
    TYPE ITAB_EX IS TABLE OF VARCHAR2(20)
INDEX BY PLS_INTEGER;

    TEXT_ARR ITAB_EX;

BEGIN
    TEXT_ARR(1) := '1ST DATA';
    TEXT_ARR(2) := '2ND DATA';
    TEXT_ARR(3) := '3RD DATA';
    TEXT_ARR(50) := '50TH DATA';
    
    DBMS_OUTPUT.PUT_LINE('TEXT_ARR.COUNT : ' || TEXT_ARR.COUNT);
    DBMS_OUTPUT.PUT_LINE('TEXT_ARR.FIRST : ' || TEXT_ARR.FIRST);
    DBMS_OUTPUT.PUT_LINE('TEXT_ARR.LAST : ' || TEXT_ARR.LAST);
    DBMS_OUTPUT.PUT_LINE('TEXT_ARR.PRIOR(50) : ' || TEXT_ARR.PRIOR(50));
    DBMS_OUTPUT.PUT_LINE('TEXT_ARR.NEXT(50) : ' || TEXT_ARR.NEXT(50));
END;
/    
    
-- 1�� ����. ���� ��ĭ�� ä��� �����غ�����.
-- ����Ŭ������ ���� ���� �����͸� �ϳ��� �ڷ������� �����ϰ� ����ϱ� ���� ���� �����ϴ� 1. ���� �ڷ��� �� �����մϴ�.
-- 2. ���ڵ� ���� ���� ������ �ڷ����� �ϳ��� ������ ������ �� ����մϴ�.
-- 3. �÷��� ���� Ư�� �ڷ����� ������ �������� �ѳ��� ������ ������ �� ��� �մϴ�.
