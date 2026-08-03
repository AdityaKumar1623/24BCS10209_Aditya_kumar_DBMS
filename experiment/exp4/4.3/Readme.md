# Experiment 4.3: Joins Practice-2

**Name:** Aditya Kumar

**UID:** 24BCS10209

## Aim

To understand and implement different types of SQL joins (`RIGHT JOIN` and `FULL OUTER JOIN`) for retrieving related data from multiple tables.

## Question

SQL joins are used to combine data from two or more tables based on a common column.

- **RIGHT JOIN** returns all rows from the right table and the matching rows from the left table. If there is no match, the columns from the left table contain `NULL`.
- **FULL OUTER JOIN** returns all rows from both tables. If there is no matching row in either table, the missing values are displayed as `NULL`.

### Task

Write SQL queries to perform the following:

1. Display all orders along with the corresponding customer details using the `customers` and `orders` tables.
2. Display all product names along with their corresponding category names using the `products` and `categories` tables.
3. Display all category names along with product names and prices from the `categories` table.

---

## SQL Queries Used

### 1. All Orders with Customer Details

```sql
SELECT c.customer_name, o.*
FROM customers c
RIGHT JOIN orders o
ON c.customer_id = o.customer_id;
```

### 2. Products and Categories

```sql
SELECT p.product_name, c.category_name
FROM products p
FULL OUTER JOIN categories c
ON p.category_id = c.category_id;
```

### 3. All Category Names with Product Details

```sql
SELECT c.category_name, p.product_name, p.price
FROM products p
RIGHT JOIN categories c
ON p.category_id = c.category_id;
```

---

## Output

### 1. All Orders with Customer Details

```text
┌────────────────┬──────────┬─────────────┬──────────────┬────────────┬──────────┐
│ customer_name  │ order_id │ customer_id │ product_name │ order_date │ quantity │
├────────────────┼──────────┼─────────────┼──────────────┼────────────┼──────────┤
│ Alice Smith    │ 1        │ 1           │ Laptop       │ 2024-01-15 │ 1        │
│ Alice Smith    │ 2        │ 1           │ Mouse        │ 2024-01-15 │ 2        │
│ Bob Johnson    │ 3        │ 2           │ Keyboard     │ 2024-01-20 │ 1        │
│ Carol Williams │ 4        │ 3           │ Monitor      │ 2024-01-22 │ 1        │
└────────────────┴──────────┴─────────────┴──────────────┴────────────┴──────────┘
```

### 2. Products and Categories

```text
┌──────────────┬───────────────┐
│ product_name │ category_name │
├──────────────┼───────────────┤
│ Laptop       │ Electronics   │
│ Mouse        │ Accessories   │
│ Keyboard     │ Accessories   │
│ Monitor      │ Electronics   │
│ Webcam       │ Accessories   │
│ Tablet       │ Tablets       │
└──────────────┴───────────────┘
```

### 3. All Category Names with Product Details

```text
┌───────────────┬──────────────┬───────┐
│ category_name │ product_name │ price │
├───────────────┼──────────────┼───────┤
│ Electronics   │ Laptop       │ 1200  │
│ Accessories   │ Mouse        │ 25    │
│ Accessories   │ Keyboard     │ 75    │
│ Electronics   │ Monitor      │ 300   │
│ Accessories   │ Webcam       │ 60    │
│ Tablets       │ Tablet       │ 250   │
└───────────────┴──────────────┴───────┘
```

---

## Result

The SQL join queries were executed successfully. `RIGHT JOIN` was used to retrieve all records from the right table with matching data from the left table, while `FULL OUTER JOIN` combined all records from both tables. The outputs verified the correct working of different SQL join operations.
```
