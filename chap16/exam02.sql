-- 실습 16-4 변수 선언 및 변수 값 출력하기
DECLARE
    V_EMPNO NUMBER(4) := 7788;
    V_ENAME VARCHAR(10);
BEGIN
    V_ENAME := 'SCOTT';
    DBMS_OUTPUT.PUT_LINE('V_EMPNO : ' || V_EMPNO);
    DBMS_OUTPUT.PUT_LINE('V_ENAME : ' || V_ENAME);
END;
/

-- 실습 16-5 상수에 값을 대입한 후 출력하기
DECLARE
    V_TAX CONSTANT NUMBER(1) := 3;
BEGIN
    DBMS_OUTPUT.PUT_LINE('V_TEX : ' || V_TAX);
END;
/

-- 실습 16-6 변수에 기본값을 설정한 후 출력하기
DECLARE
    V_DEPTNO NUMBER(2) DEFAULT 10;
BEGIN
    DBMS_OUTPUT.PUT_LINE('V_DEPTNO : ' || V_DEPTNO);
END;
/

-- 실습 16-7 변수에 NOT NULL을 설정하고 값을 대입한 후 출력하기
DECLARE
    V_DEPTNO NUMBER(2) NOT NULL := 10;
BEGIN
    DBMS_OUTPUT.PUT_LINE('V_DEPTNO : ' || V_DEPTNO);
END;
/

-- 실습 16-8 변수에 NOT NULL 및 기본값을 설정한 후 출력하기
DECLARE
    V_DEPTNO NUMBER(2) NOT NULL DEFAULT 10;
BEGIN
    DBMS_OUTPUT.PUT_LINE('V_DEPTNO : ' || V_DEPTNO);
END;
/

-- 실습 16-9 참조형(열)의 변수에 값을 대입한 후 출력하기
DECLARE
    V_DEPTNO DEPT.DEPTNO% TYPE := 50;
BEGIN
    DBMS_OUTPUT.PUT_LINE('V_DEPTNO : ' || V_DEPTNO);
END;
/

-- 실습 16-10 참조형(행)의 변수에 값을 대입한 후 출력하기
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

-- 1분 복습. 다음 빈칸을 채우며 복습해 보세요.
-- PL/SQL에서 많이 사용하는 자료형은 숫자, 문자열,날짜 등과 같이 오라클 데이터베이스에서 기본으로 정의해 둔 단일 값을 저장하는 1. 스칼라형 이 있습니다.
-- 2. 참조형 은 오라클 데이터베이스에 존재하는 특성 테이블 열으 ㅣ자료형이나 하나의 행 구조를 참고하는 자료형입니다.
