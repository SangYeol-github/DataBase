-- Q1. 명시적 커서를 사용하여 EMP 테이블의 전체 데이터를 조회한 후 커서 안의 데이터가 다음과 같이 출력되도록
-- PL/SQL문을 작성해보세요.
-- 1. LOOP를 사용한 방식
-- 2. FOR LOOP를 사용한 방식
-- 1
DECLARE
    V_EMP_ROW EMP%ROWTYPE;
    CURSOR C1 IS
    SELECT * FROM EMP;
BEGIN
OPEN C1;
LOOP
    FETCH C1 INTO V_EMP_ROW;
    EXIT WHEN C1%NOTFOUND;
    DBMS_OUTPUT.PUT_LINE('EMPNO : '    || V_EMP_ROW.EMPNO
                       || ', ENAME : '    || V_EMP_ROW.ENAME
                       || ', JOB : '      || V_EMP_ROW.JOB
                       || ', SAL : '      || V_EMP_ROW.SAL
                       || ', DEPTNO : '   || V_EMP_ROW.DEPTNO		
		       );
   END LOOP;
   
   CLOSE c1;
END;
/

-- 2
DECLARE
   -- 명시적 커서 선언(Declaration)
   CURSOR c1 IS
      SELECT *
        FROM EMP;
BEGIN
   -- 커서 FOR LOOP 시작 (자동 Open, Fetch, Close)
   FOR c1_rec IN c1 LOOP
      DBMS_OUTPUT.PUT_LINE('EMPNO : '    || c1_rec.EMPNO
                      || ', ENAME : '    || c1_rec.ENAME
                      || ', JOB : '      || c1_rec.JOB
                      || ', SAL : '      || c1_rec.SAL
                      || ', DEPTNO : '   || c1_rec.DEPTNO);
   END LOOP;
END;
/


-- Q2. 다음 PL/SQL문의 실행 중 발생하는 예외를 다음 결과와 같이 처리하는 예외 처리부를 완성하세요.
DECLARE 
    V_WRONG DATE;
BEGIN
    SELECT ENAME INTO V_WRONG
        FROM EMP
     WHERE EMPNO = 7369;
     
     DBMS_OUTPUT.PUT_LINE('예외가 발생하면 다음 문장은 실행되지 않습니다.'); 
     
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('오류가 발생하였습니다.' ||
            TO_CHAR(SYSDATE,'[YYYY"년"MM"월"DD"일" HH24"시"mm"분"SS"초"]'));
        DBMS_OUTPUT.PUT_LINE('예외 처리 : 사전 정의 외 오류 발생');
        DBMS_OUTPUT.PUT_LINE('SQLCODE : ' || TO_CHAR(SQLCODE));
        DBMS_OUTPUT.PUT_LINE('SQLERRM : ' || SQLERRM);
END;
/