-- Q1. 숫자 1부터 10까지의 숫자 중 오른쪽과 같이 홀수만 출력하는 PL/SQL 프로그램을 작성해보세요.
SET SERVEROUTPUT ON;
BEGIN
    FOR I IN 0..10 LOOP
         CONTINUE WHEN MOD(I, 2) = 0;
         DBMS_OUTPUT.PUT_LINE('현재 I의 값 : ' || I);
    END LOOP;
END;
/

-- Q2. DEPT 테이블의 DEPTNO와 자료형이 같은 변수 V_DEPTNO를 선언합니다. 그리고 V_DEPTNO 변수값에 10, 20, 30, 40을 대입했을 때
-- 다음과 같이 부서 이름을 출력하는 프로그램을 작성해 보세요. 단 부서 번호가 10, 20, 30, 40이 아니면 N/A로 출력합니다.
DECLARE
    V_DEPTNO DEPT.DEPTNO%TYPE := 10;
BEGIN
    CASE V_DEPTNO
        WHEN 10 THEN DBMS_OUTPUT.PUT_LINE('DNAME : ACCOUNTING');
        WHEN 20 THEN DBMS_OUTPUT.PUT_LINE('DNAME : RESEARCH');
        WHEN 30 THEN DBMS_OUTPUT.PUT_LINE('DNAME : SALES');
        WHEN 40 THEN DBMS_OUTPUT.PUT_LINE('DNAME : OPERATIONS');
        ELSE DBMS_OUTPUT.PUT_LINE('DNAME : N/A');
    END CASE;
END;
/