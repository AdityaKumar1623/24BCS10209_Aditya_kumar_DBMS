
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

