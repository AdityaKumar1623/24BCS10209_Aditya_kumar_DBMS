# Experiment 3.4

**Name:** Aditya Kumar

**UID:** 24BCS10209

## Aim

To understand and implement the `LEFT JOIN` operation for retrieving all records from one table along with matching records from another table, including rows with `NULL` values.

## Question

The `LEFT JOIN` returns all rows from the left table and the matching rows from the right table. If no matching row exists in the right table, the corresponding columns are filled with `NULL`.

This type of join is useful when we need to retrieve all records from the primary table, regardless of whether related data exists in the secondary table.

General syntax:

```sql
SELECT *
FROM table1
LEFT JOIN table2
ON table1.column = table2.column;
```

### Task

Write a SQL query to display the **name** and **bonus** of every employee who satisfies either of the following conditions:

- The employee has a bonus less than **1000**.
- The employee did not receive any bonus.

---

## SQL Query Used

### Employee Bonus Report

```sql
SELECT Employee.name, Bonus.bonus
FROM Employee
LEFT JOIN Bonus
ON Employee.empId = Bonus.empId
WHERE Bonus.bonus < 1000
   OR Bonus.bonus IS NULL;
```

---

## Output

```text
┌──────┬───────┐
│ name │ bonus │
├──────┼───────┤
│ Brad │ NULL  │
│ John │ NULL  │
│ Dan  │ 500   │
└──────┴───────┘
```

---


## Result

The `LEFT JOIN` query was executed successfully. It displayed the names and bonus amounts of employees who either received a bonus less than **1000** or did not receive any bonus, demonstrating the use of `LEFT JOIN` and `NULL` handling in SQL.
