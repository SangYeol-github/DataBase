-- 실습 14-45 테이블을 생성할 때 CHECK 제약 조건 설정하기
CREATE TABLE TABLE_CHECK (
    LOGIN_ID    VARCHAR2(20) CONSTRAINT TBLCK_LGNID_CK PRIMARY KEY,
    LOGIN_PWD   VARCHAR2(20) CONSTRAINT TBLCK_LGNPW_CK CHECK(LENGTH(LOGIN_PWD) >3 ), 
    TEL         VARCHAR2(20)
);

DESC TABLE_CHECK;

-- 실습 14-46 CHECK 제약 조건에 맞지 않는 예
INSERT INTO TABLE_CHECK
VALUES ('TEST_ID', '123', '010-1234-5678');

-- 실습 14-46 CHECK 제약 조건에 맞는 예
INSERT INTO TABLE_CHECK
VALUES ('TEST_ID', '1234', '010-1234-5678');

SELECT * FROM TABLE_CHECK;

-- 실습 14-49 테이블을 생성할 때 DEFAULT 제약 조건 설정하기
CREATE TABLE TABLE_DEFAULT (
    LOGIN_ID    VARCHAR2(20) CONSTRAINT TBLCK2_LOGINID_PK PRIMARY KEY,
    LOGIN_PWD   VARCHAR2(20) DEFAULT '1234', 
    TEL         VARCHAR2(20)
);

DESC TABLE_DEFAULT;

-- 실습 14-50 DEFAULT로 지정한 기본값이 입력되는 INSERT문 확인하기
INSERT INTO TABLE_DEFAULT VALUES('TEST_ID', NULL, '010-1234-5678');

INSERT INTO TABLE_DEFAULT (LOGIN_ID, TEL) VALUES('TEST_ID2', '010-1234-5678');

SELECT * FROM TABLE_DEFAULT;