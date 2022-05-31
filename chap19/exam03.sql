-- �ǽ� 19-19 �Լ� �����ϱ�
CREATE OR REPLACE FUNCTION FUNC_AFTERTAX(
    SAL IN NUMBER
)
RETURN NUMBER
IS
    TAX NUMBER := 0.05;
BEGIN
    RETURN (ROUND(SAL - (SAL * TAX)));
END FUNC_AFTERTAX;
/

-- �ǽ� 19-20 PL/SQL���� �Լ� ����ϱ�
DECLARE
    AFTERTAX NUMBER;
BEGIN
    AFTERTAX := FUNC_AFTERTAX(3000);
    DBMS_OUTPUT.PUT_LINE('AFTER-TAX INCOME : ' || AFTERTAX);
END;
/

-- �ǽ� 19-21 SQL���� �Լ� ����ϱ�
SELECT FUNC_AFTERTAX(3000) FROM DUAL;

-- �ǽ� 19-22 �Լ��� ���̺� ������ ����ϱ�
SELECT EMPNO, ENAME, SAL, FUNC_AFTERTAX(SAL) AS AFTERTAX FROM EMP;

-- �ǽ� 19-23 �Լ� �����ϱ�
DROP FUNCTION FUNC_AFTERTAX;

-- 1�� ����. ������ �Լ��� ���� �����Դϴ�. Ʋ�� ������ ��� ������.
-- 1. SQL������ ���� ���� �����ϴ�.
-- 2. IN, OUT, IN OUT��带 ��� ����� �� �ִ�.  --> ����
-- 3. �ݵ�� �ϳ��� ���� ��ȯ�ؾ� �Ѵ�.
-- 4. ���� ��ȯ�� ���� RETURN�� �Ǵ� RETURN���� ����ؾ� �Ѵ�.
