-- 실습 13-8 SCOTT 계정이 소유한 인덱스 정보 알아보기(SCOTT 계정일 때)
SELECT * FROM USER_INDEXES;

-- 실습 13-9 SCOTT 계정이 소유한 인덱스 컬럼 정보 알아보기(SCOTT 계정일 때)
SELECT * FROM USER_IND_COLUMNS;

-- 실습 13-10 EMP 테이블의 SAL 열에 인덱스 생성하기
CREATE INDEX IDX_EMP_SAL
ON EMP(SAL);

-- 실습 13-11 생성된 인덱스 살펴보기(USER_IND_COLUMNS 사용)
SELECT * FROM USER_IND_COLUMNS;

-- 실습 13-12 인덱스 삭제하기
DROP INDEX IDX_EMP_SAL;

-- 실습 13-13 생성된 인덱스 살펴보기(USER_IND_COLUMNS 사용)
SELECT * FROM USER_IND_COLUMNS;

-- 1분 복습.
-- CREATE INDEX 인덱스 이름
-- ON 테이블 이름( 열 이름1 ASC OR DESC,
--                열 이름2 ASC OR DESC,
--                    ...               );