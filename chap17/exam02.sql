-- 실습 17-6 연관 배열 사용하기
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

-- 실습 17-7 연관 배열 자료형에 레코드 사용하기
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

-- 17-8 %ROWTYPE으로 연관 배열 자료형 지정하기
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

-- 17-9 컬렉션 메서드 사용하기
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
    
-- 1분 복습. 다음 빈칸을 채우며 복습해보세요.
-- 오라클에서는 여러 가지 데이터를 하나의 자료형으로 지정하고 사용하기 위해 직접 정의하는 1. 복합 자료형 을 제공합니다.
-- 2. 레코드 형은 여러 종류의 자료형을 하나의 변수에 저장할 때 사용합니다.
-- 3. 컬렉션 형은 특정 자료형의 데이터 여러개를 한나의 변수에 저장할 때 사용 합니다.
