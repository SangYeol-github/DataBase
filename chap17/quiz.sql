-- Q1. 다음과 같은 결과가 나오도록 PL/SQL문을 작성해 보세요.
-- 1. EMP 테이블과 같은 열 구조를 가지는 빈 테이블 EMP_RECORD를 생성하는 SQL문을 작성해 보세요.
-- 2. EMP_RECORD 테이블에 레코드를 사용하여 새로운 사원 정보를 다음과 같이 삽입하는 PL/SQL 프로그램을 작성해 보세요.

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

-- Q2. EMP 테이블을 구성하는 모든 열을 저장할 수 있는 레코드를 활용하면 연관 배열을 작성해 보세요. 그리고 저장된 연관 배열의 내용을 다음과 같이 출력해 보세요.
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