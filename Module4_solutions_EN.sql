--Script_Create_Table
--------------------------------------------
--DDL statement for table 'HR' database--
--------------------------------------------

CREATE TABLE EMPLOYEES (
                            EMP_ID CHAR(9) NOT NULL, 
                            F_NAME VARCHAR(15) NOT NULL,
                            L_NAME VARCHAR(15) NOT NULL,
                            SSN CHAR(9),
                            B_DATE DATE,
                            SEX CHAR,
                            ADDRESS VARCHAR(30),
                            JOB_ID CHAR(9),
                            SALARY DECIMAL(10,2),
                            MANAGER_ID CHAR(9),
                            DEP_ID CHAR(9) NOT NULL,
                            PRIMARY KEY (EMP_ID));
                            
  CREATE TABLE JOB_HISTORY (
                            EMPL_ID CHAR(9) NOT NULL, 
                            START_DATE DATE,
                            JOBS_ID CHAR(9) NOT NULL,
                            DEPT_ID CHAR(9),
                            PRIMARY KEY (EMPL_ID,JOBS_ID));
 
 CREATE TABLE JOBS (
                            JOB_IDENT CHAR(15) NOT NULL, 
                            JOB_TITLE VARCHAR(15) ,
                            MIN_SALARY DECIMAL(10,2),
                            MAX_SALARY DECIMAL(10,2),
                            PRIMARY KEY (JOB_IDENT));

CREATE TABLE DEPARTMENTS (
                            DEPT_ID_DEP CHAR(9) NOT NULL, 
                            DEP_NAME VARCHAR(15) ,
                            MANAGER_ID CHAR(9),
                            LOC_ID CHAR(9),
                            PRIMARY KEY (DEPT_ID_DEP));

CREATE TABLE LOCATIONS (
                            LOCT_ID CHAR(9) NOT NULL,
                            DEP_ID_LOC CHAR(9) NOT NULL,
                            PRIMARY KEY (LOCT_ID,DEP_ID_LOC));
                            

--End of Script_Create_Table
-----------------------------
--Queary 1- Retrive all employees whose address is in Elgin,IL
SELECT * FROM EMPLOYEES WHERE ADDRESS LIKE '%Elgin,IL%';
--Query 2- Retrive all employees who were born during the 1970's.
SELECT * FROM EMPLOYEES WHERE B_DATE LIKE '%197%';
--Query 3: Retrieve all employees in department 5 whose salary is between 60000 and 70000 .
SELECT * FROM EMPLOYEES WHERE DEP_ID=5 AND SALARY BETWEEN 60000 AND 70000;
--Query 4A: Retrieve a list of employees ordered by department ID.
SELECT * FROM EMPLOYEES ORDER BY DEP_ID;
--Query 4B: Retrieve a list of employees ordered in descending order by department ID and
-- within each department ordered alphabetically in descending order by last name.
SELECT * FROM EMPLOYEES ORDER BY DEP_ID DESC , L_NAME DESC;
--Query 5A: For each department ID retrieve the number of employees in the department.
SELECT DEP_ID, COUNT(DEP_ID) FROM EMPLOYEES GROUP BY DEP_ID;
--Query 5B: For each department retrieve the number of employees in the department, 
-- and the average employees salary in the department.
SELECT DEP_ID, COUNT(DEP_ID), AVG(SALARY) FROM EMPLOYEES GROUP BY DEP_ID;
--Query 5C: Label the computed columns in the result set of Query 5B as “NUM_EMPLOYEES” and “AVG_SALARY”.
SELECT DEP_ID, COUNT(DEP_ID) AS NUM_EMPLOYEES, AVG(SALARY) AS AVG_SALARY FROM EMPLOYEES GROUP BY DEP_ID;
-- Query 5D: In Query 5C order the result set by Average Salary.
SELECT DEP_ID, COUNT(DEP_ID) AS NUM_EMPLOYEES, AVG(SALARY) AS AVG_SALARY 
FROM EMPLOYEES 
GROUP BY DEP_ID 
ORDER BY AVG_SALARY;
-- Query 5E: In Query 5D limit the result to departments with fewer than 4 employees.
SELECT DEP_ID, COUNT(DEP_ID) AS NUM_EMPLOYEES, AVG(SALARY) AS AVG_SALARY 
FROM EMPLOYEES 
GROUP BY DEP_ID 
HAVING COUNT(*) < 4 
ORDER BY AVG_SALARY;
-- BONUS Query 6: Similar to 4B but instead of department ID use department name. Retrieve a list of employees
-- ordered by department name, and within each department ordered alphabetically in descending order by last name.