-- 실습 10-15 DEPT 테이블을 복사해서 DEPT_TEMP2 테이블 만들기
CREATE TABLE DEPT_TEMP2
    AS SELECT * FROM DEPT;

SELECT * FROM DEPT_TEMP2;

-- 실습 10-16 DEPT_TEMP2 테이블 업데이트하기
UPDATE DEPT_TEMP2
    SET LOC = 'SEOUL';

 SELECT * FROM DEPT_TEMP2;
 
 -- 실습 10-17 ROLLBACK으로 테이블 내용을 이전 상태로 되돌리기
 ROLLBACK;
 
 -- 실습 10-18 테이블 데이터 중 일부분만 수정하기
 UPDATE DEPT_TEMP2
    SET DNAME = 'DATABASE',
        LOC = 'SEOUL'
WHERE DEPTNO = 40;

SELECT * FROM DEPT_TEMP2;

-- 1분 복습. EMP_TEMP 테이블의 사원들 중에서 급여가 2500이하인 사원만 추가 수당을 50으로 수정하는 다음 코드를 채워보세요.
UPDATE EMP_TEMP
    SET COMM = 50
WHERE SAL > 2500;

SELECT * FROM EMP_TEMP;

-- 실습 10-19 서브쿼리로 데이터 일부분 수정하기
UPDATE DEPT_TEMP2
    SET(DNAME, LOC) = (SELECT DNAME, LOC
                        FROM DEPT
                        WHERE DEPTNO = 40)
WHERE DEPTNO = 40;

SELECT * FROM DEPT_TEMP2;

-- 실습 10-20 서브쿼리로 데이터 일부분 수정하기
UPDATE DEPT_TEMP2
    SET DNAME = (SELECT DNAME
                        FROM DEPT
                        WHERE DEPTNO = 40),
        LOC = (SELECT LOC
                        FROM DEPT
                        WHERE DEPTNO = 40)                   
WHERE DEPTNO = 40;

SELECT * FROM DEPT_TEMP2;

-- 실습 10-21 UPDATE문의 WHERE절에 서브쿼리 사용하기
UPDATE DEPT_TEMP2
    SET LOC = 'SEOUL'
    WHERE DEPTNO = (SELECT DEPTNO
                    FROM DEPT_TEMP2
                    WHERE DNAME = 'OPERATIONS');
SELECT * FROM DEPT_TEMP2;

 