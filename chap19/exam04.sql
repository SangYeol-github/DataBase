-- 실습 19-24 패키지 생성하기
CREATE OR REPLACE PACKAGE PKG_EXAMPLE
IS
    SPEC_NO NUMBER := 10;
    FUNCTION FUNC_AFTERTAX(SAL NUMBER) RETURN NUMBER;
    PROCEDURE PRO_EMP(IN_EMPNO IN EMP.EMPNO%TYPE);
    PROCEDURE PRO_DEPT(IN_DEPTNO IN DEPT.DEPTNO%TYPE);
END;
/

-- 실습 19-25 패키지 명세 확인하기(USER_SOURCE 데이터 사전으로 조회)
SELECT TEXT FROM USER_SOURCE
WHERE TYPE = 'PACKAGE'
AND NAME = 'PKG_EXAMPLE';

-- 실습 19-26 패키지 명세 확인하기(DESC 명령어로 조회)
DESC PKG_EXAMPLE;

-- 실습 19-27 패키지 본문 생성하기
CREATE OR REPLACE PACKAGE BODY PKG_EXAMPLE
IS
    BODY_NO NUMBER := 10;
    
    FUNCTION FUNC_AFTERTAX(SAL NUMBER) RETURN NUMBER
        IS
            TAX NUMBER := 0.05;
        BEGIN
            RETURN (ROUND(SAL - (SAL * TAX)));
    END FUNC_AFTERTAX;
    
    PROCEDURE PRO_EMP(IN_EMPNO IN EMP.EMPNO%TYPE)
        IS
            OUT_ENAME EMP.ENAME%TYPE;
            OUT_SAL EMP.SAL%TYPE;
        BEGIN
            SELECT ENAME, SAL INTO OUT_ENAME, OUT_SAL
                FROM EMP
             WHERE EMPNO = IN_EMPNO;
             
        DBMS_OUTPUT.PUT_LINE('ENAME : ' || OUT_ENAME);
        DBMS_OUTPUT.PUT_LINE('SAL : ' || OUT_SAL);
    END PRO_EMP;
    
    PROCEDURE PRO_DEPT(IN_DEPTNO IN DEPT.DEPTNO%TYPE)
        IS
            OUT_DNAME DEPT.DNAME%TYPE;
            OUT_LOC DEPT.LOC%TYPE;
        BEGIN
            SELECT DNAME, LOC INTO OUT_DNAME, OUT_LOC
                FROM DEPT
            WHERE DEPTNO = IN_DEPTNO;
            
            DBMS_OUTPUT.PUT_LINE('DNAME : ' || OUT_DNAME);
            DBMS_OUTPUT.PUT_LINE('LOC : ' || OUT_LOC);
        END PRO_DEPT;
END;
/

-- 실습 19-28 프로시저 오버로드하기
CREATE OR REPLACE PACKAGE PKG_OVERLOAD
IS
    PROCEDURE PRO_EMP(IN_EMPNO IN EMP.EMPNO%TYPE);
    PROCEDURE PRO_EMP(IN_EMPNO IN EMP.ENAME%TYPE);
END;
/

-- 실습 19-29 패키지 본문에서 오버로드된 프로시저 작성하기
CREATE OR REPLACE PACKAGE BODY pkg_overload
IS
   PROCEDURE pro_emp(in_empno IN EMP.EMPNO%TYPE)
      IS
         out_ename EMP.ENAME%TYPE;
         out_sal EMP.SAL%TYPE;
      BEGIN
         SELECT ENAME, SAL INTO out_ename, out_sal
           FROM EMP
          WHERE EMPNO = in_empno;

         DBMS_OUTPUT.PUT_LINE('ENAME : ' || out_ename);
         DBMS_OUTPUT.PUT_LINE('SAL : ' || out_sal);
      END pro_emp;

   PROCEDURE pro_emp(in_ename IN EMP.ENAME%TYPE)
      IS
         out_ename EMP.ENAME%TYPE;
         out_sal EMP.SAL%TYPE;
      BEGIN
         SELECT ENAME, SAL INTO out_ename, out_sal
           FROM EMP
          WHERE ENAME = in_ename;

         DBMS_OUTPUT.PUT_LINE('ENAME : ' || out_ename);
         DBMS_OUTPUT.PUT_LINE('SAL : ' || out_sal);
      END pro_emp;

END;
/

-- 1분 복습. 다음 설명의 패키지의 장점 중 어떤 내용에 대한 설명인지 골라 보세요.
-- 제작 방식에 따라 패키지에 포함하는 서브프로그램의 외부 노출 여부 또는 접근 여부를 지정할 수 있습니다.
-- 즉 서브프로그램을 사용할 때 보안을 강화할 수 있습니다.
-- 1.모듈성 2.성능 향상 3. 쉬운 응용 프로그램 설계 4.정보은닉
-- 정답 : 4

-- 실습 19-30 패키지에 포함된 서브프로그램 실행하기
BEGIN
    DBMS_OUTPUT.PUT_LINE('--PKG_EXAMPLE.FUNC_AFTERTAX(3000)--');
    DBMS_OUTPUT.PUT_LINE('AFTER-TAX:' || PKG_EXAMPLE.FUNC_AFTERTAX(3000));
    
    DBMS_OUTPUT.PUT_LINE('--PKG_EXAMPLE.PRO_EMP(7788)--');
    PKG_EXAMPLE.PRO_EMP(7788);
    
    DBMS_OUTPUT.PUT_LINE('--PKG_EXAMPLE.PRO_DEPT(10)--');
    PKG_EXAMPLE.PRO_DEPT(10);
    
    DBMS_OUTPUT.PUT_LINE('--PKG_OVERLOAD.PRO_EMP(7788)--');
    PKG_OVERLOAD.PRO_EMP(7788);
    
    DBMS_OUTPUT.PUT_LINE('--PKG_OVERLOAD.PRO_EMP(''SCOTT'')--');
    PKG_OVERLOAD.PRO_EMP('SCOTT');
    
END;
/