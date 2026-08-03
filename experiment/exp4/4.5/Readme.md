# Experiment 4.5: Joins Practice-3

**Name:** Aditya Kumar

**UID:** 24BCS10209

## Aim

To understand and implement **SELF JOIN** and **CROSS JOIN** operations in SQL for retrieving hierarchical data and generating all possible combinations of records.

## Question

SQL provides different types of joins to retrieve data in various ways.

- A **SELF JOIN** is used to join a table with itself. It is commonly used to display hierarchical relationships such as employees and their managers.
- A **CROSS JOIN** returns the Cartesian product of two tables, generating every possible combination of rows from both tables.

### Task

Write SQL queries to perform the following:

1. Display the names of all employees along with their respective manager names using the `employees` table.
2. Display every possible combination of customer names from the `customers` table and product names from the `products` table.

---

## SQL Queries Used

### 1. Employee and Manager Names (SELF JOIN)

```sql
SELECT e1.employee_name AS Employee,
       e2.employee_name AS Manager
FROM employees e1
LEFT JOIN employees e2
ON e1.manager_id = e2.employee_id;
```

### 2. Every Possible Combination (CROSS JOIN)

```sql
SELECT c.customer_name,
       p.product_name
FROM customers c
CROSS JOIN products p;
```

---

## Output

### 1. Employee and Manager Names

```text
┌──────────────┬──────────────┐
│ Employee     │ Manager      │
├──────────────┼──────────────┤
│ John Doe     │ NULL         │
│ Jane Smith   │ John Doe     │
│ Peter Jones  │ John Doe     │
│ Mary Green   │ Peter Jones  │
│ Raj          │ Jane Smith   │
└──────────────┴──────────────┘
```

### 2. Every Possible Combination

```text
┌────────────────┬──────────────┐
│ customer_name  │ product_name │
├────────────────┼──────────────┤
│ Alice Smith    │ Laptop       │
│ Alice Smith    │ Mouse        │
│ Alice Smith    │ Keyboard     │
│ Alice Smith    │ Monitor      │
│ Alice Smith    │ Webcam       │
│ Alice Smith    │ Tablet       │
│ Bob Johnson    │ Laptop       │
│ Bob Johnson    │ Mouse        │
│ ...            │ ...          │
│ Luffy          │ Tablet       │
└────────────────┴──────────────┘
```

> **Note:** The `CROSS JOIN` returns every possible combination of customers and products (6 × 6 = 36 rows).

---


## Result

The SQL queries were executed successfully. The **SELF JOIN** retrieved employee-manager relationships from the same table, while the **CROSS JOIN** generated all possible combinations of customers and products, demonstrating the use of both join operations.
```
