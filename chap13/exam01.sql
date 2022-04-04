-- 실습 13-1 SCOTT 계정에서 사용 가능한 데이터 사전 살펴보기(DICT 사용)
SELECT * FROM DICT;

-- 실습 13-2 SCOTT 계정에서 사용 가능한 데이터 사전 살펴보기(DICTIONARY 사용)
SELECT * FROM DICTIONARY;

-- 실습 13-3 SCOTT 계정이 가지고 있는 객체 정보 살펴보기(USER_접두어 사용)
SELECT TABLE_NAME
FROM USER_TABLES;

-- 실습 13-4 SCOTT 계정이 가지고 있는 객체 정보 살펴보기(ALL_접두어 사용)
SELECT OWNER, TABLE_NAME
FROM ALL_TABLES;

-- 실습 13-5 SCOTT 계정으로 DBA_접두어 사용하기
SELECT * FROM DBA_TABLES;

-- 실습 13-5 SYSTEM 계정으로 DBA_접두어 사용하기(SYSTEM 계정으로 접속했을때)
SELECT * FROM DBA_TABLES;

-- 실습 13-7 DBA_USERS를 사용하여 사용자 정보 알아보기(SYSTEM 계정으로 접속했을때)
SELECT * FROM DBA_USERS
WHERE USERNAME = 'SCOTT';

-- 1분 복습.
-- 데이터 사전은 오라클 데이터베이스를 구성하고 운영하는 데이터를 저장하는 특수한 테이블로서 오라클 사용자가 직접 접근할 수 없습니다,
-- 하지만 SELECT문으로 데이터를 열람할 수 있도록 1. 데이터 사전 뷰 를 제공합니다.
-- 대표적인 1. 데이터 사전 뷰 중 현재 접속한 사용자가 소유하는 테이블 목록을 보기 위해서느 2. USER_TABLES 를 사용합니다.
-- 또한 사용자가 소유하는 테이블을 포함해 다른 사용자가 소유한 테이블 중 현재 사용자에게 사용 허가가 되어 있는 테이블을 보기 위해서는 
-- 3. ALL_TABLES 를 사용합니다.