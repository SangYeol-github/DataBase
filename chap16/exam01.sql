-- 실습 16-1 Hello PL/SQL 출력하기
SET SERVEROUTPUT ON; -- 실행 결과를 화면에 출력
BEGIN
 DBMS_OUTPUT.PUT_LINE('Hello, PL/SLQ!');
END;
/

-- 실습 16-2 한 줄 주석 사용하기
DECLARE
V_EMPNO NUMBER(4) := 7788;
V_ENAME VARCHAR2(10);
BEGIN
V_ENAME := 'SCOTT';
-- DBMS_OUTPUT.PUT_LINE('V_EMPNO : ' || V_EMPNO);
DBMS_OUTPUT.PUT_LINE('V_ENAME : ' || V_ENAME);
END;
/

-- 실습 16-3 여러 줄 주석 사용하기
DECLARE
V_EMPNO NUMBER(4) := 7788;
V_ENAME VARCHAR2(10);
BEGIN
V_ENAME := 'SCOTT';
/*
DBMS_OUTPUT.PUT_LINE('V_EMPNO : ' || V_EMPNO);
DBMS_OUTPUT.PUT_LINE('V_ENAME : ' || V_ENAME);
*/
END;
/

-- 1분 복습 다음 빈칸을 채우며 복습해보세요.
-- PL/SQL에서 여러 명령어를 모아 둔 프로그램의 기본 단위를 1. 블록 이라고 합니다.
-- 기본 PL/SQL 1. 블록 은 실행에 사용할 변수, 상수, 커서 등을 선언하는 2. DECLARE 와 조건문, 반복문, SELECT, DML 함수 등 실제
-- 수행할 기능부를 정의하는 3. BEGIN, 그리고 PL/SQL으로 제작한 프로그램의 실행 도중 발생하는 오류를 처리 하는
-- 4. EXCEPTION 로 구성됩니다.
