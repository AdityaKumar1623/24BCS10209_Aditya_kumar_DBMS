# Experiment 10.1

Name: Aditya Kumar

UID: 24BCS10209

## Aim

To find the second and third highest salaries from an employee table using a subquery.

## Question

Write a subquery to find the second and third highest salary from the `employee` table.

## SQL Queries Used

```sql
CREATE TABLE employee (
	emp_id INT PRIMARY KEY,
	emp_name VARCHAR(100) NOT NULL,
	salary NUMERIC(10, 2) NOT NULL
);

INSERT INTO employee (emp_id, emp_name, salary) VALUES
(101, 'Amit', 90000),
(102, 'Rahul', 75000),
(103, 'Priya', 60000),
(104, 'Sneha', 50000),
(105, 'Vikram', 40000);

SELECT emp_id, emp_name, salary
FROM employee
WHERE salary IN (
	SELECT salary
	FROM (
		SELECT DISTINCT salary,
			   DENSE_RANK() OVER (ORDER BY salary DESC) AS salary_rank
		FROM employee
	) ranked_salaries
	WHERE salary_rank IN (2, 3)
)
ORDER BY salary DESC;
```

## Output

```text
 emp_id | emp_name | salary
--------+----------+--------
	102 | Rahul    | 75000
	103 | Priya    | 60000
(2 rows)
```

## Result

The subquery successfully returned the employees with the second-highest salary of 75000 and the third-highest salary of 60000.
