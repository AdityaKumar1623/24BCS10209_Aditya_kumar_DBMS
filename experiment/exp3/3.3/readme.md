# Experiment 3.3  

Name: Aditya Kumar
UID: 24BCS10209

## Aim  

To find all customers who never placed any orders using SQL queries with subqueries.  

## Question  

We are given two tables:  

### Table: Customers  

| Column Name | Type    |  
|-------------|---------|  
| id          | int     |  
| name        | varchar |  

- `id` is the primary key.  
- Each row represents a customer’s ID and name.  

### Table: Orders  

| Column Name | Type |  
|-------------|------|  
| id          | int  |  
| customerId  | int  |  

- `id` is the primary key.  
- `customerId` is a foreign key referencing `id` from the Customers table.  
- Each row represents an order placed by a customer.  

### Task  

Write a query to return all customers who **never placed any orders**.  
Alias the output column as **`Customers`**.  

---

## SQL Queries Used  

### Find Customers Who Never Ordered  

```sql
SELECT name AS Customers
FROM Customers
WHERE id NOT IN (
    SELECT customerId
    FROM Orders
);
