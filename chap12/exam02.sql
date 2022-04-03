-- 실습 12-6 EMP 테이블을 복사하여 EMP_ALTER 테이블 생성하기
CREATE TABLE EMP_ALTER
AS SELECT * FROM EMP;

SELECT * FROM EMP_ALTER;

-- 실습 12-7 ALTER 명령어로 HP열 추가하기
ALTER TABLE EMP_ALTER
ADD HP VARCHAR2(20);

SELECT * FROM EMP_ALTER;

-- 실습 12-8 ALTER 명령어로 HP 열 이름을 TEL로 변경하기
ALTER TABLE EMP_ALTER
RENAME COLUMN HP TO TEL;

SELECT * FROM EMP_ALTER;

-- 실습 12-9 ALTER 명령어로 EMPNO 열 길이 변경하기
ALTER TABLE EMP_ALTER
MODIFY EMPNO NUMBER(5);

DESC EMP_ALTER;

-- 실습 12-10 ALTER 명령어로 TEL 열 삭제하기.
ALTER TABLE EMP_ALTER
DROP COLUMN TEL;

SELECT * FROM EMP_ALTER;

-- 1분 복습
-- 테이블을 생성할 때
-- 1. CREATE TABLE 테이블 이름(
--      열1 이름 열1 자료형,
--      열2 이름 열2 자료형,
--      ...
--      열N 이름 열N 자료형
--);

-- 테이블의 열 이름을 변경할 때
-- 2. ALTER TABLE 테이블 이름
-- 3. RENAME COLUMN 수정 전 열 이름 새 수정 후 열 이름;