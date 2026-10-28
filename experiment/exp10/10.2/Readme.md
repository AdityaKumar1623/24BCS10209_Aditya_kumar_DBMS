# Experiment 10.2

Name: Aditya Kumar

UID: 24BCS10209

## Aim

To find dishes whose cost is greater than the average cost of all dishes using a non-correlated subquery.

## Question

Write a query to display `f_name`, `f_cost`, and `f_type` for dishes whose cost is greater than the average cost of all dishes at the restaurant.

## SQL Queries Used

```sql
CREATE TABLE food (
    f_id INT PRIMARY KEY,
    f_name VARCHAR(100) NOT NULL,
    f_cost INT NOT NULL,
    f_type VARCHAR(50) NOT NULL
);

INSERT INTO food (f_id, f_name, f_cost, f_type) VALUES
(1, 'Sushi', 20, 'Japanese'),
(2, 'Tandoori Chicken', 15, 'Indian'),
(3, 'Beef Stroganoff', 18, 'Russian'),
(4, 'Paella', 25, 'Spanish'),
(5, 'Moussaka', 16, 'Greek'),
(6, 'Plain Rice', 1, 'Indian'),
(7, 'Bread', 1, 'Bakery'),
(8, 'Soup', 1, 'Continental'),
(9, 'Salad', 1, 'Healthy'),
(10, 'Tea', 1, 'Beverage');

SELECT f_name, f_cost, f_type
FROM food
WHERE f_cost > (
    SELECT AVG(f_cost)
    FROM food
)
ORDER BY f_id;
```

## Output

```text
     f_name      | f_cost |  f_type
-----------------+--------+----------
 Sushi           |     20 | Japanese
 Tandoori Chicken|     15 | Indian
 Beef Stroganoff |     18 | Russian
 Paella          |     25 | Spanish
 Moussaka        |     16 | Greek
(5 rows)
```

## Output Screenshot

![Experiment 10 Task 2 Output](image.png)

## Image Explanation

The query uses a non-correlated subquery to calculate the average cost of all dishes. It then returns only dishes whose cost is greater than that average. The result contains Sushi, Tandoori Chicken, Beef Stroganoff, Paella, and Moussaka.

## Result

The non-correlated subquery successfully displayed the five dishes whose cost was greater than the average dish cost.
