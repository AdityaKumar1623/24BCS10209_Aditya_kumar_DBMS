**# Aditya Kumar
UID: 24BCS10209**

# PL/SQL Explicit Cursor and User-Defined Exception

## AIM

**Q. Write a PL/SQL program using an explicit cursor to increase the salary of employees by 10% and handle the case where an employee's salary is zero using a user-defined exception.**

## OBJECTIVE

- To understand explicit cursors in PL/SQL.
- To fetch employee records using a cursor.
- To update employee salaries by 10%.
- To create and use a user-defined exception.
- To handle the case where an employee has zero salary.

## REQUIREMENTS

- Oracle Database
- SQL*Plus / Oracle SQL Developer
- PL/SQL

## PROCEDURE

1. Create an `EMPLOYEE` table with employee ID, employee name, and salary.
2. Insert employee records into the table.
3. Display the employee records.
4. Enable `DBMS_OUTPUT` using `SET SERVEROUTPUT ON`.
5. Declare an explicit cursor to fetch employee ID and salary.
6. Open the cursor and fetch employee records one by one.
7. Check whether the salary of the current employee is zero.
8. If the salary is zero, raise the user-defined `SALARY_ZERO` exception.
9. Otherwise, increase the employee's salary by 10%.
10. Continue fetching records until there are no more records.
11. Close the cursor.
12. Handle the `SALARY_ZERO` exception and display an appropriate message.

# QUESTION

Write a PL/SQL program using an explicit cursor to increase the salary of all employees by 10%. If an employee has a salary of zero, raise a user-defined exception and display the message:

`Salary is zero. Increment not possible.`

# SOLUTION

```sql
CREATE TABLE EMPLOYEE (
    EMP_ID NUMBER PRIMARY KEY,
    EMP_NAME VARCHAR2(50),
    SALARY NUMBER
);

INSERT INTO EMPLOYEE VALUES (1, 'Rahul', 30000);
INSERT INTO EMPLOYEE VALUES (2, 'Priya', 40000);
INSERT INTO EMPLOYEE VALUES (3, 'Aman', 25000);
INSERT INTO EMPLOYEE VALUES (4, 'Neha', 0);
INSERT INTO EMPLOYEE VALUES (5, 'Riya', 50000);

COMMIT;

SELECT * FROM EMPLOYEE;

SET SERVEROUTPUT ON;

DECLARE

    -- Declare explicit cursor
    CURSOR emp_cursor IS
        SELECT EMP_ID, SALARY
        FROM EMPLOYEE;

    -- Variables to store fetched values
    V_EMP_ID EMPLOYEE.EMP_ID%TYPE;
    V_SALARY EMPLOYEE.SALARY%TYPE;

    -- User-defined exception
    SALARY_ZERO EXCEPTION;

BEGIN

    -- Open the cursor
    OPEN emp_cursor;

    -- Fetch first record
    FETCH emp_cursor INTO V_EMP_ID, V_SALARY;

    -- Continue while records are available
    WHILE emp_cursor%FOUND
    LOOP

        -- Check if salary is zero
        IF V_SALARY = 0 THEN
            RAISE SALARY_ZERO;
        END IF;

        -- Increase salary by 10%
        UPDATE EMPLOYEE
        SET SALARY = SALARY * 1.10
        WHERE EMP_ID = V_EMP_ID;

        -- Fetch next record
        FETCH emp_cursor INTO V_EMP_ID, V_SALARY;

    END LOOP;

    -- Close the cursor
    CLOSE emp_cursor;

EXCEPTION

    -- Handle zero salary
    WHEN SALARY_ZERO THEN
        DBMS_OUTPUT.PUT_LINE(
            'Salary is zero. Increment not possible.'
        );

END;
