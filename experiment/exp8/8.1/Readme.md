# Experiment 8

# Aditya Kumar
**UID:** 24BCS10209

# PostgreSQL Procedure with IN, INOUT and OUT Parameters

## AIM

**Q. Create a PostgreSQL procedure using IN, INOUT, and OUT parameters to update an employee's salary and return the updated salary and status.**

## OBJECTIVE

- To understand PostgreSQL stored procedures.
- To use `IN`, `INOUT`, and `OUT` parameters.
- To update an employee's salary using a procedure.
- To return the updated salary through an `INOUT` parameter.
- To return the execution status through an `OUT` parameter.
- To handle the case when an employee does not exist.

## REQUIREMENTS

- PostgreSQL
- pgAdmin / PostgreSQL terminal
- SQL

## PROCEDURE

1. Create an `employees` table with employee ID, name, and salary.
2. Insert employee records into the table.
3. Create a procedure named `update_salary_proc`.
4. Pass the employee ID using an `IN` parameter.
5. Pass the salary amount using an `INOUT` parameter.
6. Use an `OUT` parameter to return the status.
7. Check whether the employee exists.
8. If the employee exists, add the given amount to the employee's salary.
9. Store the updated salary back into the `INOUT` parameter.
10. Set the status as `Success`.
11. If the employee does not exist, set the status as `Employee Not Found`.
12. Call the procedure for an existing and a non-existing employee.

# QUESTION

Create a PostgreSQL procedure that accepts an employee ID using an `IN` parameter, a salary amount using an `INOUT` parameter, and returns the operation status using an `OUT` parameter. If the employee exists, add the given salary amount to the employee's existing salary and return the updated salary. If the employee does not exist, return `Employee Not Found`.

# SOLUTION

```sql
CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(100),
    salary NUMERIC(10,2)
);

INSERT INTO employees VALUES
(1, 'Amit Sharma', 50000.00),
(2, 'Rahul Verma', 45000.00),
(3, 'Priya Singh', 60000.00);

CREATE OR REPLACE PROCEDURE update_salary_proc(
    IN p_emp_id INT,
    INOUT p_salary NUMERIC(10,2),
    OUT p_status TEXT
)
LANGUAGE plpgsql
AS $$
BEGIN
    -- Check if employee exists
    IF EXISTS (SELECT 1 FROM employees WHERE emp_id = p_emp_id) THEN

        -- Update salary by adding p_salary
        UPDATE employees
        SET salary = salary + p_salary
        WHERE emp_id = p_emp_id;

        -- Return updated salary
        SELECT salary INTO p_salary
        FROM employees
        WHERE emp_id = p_emp_id;

        -- Set status
        p_status := 'Success';

    ELSE

        -- Employee not found
        p_status := 'Employee Not Found';

        RAISE NOTICE 'Employee with ID % not found', p_emp_id;

    END IF;
END;
$$;

CALL update_salary_proc(1, 5000, NULL);

CALL update_salary_proc(99, 5000, NULL);
