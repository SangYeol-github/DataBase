-- 실습 12-1 모든 열의 각 자료형을 정의해서 테이블 생성하기
CREATE TABLE EMP_DDL(
EMPNO   NUMBER(4),
ENAME   VARCHAR2(10),
JOB     VARCHAR(9),
MGR     NUMBER(4),
HIREADTE    DATE,
SAL     NUMBER(7,2),
COMM    NUMBER(7,2),
DEPTNO  NUMBER(2)
);

DESC EMP_DDL;

-- 실습 12-2 다른 테이블을 복사하여 테이블 생성하기
CREATE TABLE DEPT_DDL
AS SELECT * FROM DEPT;

DESC DEPT_DDL;

-- 실습 12-3 DEPT_DDL 테이블 전체 조회하기
SELECT * FROM DEPT_DDL;

-- 실습 12-4 다른 테이블의 일부를 복사하여 테이블 생성하기
CREATE TABLE EMP_DDL_30
AS SELECT * FROM EMP
WHERE DEPTNO = 30;
SELECT * FROM EMP_DDL_30;

-- 실습 12-5 다른 테이블을 복사하여 테이블 생성하기
CREATE TABLE EMPDEPT_DDL
AS SELECT E.EMPNO, E.ENAME, E.JOB, E.MGR, E.HIREDATE, E.SAL, E.COMM, D.DEPTNO, D.DNAME, D.LOC
FROM EMP E, DEPT D
WHERE 1<>1;
SELECT * FROM EMPDEPT_DDL;

-- 1분 복습. 다음은 테이블 이름의 생성 규칙입니다. 내용이 참인지 거짓인지 판단해 보세요.
-- 1. 테이블 이름은 문자 또는 숫자로 시작해야 한다. -> 거짓
-- 2. 테이블 이름을 영어는 30자, 한글은 15자까지 사용 가능하다. -> 참
-- 3. 다른 사용자 소유의 테이블이라도 이름은 중복될 수 없다. -> 거짓
-- 4. 테이블 이름은 영문자(한글가능), 숫자(0-9)와 특수문자 $, #, _ 를 사용할 수 있다. -> 참
-- 5. SQL 키워드는 테이블 이름으로 사용할 수 없다. -> 참