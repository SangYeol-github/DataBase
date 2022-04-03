-- Q1. 다음 두 세션에서 실행하는 순서별 SQL 명령어를 확인하여 번호에 맞는 데이터 상태를 적어 보세요(DEPT_HW 테이블은 DEPT 테이블을 그대로 복사한 테이블이라 가정합니다).
--              세션 A                        세션 B
UPDATE DEPT_HW
SET DNAME = 'DATABASE', LOC='SEOUL'
WHERE DEPTNO = 30;
SELECT * FROM DEPT_HW;                  SELECT * FROM DEPT_HW;
-- ① 현재 세션 A, B에서 조회한 DEPT_HW테이블 30번 부서의 DNAME, LOC열의 데이터 상태를 적어보세요.
-- 답 : 세션 A의 DNAME 내용은 1. DATABASE , LOC 내용은 2. SEOUL /
--      세션 B의 DNAME 내용은 3. SALES , LOC 내용은 4. CHICAGO

                                        UPDATE DEPT_HW
                                        SET DNAME = 'DATABASE', LOC = 'SEOUL'
                                        WHERE DEPTNO = 30;

-- ② 현재 세션 B에서 실행한 UPDATE문 실행 결과를 적어 보세요.
-- 세션 B의 UPDATE 명령이 실행된 후 대기상태(HANG)가 된다. 세션 A의 트랜잭션이
-- 아직 종료되지 않았기 때문이다.
ROLLBACK;

-- ③ 현재 세션 A에서 ROLLBACK 명령어를 사용한 후 세션 B에서 일어나는 변화를 적어보세요.
-- 세션 A의 ROLLBACK 명령이 실행되자마자 세션 B의 UPDATE문이 수행된다. 세션 A
-- 의 트랜잭션에 의한 행 레벨 록이 끝났기 때문이다.
SELECT * FROM DEPT_HW;                  SELECT * FROM DEPT_HW;
-- ④ 현재 세션 A, B에서 조회한 DEPT_HW 테이블 30번 부서의 DNAME, LOC열의 데이터 상태를 적어보세요.
-- 답 : 세션 A의 DNAME 내용은 1. SALES, LOC 내용은 2. CHICAGO /
--      세션 B의 DNAME 내용은 3. DATABASE, LOC 내용은 4. SEOUL
                                        COMMIT;
 SELECT * FROM DEPT_HW;                 SELECT * FROM DEPT_HW;
 -- ⑤ 현재 세션 A, B에서 조회한 DEPT_HW 테이블 30번 부서의 DNAME, LOC 열의 데이터 상태를 적어 보세요.
 -- 답 : 세션 A의 DNAME 내용은 1. DATABASE, LOC 내용은 2. SEOUL /
--      세션 B의 DNAME 내용은 3. DATABASE, LOC 내용은 4. SEOUL