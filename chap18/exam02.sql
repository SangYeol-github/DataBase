-- 실습 18-8 예외가 발생하는 PL/SQL
DECLARE
    V_WRONG NUMBER;
BEGIN
    SELECT DNAME INTO V_WRONG
        FROM DEPT
     WHERE DEPTNO = 10;
END;
/

-- 실습 18-9 예외를 처리하는 PL/SQL(예외 처리 추가)
DECLARE
    V_WRONG NUMBER;
BEGIN
    SELECT DNAME INTO V_WRONG
        FROM DEPT
     WHERE DEPTNO = 10;
EXCEPTION
    WHEN VALUE_ERROR THEN
        DBMS_OUTPUT.PUT_LINE('예외 처리 : 수치 또는 값 오류 발생');
END;
/

-- 실습 18-10 예외 발생 후의 코드 실행 여부 확인하기
DECLARE
    V_WRONG NUMBER;
BEGIN
    SELECT DNAME INTO V_WRONG
        FROM DEPT
     WHERE DEPTNO = 10;
    DBMS_OUTPUT.PUT_LINE('예외가 발생하면 다음 문장은 실행되지 않습니다.'); 
EXCEPTION
    WHEN VALUE_ERROR THEN
        DBMS_OUTPUT.PUT_LINE('예외 처리 : 수치 또는 값 오류 발생');
END;
/

-- 실습 18-11 사전 정의된 예외 사용하기
DECLARE
    V_WRONG NUMBER;
BEGIN
    SELECT DNAME INTO V_WRONG
        FROM DEPT
     WHERE DEPTNO = 10;
    DBMS_OUTPUT.PUT_LINE('예외가 발생하면 다음 문장은 실행되지 않습니다.'); 
EXCEPTION
    WHEN TOO_MANY_ROWS THEN
        DBMS_OUTPUT.PUT_LINE('예외 처리 : 요구보다 많은 행 추출 오류 발생');
    WHEN VALUE_ERROR THEN    
        DBMS_OUTPUT.PUT_LINE('예외 처리 : 수치 또는 값 오류 발생');
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('예외 처리 : 사전 정의 외 오류 발생');
END;
/

-- 실습 18-12 오류 코드와 오류 메시지 사용하기
DECLARE
    V_WRONG NUMBER;
BEGIN
    SELECT DNAME INTO V_WRONG
        FROM DEPT
     WHERE DEPTNO = 10;
    DBMS_OUTPUT.PUT_LINE('예외가 발생하면 다음 문장은 실행되지 않습니다.'); 
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('예외 처리 : 사전 정의 외 오류 발생');
        DBMS_OUTPUT.PUT_LINE('SQLCODE : ' || TO_CHAR(SQLCODE));
        DBMS_OUTPUT.PUT_LINE('SQLERRM : ' || SQLERRM);
END;
/
