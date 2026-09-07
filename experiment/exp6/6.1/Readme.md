# Aditya Kumar
**UID:** 24BCS10209

# SQL Views – Employee Database

## AIM

**Q. Create a view on an employee table and perform an update operation through the view.**

## OBJECTIVE

To understand the concept of **SQL Views**, create a view from an existing employee table, and update the employee salary using the created view.

## REQUIREMENTS

- MySQL / SQL Database
- SQL Client or IDE
- Basic knowledge of `CREATE TABLE`, `INSERT`, `SELECT`, `CREATE VIEW`, and `UPDATE`

## PROCEDURE

1. Create an `employees` table with employee ID, name, salary, and city.
2. Insert employee records into the table.
3. Display all employee records using `SELECT`.
4. Create a view named `employee_view` using the `employees` table.
5. Select the required columns in the view.
6. Update the salary of employee `101` through the view.
7. Display the updated view using `SELECT`.
8. Verify that the salary has been updated successfully.

## SOLUTION

```sql
CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(100) NOT NULL,
    emp_salary DECIMAL(10, 2) NOT NULL,
    emp_city VARCHAR(100) NOT NULL
);

INSERT INTO employees (emp_id, emp_name, emp_salary, emp_city) VALUES
(101, 'Amit Sharma', 85000.00, 'Mumbai'),
(102, 'Priya Patel', 95000.00, 'Mumbai'),
(103, 'Rahul Verma', 60000.00, 'Delhi'),
(104, 'Ananya Iyer', 110000.00, 'Bangalore'),
(105, 'Vikram Singh', 55000.00, 'Delhi'),
(106, 'Sneha Reddy', 105000.00, 'Bangalore'),
(107, 'Rohan Das', 72000.00, 'Kolkata');

SELECT * FROM employees;

CREATE VIEW employee_view AS
SELECT emp_id, emp_name, emp_salary, emp_city
FROM employees;

UPDATE employee_view
SET emp_salary = 90000


WHERE emp_id = 101;

SELECT * FROM employee_view;
