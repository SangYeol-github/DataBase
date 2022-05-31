-- Q1. ������ ���� ����� �������� ������ �ۼ��� ������.
-- 1. DEPT ���̺��� �μ���ȣ(DEPTNO)�� �Է� ������ ���� �� �μ� ��ȣ(DEPTNO), �μ� �̸�(DNAME), ����(LOC)�� ����ϴ� ���ν��� PRO_DEPT_IN�� �ۼ��غ�����.
CREATE OR REPLACE PROCEDURE PRO_DEPT_IN
(
    INOUT_DEPTNO IN OUT DEPT.DEPTNO%TYPE,
    OUT_DNAME OUT DEPT.DNAME%TYPE,
    OUT_LOC OUT DEPT.LOC%TYPE
)
IS
BEGIN
    SELECT DEPTNO, DNAME, LOC INTO INOUT_DEPTNO, OUT_DNAME, OUT_LOC
        FROM DEPT
     WHERE DEPTNO = INOUT_DEPTNO;
END PRO_DEPT_IN;     
/
-- 2. PRO_DEPT_IN ���ν����� ���� ��µ� �μ� ��ȣ(DEPTNO), �μ� �̸�(DNAME), ����(LOC)�� ������ ���� ����ϴ� PL/SQL ���α׷��� �ۼ��غ�����.
DECLARE
    V_DEPTNO DEPT.DEPTNO%TYPE;
    V_DNAME DEPT.DNAME%TYPE;
    V_LOC DEPT.LOC%TYPE;
BEGIN
    V_DEPTNO := 10;
    PRO_DEPT_IN(V_DEPTNO, V_DNAME, V_LOC);
    DBMS_OUTPUT.PUT_LINE('�μ���ȣ : ' || V_DEPTNO);
    DBMS_OUTPUT.PUT_LINE('�μ��� : ' || V_DNAME);
    DBMS_OUTPUT.PUT_LINE('���� : ' || V_LOC);
END;
/

-- Q2. ������ ���� ����� �������� ������ �ۼ��غ�����.
-- SELECT������ ����� �� �ִ� �Լ� FUNC_DATE_KOR�� �ۼ��մϴ�. FUNC_DATE_KOR �Լ��� DATE �ڷ��� �����͸� �Է� �޾� ������ ���� YYYY�� MM�� DD�� ������ �����͸� ����մϴ�.
CREATE OR REPLACE FUNCTION FUNC_DATE_KOR(
    IN_DATE IN DATE
)
RETURN VARCHAR2
IS
BEGIN
    RETURN(TO_CHAR(IN_DATE, 'YYYY"��"MM"��"DD"��"'));
END FUNC_DATE_KOR;
/

-- Q3. ������ ���� ����� �������� ������ �ۼ��غ�����.
-- 1. DEPT ���̺�� ���� �� ���� �� �����͸� ���� DEPT_TRG ���̺��� �ۼ��� ������.
CREATE TABLE DEPT_TRG AS SELECT * FROM DEPT; 

-- 2. DEPT_TRG ���̺� DML��ɾ ����� ����� �����ϴ� DEPT_TRG_LOG ���̺��� ������ ���� �ۼ��غ�����.
CREATE TABLE DEPT_TRG_LOG(
    TABLENAME VARCHAR2(10),
    DML_TYPE  VARCHAR2(10),
    DEPTNO    NUMBER(2),
    USER_NAME VARCHAR2(30),
    CHANGE_DATE DATE
);

-- 3. DEPT_TRG ���̺� DML ��� ���� ����� DEPT_TRG_LOG�� �����ϴ� Ʈ���� TRG_DEPT_LOG�� �ۼ��غ�����.
CREATE OR REPLACE TRIGGER TRG_DEPT_LOG
AFTER
INSERT OR UPDATE OR DELETE ON DEPT_TRG
FOR EACH ROW
BEGIN
    IF INSERTING THEN
        INSERT INTO DEPT_TRG_LOG
        VALUES('DEPT_TRG', 'INSERT', :NEW.DEPTNO,
            SYS_CONTEXT('USERENV', 'SESSION_USER'), SYSDATE);
    ELSIF UPDATING THEN
        INSERT INTO DEPT_TRG_LOG
        VALUES('DEPT_TRG', 'UPDATE', :OLD.DEPTNO,
            SYS_CONTEXT('USERENV', 'SESSION_USER'), SYSDATE);
   ELSIF DELETING THEN
        INSERT INTO DEPT_TRG_LOG
        VALUES('DEPT_TRG', 'DELETE', :OLD.DEPTNO,
            SYS_CONTEXT('USERENV', 'SESSION_USER'), SYSDATE);         
   END IF;
END;
/