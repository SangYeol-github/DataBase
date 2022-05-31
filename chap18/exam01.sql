-- 실습 18-1 SELECT INTO를 사용한 단일행 데이터 저장하기
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

-- 실습 18-2 단일행 데이터를 저장하는 커서 사용하기
DECLARE
-- 커서 데이터를 입력할 변수 선언
V_DEPT_ROW DEPT%ROWTYPE;

-- 명시적 커서 선언(DECLARATION)
CURSOR C1 IS
    SELECT DEPTNO, DNAME, LOC
        FROM DEPT
     WHERE DEPTNO = 40;
     
BEGIN
-- 커서 열기(OPEN)
OPEN C1;

-- 커서로부터 읽어온 데이터 사용(FETCH)
FETCH C1 INTO V_DEPT_ROW;
DBMS_OUTPUT.PUT_LINE('DEPTNO : ' || V_DEPT_ROW.DEPTNO);
DBMS_OUTPUT.PUT_LINE('DNAEM : ' || V_DEPT_ROW.DNAME);
DBMS_OUTPUT.PUT_LINE('LOC : ' || V_DEPT_ROW.LOC);

-- 커서 닫기(CLOSE)
CLOSE C1;

END;
/

-- 18-3 여러 행의 데이터를 커서에 저장하여 사용하기(LOOP문 사용)
DECLARE
-- 커서 데이터를 입력할 변수 선언
V_DEPT_ROW DEPT%ROWTYPE;

-- 명시적 커서 선언(DECLARATION)
CURSOR C1 IS
    SELECT DEPTNO, DNAME, LOC
        FROM DEPT;
     
BEGIN
-- 커서 열기(OPEN)
OPEN C1;

LOOP
    -- 커서로부터 읽어온 데이터 사용(FETCH)
    FETCH C1 INTO V_DEPT_ROW;
    
    -- 커서의 모든 행을 읽어오기 위해 %NOTFOUND 속성 지정
    EXIT WHEN C1%NOTFOUND;
    
DBMS_OUTPUT.PUT_LINE('DEPTNO : ' || V_DEPT_ROW.DEPTNO || ' DNAME : ' || V_DEPT_ROW.DNAME || ' LOC : ' || V_DEPT_ROW.LOC);

END LOOP;

-- 커서 닫기(CLOSE)
CLOSE C1;

END;
/

-- 실습 18-4 FOR LOOP문을 활용하여 커서 사용하기
DECLARE

-- 명시적 커서 선언(DECLARATION)
CURSOR C1 IS
    SELECT DEPTNO, DNAME, LOC
        FROM DEPT;
     
BEGIN
    -- 커서 FOR LOOP 시작 (자동 OPEN, FETCH, CLOSE)
    FOR C1_REC IN C1 LOOP
        DBMS_OUTPUT.PUT_LINE('DEPTNO : ' || C1_REC.DEPTNO || ' DNAME : ' || C1_REC.DNAME || ' LOC : ' || C1_REC.LOC);

END LOOP;

END;
/

-- 실습 18-5 파라미터를 사용하는 커서 알아보기
DECLARE
-- 커서 데이터를 입력할 변수 선언
V_DEPT_ROW DEPT%ROWTYPE;

-- 명시적 커서 선언(DECLARATION)
CURSOR C1 (P_DEPTNO DEPT.DEPTNO%TYPE) IS
    SELECT DEPTNO, DNAME, LOC
        FROM DEPT
     WHERE DEPTNO = P_DEPTNO;
     
BEGIN
    -- 10번 부서 처리를 위해 커서 사용
    OPEN C1(10);    
        LOOP
            FETCH C1 INTO V_DEPT_ROW;
            EXIT WHEN C1%NOTFOUND;
            DBMS_OUTPUT.PUT_LINE('10번 부서 - DEPTNO : ' || V_DEPT_ROW.DEPTNO || ' DNAME : ' || V_DEPT_ROW.DNAME || ' LOC : ' || V_DEPT_ROW.LOC);

    END LOOP;
    CLOSE C1;
    
    -- 20번 부서 처리를 위해 커서 사용
    OPEN C1(20);    
        LOOP
            FETCH C1 INTO V_DEPT_ROW;
            EXIT WHEN C1%NOTFOUND;
            DBMS_OUTPUT.PUT_LINE('10번 부서 - DEPTNO : ' || V_DEPT_ROW.DEPTNO || ' DNAME : ' || V_DEPT_ROW.DNAME || ' LOC : ' || V_DEPT_ROW.LOC);

    END LOOP;
    CLOSE C1;
    
END;
/

-- 실습 18-6 커서에 사용할 파라미터 입력받기
DECLARE
    -- 사용자가 입력한 부서 번호를 저장하는 변수 선언
    V_DEPTNO DEPT.DEPTNO%TYPE;
    
    -- 명시적 커서 선언(DECLARATION)
    CURSOR C1(P_DEPTNO DEPT.DEPTNO%TYPE) IS
     SELECT DEPTNO, DNAME, LOC
        FROM DEPT
     WHERE DEPTNO = P_DEPTNO;   
     
BEGIN
    -- INPUT_DEPTNO에 부서 번호를 입력 받고 V_DEPTNO에 대입
    V_DEPTNO := &INPUT_DEPTNO;
    -- 커서 FOR LOOP 시작. C1 커서에 V_DEPTNO를 대입
    FOR C1_REC IN C1(V_DEPTNO) LOOP
        DBMS_OUTPUT.PUT_LINE('DEPTNO : ' || C1_REC.DEPTNO || ' DNAME : ' || C1_REC.DNAME || ' LOC : ' || C1_REC.LOC);

END LOOP;

END;
/

-- 실습 18-7 묵시적 커서의 속성 사용하기
BEGIN
    UPDATE DEPT SET DNAME = 'DATABASE'
        WHERE DEPTNO = 50;
        
    DBMS_OUTPUT.PUT_LINE('갱신된 행의 수 : ' || SQL%ROWCOUNT);
    IF (SQL%FOUND) THEN
        DBMS_OUTPUT.PUT_LINE('갱신 대상 행 존재 여부 : TRUE');
    ELSE
        DBMS_OUTPUT.PUT_LINE('갱신 대상 행 존재 여부 : FALSE');
    END IF;
    
     IF (SQL%ISOPEN) THEN
        DBMS_OUTPUT.PUT_LINE('커서의 OPEN 여부 : TRUE');
    ELSE
        DBMS_OUTPUT.PUT_LINE('커서의 OPEN 여부 : FALSE');
    END IF;
END;
/
-- 1분 복습. 다음 빈칸을 채우며 복습해 보세요.
-- 오라클에서는 SELECT문과 DML 명령어의 실행 정보와 결과를 사용하기 위해 1. 커서 라는 메모리 공간을 사용할 수 있습니다.
-- 1. 커서 에는 두 가지 종류가 존재하는데요. 사용자가 직접 선언하여 사용하는
-- 2. 명시적 커서 , 그리고 별다른 선언 없이 SQL문을 사용했을 때 오라클에서 자동으로 선언 되는
-- 3. 묵시적 커서 가 있습니다.
