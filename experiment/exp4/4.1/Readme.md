# Experiment 4.1: Joins Practice-1  

Name: Aditya Kumar  
UID: 24BCS10209  

## Aim  

To practice SQL JOIN operations by solving queries involving multiple tables (`customers`, `orders`, `products`, `categories`, and `employees`).  

## Question  

We are given the following tables:  

### customers  

| customer_id | customer_name   | city        |  
|-------------|-----------------|-------------|  
| 1           | Alice Smith     | New York    |  
| 2           | Bob Johnson     | Los Angeles |  
| 3           | Carol Williams  | Chicago     |  
| 4           | David Brown     | Houston     |  
| 5           | Emily Davis     | Phoenix     |  
| 6           | Luffy           | NULL        |  

### orders  

| order_id | customer_id | product_name | order_date  | quantity |  
|----------|-------------|--------------|-------------|----------|  
| 1        | 1           | Laptop       | 2024-01-15  | 1        |  
| 2        | 1           | Mouse        | 2024-01-15  | 2        |  
| 3        | 2           | Keyboard     | 2024-01-20  | 1        |  
| 4        | 3           | Monitor      | 2024-01-22  | 1        |  
| 5        | 2           | Laptop       | 2024-02-01  | 2        |  

### products  

| product_id | product_name | category_id | price |  
|------------|--------------|-------------|-------|  
| 1          | Laptop       | 1           | 1200  |  
| 2          | Mouse        | 2           | 25    |  
| 3          | Keyboard     | 2           | 75    |  
| 4          | Monitor      | 1           | 300   |  
| 5          | Webcam       | 2           | 60    |  
| 6          | Tablet       | 3           | 250   |  

### categories  

| category_id | category_name |  
|-------------|---------------|  
| 1           | Electronics   |  
| 2           | Accessories   |  
| 3           | Tablets       |  

### employees  

| employee_id | employee_name | manager_id | department |  
|-------------|---------------|------------|------------|  
| 1           | John Doe      | NULL       | Sales      |  
| 2           | Jane Smith    | 1          | Sales      |  
| 3           | Peter Jones   | 1          | Marketing  |  
| 4           | Mary Green    | 3          | Marketing  |  
| 5           | Raj           | 2          | Sales      |  

---

## Tasks, Queries, and Outcomes  

### 1. Customers and Orders  
List the `customer_name` and `order_date` for all customers who have placed orders.  

```sql
SELECT c.customer_name, o.order_date
FROM customers c
INNER JOIN orders o ON c.customer_id = o.customer_id;
