-- 실습 19-19 함수 생성하기
CREATE OR REPLACE FUNCTION FUNC_AFTERTAX(
    SAL IN NUMBER
)
RETURN NUMBER
IS
    TAX NUMBER := 0.05;
BEGIN
    RETURN (ROUND(SAL - (SAL * TAX)));
END FUNC_AFTERTAX;
/

-- 실습 19-20 PL/SQL에서 함수 사용하기
DECLARE
    AFTERTAX NUMBER;
BEGIN
    AFTERTAX := FUNC_AFTERTAX(3000);
    DBMS_OUTPUT.PUT_LINE('AFTER-TAX INCOME : ' || AFTERTAX);
END;
/

-- 실습 19-21 SQL에서 함수 사용하기
SELECT FUNC_AFTERTAX(3000) FROM DUAL;

-- 실습 19-22 함수에 테이블 데이터 사용하기
SELECT EMPNO, ENAME, SAL, FUNC_AFTERTAX(SAL) AS AFTERTAX FROM EMP;

-- 실습 19-23 함수 삭제하기
DROP FUNCTION FUNC_AFTERTAX;

-- 1분 복습. 다음은 함수에 대한 설명입니다. 틀린 내용을 골라 보세요.
-- 1. SQL문에서 직접 실행 가능하다.
-- 2. IN, OUT, IN OUT모드를 모두 사용할 수 있다.  --> 정답
-- 3. 반드시 하나의 값을 반환해야 한다.
-- 4. 값을 반환할 때는 RETURN절 또는 RETURN문을 사용해야 한다.
