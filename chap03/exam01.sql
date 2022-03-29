-- 실습 3-1 SCOTT 계정 잠금 풀기
ALTER USER SCOTT
IDENTIFIED BY tiger
ACCOUNT UNLOCK;

-- 실습 3-2 scott 계정으로 접속하기
CONN scott/tiger;

-- 실습 3-3 EMP 테이블 구성 확인
DESC EMP;

-- 실습 3-4 SQL*PLUS 종료하기
EXIT

-- 실습 3-5 SCOTT 계정으로 접속하기
SQLPLUS scott/tiger
