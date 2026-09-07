# Aditya Kumar
**UID:** 24BCS10209

# SQL Materialized Views – Employee Database

## AIM

**Q. Create materialized views with data and without data, refresh the materialized view, and display the stored records.**

## OBJECTIVE

- To understand materialized views in SQL.
- To create a materialized view using `WITH DATA`.
- To create a materialized view using `WITH NO DATA`.
- To refresh a materialized view using `REFRESH MATERIALIZED VIEW`.
- To display the data stored in the materialized views.

## REQUIREMENTS

- PostgreSQL
- SQL database
- Employee table

## PROCEDURE

1. Create an `employees` table with employee ID, name, salary, and city.
2. Insert employee records into the table.
3. Create a materialized view using `WITH DATA` to store employees from Delhi.
4. Display the data from the materialized view.
5. Create another materialized view using `WITH NO DATA`.
6. Refresh the materialized view using `REFRESH MATERIALIZED VIEW`.
7. Display the data after refreshing the materialized view.

# QUESTION

Create a materialized view for employees belonging to Delhi using `WITH DATA` and another materialized view using `WITH NO DATA`. Refresh the second materialized view and display the results.

# SOLUTION

```sql
-- Create table
CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(100) NOT NULL,
    emp_salary DECIMAL(10, 2) NOT NULL,
    emp_city VARCHAR(100) NOT NULL
);

-- Insert data
INSERT INTO employees (emp_id, emp_name, emp_salary, emp_city) VALUES
(101, 'Amit Sharma', 85000.00, 'Mumbai'),
(102, 'Priya Patel', 95000.00, 'Mumbai'),
(103, 'Rahul Verma', 60000.00, 'Delhi'),
(104, 'Ananya Iyer', 110000.00, 'Bangalore'),
(105, 'Vikram Singh', 55000.00, 'Delhi'),
(106, 'Sneha Reddy', 105000.00, 'Bangalore'),
(107, 'Rohan Das', 72000.00, 'Kolkata');


-- Materialized View WITH DATA
CREATE MATERIALIZED VIEW EMP_VIEW_KRG_601A_MV AS
SELECT EMP_ID, EMP_NAME
FROM EMPLOYEES
WHERE emp_city = 'Delhi'
WITH DATA;

SELECT * FROM EMP_VIEW_KRG_601A_MV;


-- Materialized View WITH NO DATA
CREATE MATERIALIZED VIEW EMP_VIEW_KRG_601A_MV2 AS
SELECT EMP_ID, EMP_NAME
FROM EMPLOYEES
WHERE emp_city = 'Delhi'
WITH NO DATA;

-- Populate the materialized view
REFRESH MATERIALIZED VIEW EMP_VIEW_KRG_601A_MV2;

SELECT * FROM EMP_VIEW_KRG_601A_MV2;
