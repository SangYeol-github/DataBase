-- 실습 19-1 프록지서 생성하기
CREATE OR REPLACE PROCEDURE PRO_NOPARAM
IS
    V_EMPNO NUMBER(4) := 7788;
    V_ENAME VARCHAR2(10);
BEGIN
    V_ENAME := 'SCOTT';
    DBMS_OUTPUT.PUT_LINE('V_EMPNO : ' || V_EMPNO);
    DBMS_OUTPUT.PUT_LINE('V_ENAME : ' || V_ENAME);
END;
/

-- 실습 19-2 생성한 프로시저 실행하기
SET SERVEROUTPUT ON;
EXECUTE pro_noparam;

-- 실습 19-3 익명 블록에서 프로시저 실행하기
BEGIN
    PRO_NOPARAM;
END;
/

-- 실습 19-4 USER_SOURCE를 통해 프로시저 확인하기(토드)
SELECT * FROM USER_SOURCE
WHERE NAME = 'PRO_NOPARAM';

-- 실습 19-5 USER_SOURCE를 통해 프로시저 확인하기(SQL*PLUS)
SELECT TEXT
    FROM USER_SOURCE
WHERE NAME = 'PRO_NOPARM';

-- 실습 19-6 프로시저 삭제하기
DROP PROCEDURE PRO_NOPARAM;

-- 실습 19-7 프로시저에 파라미터 지정하기
CREATE OR REPLACE PROCEDURE PRO_PARAM_IN
(
    PARAM1 IN NUMBER,
    PARAM2 NUMBER,
    PARAM3 NUMBER := 3,
    PARAM4 NUMBER DEFAULT 4
)
IS

BEGIN
    DBMS_OUTPUT.PUT_LINE('PARAM1 : ' || PARAM1);
    DBMS_OUTPUT.PUT_LINE('PARAM2 : ' || PARAM2);
    DBMS_OUTPUT.PUT_LINE('PARAM3 : ' || PARAM3);
    DBMS_OUTPUT.PUT_LINE('PARAM4 : ' || PARAM4);
END;
/

-- 실습 19-8 파라미터를 입력하여 프로시저 사용하기
EXECUTE PRO_PARAM_IN(1, 2, 9, 8);

-- 실습 19-9 기본값이 지정된 파라미터 입력을 제외하고 프로시저 사용하기
EXECUTE PRO_PARAM_IN(1, 2);

-- 실습 19-10 실행에 필요한 개수보다 적은 파라미터를 입력하여 프로시저 실행하기
EXECUTE PRO_PARAM_IN(1);

-- 실습 19-11 파라미터 이름을 활용하여 프로시저에 값 입력하기
EXECUTE PRO_PARAM_IN(PARAM1 => 10, PARAM2 => 20);

-- 실습 19-12 OUT 모드 파라미터 정의하기
CREATE OR REPLACE PROCEDURE PRO_PARAM_OUT
(
    IN_EMPNO IN EMP.EMPNO%TYPE,
    OUT_ENAME OUT EMP.ENAME%TYPE,
    OUT_SAL OUT EMP.SAL%TYPE
)
IS

BEGIN
    SELECT ENAME, SAL INTO OUT_ENAME, OUT_SAL
        FROM EMP
     WHERE EMPNO = IN_EMPNO;
END PRO_PARAM_OUT;
/

-- 실습 19-13 OUT 모드 파라미터 사용하기
DECLARE
    V_ENAME EMP.ENAME%TYPE;
    V_SAL EMP.SAL%TYPE;
BEGIN
    PRO_PARAM_OUT(7788, V_ENAME, V_SAL);
    DBMS_OUTPUT.PUT_LINE('ENAME : ' || V_ENAME);
    DBMS_OUTPUT.PUT_LINE('SAL : ' || V_SAL);
END;
/

-- 실습 19-14 IN OUT 모드 파라미터 정의하기
CREATE OR REPLACE PROCEDURE PRO_PARAM_INOUT
(
    INOUT_NO IN OUT NUMBER
)
IS

BEGIN
    INOUT_NO := INOUT_NO * 2;
END PRO_PARAM_INOUT;
/

-- 실습 19-15 IN OUT 모드 파라미터 사용하기
DECLARE
    NO NUMBER;
BEGIN
    NO := 5;
    PRO_PARAM_INOUT(NO);
    DBMS_OUTPUT.PUT_LINE('NO : ' || NO);
END;
/

-- 1분 복습. 다음은 파라미터를 갖는 프로시저의 여러 모드와 그 설명입니다. 개념에 알맞은 설명을 연결해 보세요.
-- 1. IN      (1) 호출할 때 값을 입력받은 후 실행 결과 값을 반환합니다.
-- 2. OUT     (2) 지정하지 않으면 기본값으로 프로시저를 호출할 때 값을 입력받습니다.
-- 3. IN OUT  (3) 호출할 때 값을 반환합니다.
-- 1. -> (2)
-- 2. -> (3)
-- 3. -> (1)

-- 실습 19-16 생성할 때 오류가 발생하는 프로시저 알아보기
CREATE OR REPLACE PROCEDURE PRO_ERR
IS
    ERR_NO NUMBER;
BEGIN
    ERR_NO = 100;
    DBMS_OUTPUT.PUT_LINE('ERR_NO : ' || ERR_NO);
END PRO_ERR;
/

-- 실습 19-17 SHOW ERRORS로 오류 확인
SHOW ERRORS;

-- 실습 19-18 USER_ERRORS로 오류 확인하기
SELECT * FROM USER_ERRORS
WHERE NAME = 'PRO_ERR';