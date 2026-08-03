# Experiment 4.4 :Full Outer Joins

**Name:** Aditya Kumar

**UID:** 24BCS10209

## Aim

To understand and implement the `FULL OUTER JOIN` operation for combining data from two tables while including both matching and non-matching rows.

## Question

The `FULL OUTER JOIN` combines the results of both `LEFT JOIN` and `RIGHT JOIN`. It returns all rows from both tables, regardless of whether a matching value exists.

The working of `FULL OUTER JOIN` is as follows:

- If a row in the left table matches a row in the right table, the matching rows are combined.
- If a row exists only in the left table, the columns from the right table are filled with `NULL`.
- If a row exists only in the right table, the columns from the left table are filled with `NULL`.

The general syntax is:

```sql
SELECT *
FROM table1
FULL OUTER JOIN table2
ON table1.column = table2.column;
```

### Task

Write a SQL query to perform a `FULL OUTER JOIN` between the `student` and `course` tables using the `Course_id` column and display the joined table.

---

## SQL Query Used

### FULL OUTER JOIN

```sql
SELECT *
FROM student
FULL OUTER JOIN course
ON student.Course_id = course.Course_id;
```

---

## Output

```text
St_id   St_Name          Department          Course_id  Course_id  Course_Name                          Credits  Prof_id
1001    John Smith       Computer Science    CS101      CS101      Introduction to Computer Science     3        2001
1002    Emily Brown      History             HIS102     HIS102     World History II                     3        2004
1003    David Lee        Mathematics         MAT202     MAT202     Linear Algebra                       2        2002
1004    Sarah Johnson    English             ENG201     ENG201     Advanced Writing                     4        2003
1005    Michael Chen     Biology             BIO103     NULL       NULL                                 NULL     NULL
NULL    NULL             NULL                NULL       BIO104     Principles of Bio-technology         4        2006
```

---


## Result

The `FULL OUTER JOIN` query was executed successfully. It returned all matching and non-matching records from both the `student` and `course` tables, demonstrating how `FULL OUTER JOIN` preserves every row from both tables by filling unmatched columns with `NULL` values.
