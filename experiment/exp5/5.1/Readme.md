# Experiment 5.1

**Name:** Aditya Kumar

**UID:** 24BCS10209

## Aim

To calculate the percentage of total revenue contributed by **American Cuisine** using aggregate functions, the `CASE` statement, and the `ROUND` function in SQL.

## Question

We need to find what percentage of the total revenue from all orders is contributed by **American Cuisine**.

The percentage is calculated using the following formula:

```text
American Revenue Percentage =
(American Cuisine Revenue / Total Revenue) × 100
```

The final result should be rounded to **2 decimal places** and the calculated column should be aliased as `American_Revenue`.

The `Orders` table contains the following fields:

- `order_id` INT PRIMARY KEY
- `item_name` VARCHAR(255)
- `cuisine` VARCHAR(255)
- `category` VARCHAR(255)
- `price` DECIMAL(10,2)
- `status` VARCHAR(255)

### Task

Write a SQL query to calculate the percentage of total revenue contributed by **American Cuisine**.

---

## SQL Query Used

### Calculate American Cuisine Revenue Percentage

```sql
SELECT ROUND(
    (100 * SUM(
        CASE
            WHEN cuisine = 'American' THEN price
            ELSE 0
        END
    ) / SUM(price)),
    2
) AS American_Revenue
FROM Orders;
```

## Query Explanation

In the above query:

- `CASE` checks whether the cuisine is **American**.
- If the cuisine is American, its `price` is added to the American Cuisine revenue.
- Otherwise, `0` is added.
- `SUM(price)` calculates the total revenue from all orders.
- The American Cuisine revenue is divided by the total revenue and multiplied by `100`.
- `ROUND(..., 2)` rounds the final percentage to 2 decimal places.
- `American_Revenue` is used as the alias for the calculated column.

---

## Output

```text
┌──────────────────┐
│ American_Revenue │
├──────────────────┤
│ 27.75            │
└──────────────────┘
```



## Result

The percentage of total revenue contributed by **American Cuisine** was calculated successfully using the `CASE`, `SUM`, and `ROUND` functions. The final result was **27.75%**.
