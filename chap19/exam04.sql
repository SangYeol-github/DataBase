-- �ǽ� 19-24 ��Ű�� �����ϱ�
CREATE OR REPLACE PACKAGE PKG_EXAMPLE
IS
    SPEC_NO NUMBER := 10;
    FUNCTION FUNC_AFTERTAX(SAL NUMBER) RETURN NUMBER;
    PROCEDURE PRO_EMP(IN_EMPNO IN EMP.EMPNO%TYPE);
    PROCEDURE PRO_DEPT(IN_DEPTNO IN DEPT.DEPTNO%TYPE);
END;
/

-- �ǽ� 19-25 ��Ű�� �� Ȯ���ϱ�(USER_SOURCE ������ �������� ��ȸ)
SELECT TEXT FROM USER_SOURCE
WHERE TYPE = 'PACKAGE'
AND NAME = 'PKG_EXAMPLE';

-- �ǽ� 19-26 ��Ű�� �� Ȯ���ϱ�(DESC ��ɾ�� ��ȸ)
DESC PKG_EXAMPLE;

-- �ǽ� 19-27 ��Ű�� ���� �����ϱ�
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

-- �ǽ� 19-28 ���ν��� �����ε��ϱ�
CREATE OR REPLACE PACKAGE PKG_OVERLOAD
IS
    PROCEDURE PRO_EMP(IN_EMPNO IN EMP.EMPNO%TYPE);
    PROCEDURE PRO_EMP(IN_EMPNO IN EMP.ENAME%TYPE);
END;
/

-- �ǽ� 19-29 ��Ű�� �������� �����ε�� ���ν��� �ۼ��ϱ�
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

-- 1�� ����. ���� ������ ��Ű���� ���� �� � ���뿡 ���� �������� ��� ������.
-- ���� ��Ŀ� ���� ��Ű���� �����ϴ� �������α׷��� �ܺ� ���� ���� �Ǵ� ���� ���θ� ������ �� �ֽ��ϴ�.
-- �� �������α׷��� ����� �� ������ ��ȭ�� �� �ֽ��ϴ�.
-- 1.��⼺ 2.���� ��� 3. ���� ���� ���α׷� ���� 4.��������
-- ���� : 4

-- �ǽ� 19-30 ��Ű���� ���Ե� �������α׷� �����ϱ�
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