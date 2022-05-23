create table DEPT
(
DEPTNO INT(2),
DNAME VARCHAR(15),
LOC VARCHAR(10)
);

INSERT INTO DEPT VALUES
(10,'ACCOUNTING', 'NEW YORK'),
(20,'RESEARCH', 'DALLAS'),
(30,'SALES', 'CHICAGO'),
(40,'OPERATIONS', 'BOSTON');

CREATE TABLE EMP
(
EMPNO INT(4),
ENAME VARCHAR(10),
JOB VARCHAR(9),
HIREDATE DATE,
SAL FLOAT(7,2),
COMM FLOAT(7,2),
DEPTNO INT(2)
);

INSERT INTO EMP VALUES
(7839,'KING', 'MANAGER', '1991-11-17', 5000, NULL, 10),
(7698,'BLAKE', 'CLERK', '1981-05-01', 2850, NULL, 30),
(7782,'CLARK', 'MANAGER', '1981-06-09', 2450, NULL, 10),
(7566,'JONES', 'CLERK', '1981-04-02', 2975, NULL, 20),
(7654,'MARTIN', 'SALESMAN', '1981-09-28', 1250, 1400, 30),
(7499,'ALLEN', 'SALESMAN', '1981-02-20', 1600, 300, 30);

SELECT * FROM DEPT;

SELECT * FROM EMP;

SELECT * FROM EMP WHERE SAL>=2500 AND SAL<=5000;

SELECT ENAME FROM EMP ORDER BY ENAME DESC;

SELECT LOWER(JOB) FROM EMP;

SELECT ENAME,LENGTH(ENAME) FROM EMP;

SELECT DEPTNO,COUNT(ENAME) FROM EMP GROUP BY DEPTNO;

SELECT DNAME,ENAME FROM DEPT,EMP WHERE EMP.DEPTNO=DEPT.DEPTNO;

SELECT ENAME,INSTR(ENAME,'AR') FROM EMP;

SELECT SAL,SAL*0.2 AS"HRA" FROM EMP;


CREATE TABLE TEMPP
(
OUTPUT VARCHAR(200)
);

DROP TABLE TEMPP;
DELIMITER //
CREATE PROCEDURE PROC1(STRING1 VARCHAR(20), STRING2 VARCHAR(20))
BEGIN
	IF INSTR(STRING2,STRING1)>0 THEN
		INSERT INTO TEMPP VALUES('STRING1 EXIST IN STRING2');
	ELSE 
		INSERT INTO TEMPP VALUES('STRING1 NOT EXIST IN STRING2');
	END IF;
END; //
DELIMITER ;



CALL PROC1('DAC','CDAC');

SELECT * FROM TEMPP;
     
     
     
     
      
CREATE TABLE TRIANGLE
( 
RESULT BOOLEAN
);       



DELIMITER //
CREATE FUNCTION FUNC1(S1 INT,S2 INT, S3 INT)
RETURNS BOOLEAN
DETERMINISTIC
BEGIN
    IF S1+S2>S3 AND S2+S3>S1 AND S1+S3>S2 THEN
		RETURN TRUE;
	ELSE
		RETURN FALSE;
	END IF;
END; //
DELIMITER ;


DELIMITER //
CREATE PROCEDURE TRG()
BEGIN
	DECLARE RESULT BOOLEAN;
    SET RESULT = FUNC1(1,2,3);
    INSERT INTO TRIANGLE VALUES(RESULT);
END; //
DELIMITER ;

DROP PROCEDURE TRG;

CALL TRG();

SELECT * FROM TRIANGLE;
