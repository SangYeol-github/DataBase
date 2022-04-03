-- 1분 복습. 
-- 관계형 테이터베이스에서 하나의 작업 또는 밀접하게 연관되어 있는 작업 수행을 위해 나눌 수 없는 최소 수행 단위를 1. 트랜잭션 이라고 합니다.
-- SQL 문법 중 이러한 1. 트랜잭션을 제어하는 데 사용하는 명령어를 2. TCL 라고 합니다.

-- 실습 11-1 DEPT 테이블을 복사해서 DEPT_TCL 테이블 만들기
CREATE TABLE DEPT_TCL
AS SELECT * FROM DEPT;

SELECT * FROM DEPT_TCL;

-- 실습 11-2 DEPT_TCL 테이블에 데이터를 입력, 수정, 삭제하기
INSERT INTO DEPT_TCL VALUES(50, 'DATABASE', 'SEOUL');
UPDATE DEPT_TCL SET LOC = 'BUSAN' WHERE DEPTNO = 40;
DELETE FROM DEPT_TCL WHERE DNAME = 'RESEARCH';
SELECT * FROM DEPT_TCL;

-- 실습 11-3 ROLLBACK으로 명령어 실행 취소하기
ROLLBACK;
SELECT * FROM DEPT_TCL;

-- 실습 11-4 DEPT_TCL 테이블에 데이터를 입력, 수정, 삭제하기
INSERT INTO DEPT_TCL VALUES(50, 'NETWORK', 'SEOUL');
UPDATE DEPT_TCL SET LOC = 'BUSAN' WHERE DEPTNO = 20;
DELETE FROM DEPT_TCL WHERE DEPTNO = 40;
SELECT * FROM DEPT_TCL;

-- 실습 11-5 COMMIT으로 명령어 반영하기
COMMIT;

-- 실습 11-6 토드와 SQL*PLUS로 세션 알아보기
SELECT * FROM DEPT_TCL;

-- 실습 11-7 토드와 SQL*PLUS로 세션 알아보기
DELETE FROM DEPT_TCL
 WHERE DEPTNO = 50;

SELECT * FROM DEPT_TCL;

-- 실습 11-8 토드와 SQL*PLUS로 세션 알아보기
COMMIT;

SELECT * FROM DEPT_TCL;

-- 1분 복습. 오라클 데이터베이스에서의 1. 세션 은 데이터베이스 접속 시작부터 접속이 종료되기까지의 천제 기간을 의미합니다.
-- 하나의 1. 세션 은 여러 SQL문이 하나의 작업 단위로 다뤄지는 여러 개의 트랜잭션으로 구성됩니다. 트랜잭션 작업을 데이터베이스에 영구히
-- 반영할 때 2. COMMIT 명령어를 사용하고 지금까지 한 작업을 취소할 때 3. ROLLBACK 명령어를 사용합니다.
-- 이 명령어를 통해 현재 트랜잭션이 종료될 때까지 다른 1. 세션 에서는 데이터 조작 전 상태의 데이터만 조회할 수 있으며 이러한 특성을
-- 4. 읽기 일관성 이라고 합니다.
