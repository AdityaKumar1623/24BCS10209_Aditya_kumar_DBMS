# Experiment 10.3

Name: Aditya Kumar

UID: 24BCS10209

## Aim

To find highly rated dishes using a correlated subquery.

## Question

Write a query to display `f_name`, `f_cost`, and `f_type` for dishes whose average rating is greater than or equal to 4.

## SQL Queries Used

```sql
CREATE TABLE food (
    f_id INT PRIMARY KEY,
    f_name VARCHAR(100) NOT NULL,
    f_cost INT NOT NULL,
    f_type VARCHAR(50) NOT NULL
);

CREATE TABLE ratings (
    f_id INT REFERENCES food(f_id),
    f_rating INT NOT NULL
);

INSERT INTO food (f_id, f_name, f_cost, f_type) VALUES
(1, 'Pizza', 10, 'Continental'),
(2, 'Fried Rice', 12, 'Chinese'),
(3, 'Pad Thai', 14, 'Thai'),
(4, 'Sushi', 20, 'Japanese'),
(5, 'Tandoori Chicken', 15, 'Indian'),
(6, 'Beef Stroganoff', 18, 'Russian'),
(7, 'Paella', 25, 'Spanish'),
(8, 'Moussaka', 16, 'Greek');

INSERT INTO ratings (f_id, f_rating) VALUES
(1, 4), (1, 3), (1, 4),
(2, 4), (2, 4), (2, 4),
(3, 5), (3, 3),
(4, 5), (4, 4),
(5, 3), (5, 4),
(6, 4), (6, 5),
(7, 5), (7, 4),
(8, 3), (8, 4);

SELECT f.f_name, f.f_cost, f.f_type
FROM food AS f
WHERE (
    SELECT AVG(r.f_rating::NUMERIC)
    FROM ratings AS r
    WHERE r.f_id = f.f_id
) >= 4
ORDER BY f.f_id;
```

## Output

```text
     f_name      | f_cost |   f_type
-----------------+--------+-------------
 Pizza           |     10 | Continental
 Fried Rice      |     12 | Chinese
 Pad Thai        |     14 | Thai
 Sushi           |     20 | Japanese
 Beef Stroganoff |     18 | Russian
 Paella          |     25 | Spanish
(6 rows)
```

## Output Screenshot

![Experiment 10 Task 3 Output](image.png)

## Image Explanation

The correlated subquery calculates the average rating for each dish by matching `ratings.f_id` with the current row from `food`. Only dishes with an average rating of at least 4 are displayed. The result contains Pizza, Fried Rice, Pad Thai, Sushi, Beef Stroganoff, and Paella.

## Result

The correlated subquery successfully displayed all dishes whose average rating was greater than or equal to 4.
