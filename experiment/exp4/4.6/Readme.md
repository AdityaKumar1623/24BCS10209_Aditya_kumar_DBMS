# Experiment 4.6: Self Joins

**Name:** Aditya Kumar

**UID:** 24BCS10209

## Aim

To understand and implement **SELF JOIN** in SQL for comparing records within the same table and retrieving related information.

## Question

A **SELF JOIN** is used to join a table with itself. It is useful when the relationship exists within the same table, such as employee-manager relationships, students belonging to the same department, or students having the same favorite course.

Since the same table is used twice, **table aliases** are required to distinguish between the two instances.

General syntax:

```sql
SELECT
    e1.employee_name AS Employee,
    e2.employee_name AS Manager
FROM employees AS e1
INNER JOIN employees AS e2
ON e1.manager_id = e2.employee_id;
```

### Task

Write SQL queries to perform the following:

1. Find pairs of students who belong to the same department.
2. Find students who have selected the same `Course_id` as their favorite course. Display `St_id`, `St_Name`, and `Course_id` in ascending order of `Course_id`.

---

## SQL Queries Used

### 1. Students Belonging to the Same Department

```sql
SELECT *
FROM student AS s1
INNER JOIN student AS s2
ON s1.Department = s2.Department
AND s1.St_id != s2.St_id;
```

### 2. Students Having the Same Favorite Course

```sql
SELECT DISTINCT
    s1.St_id,
    s1.St_Name,
    s1.Course_id
FROM student AS s1
INNER JOIN student AS s2
ON s1.Course_id = s2.Course_id
AND s1.St_id != s2.St_id
ORDER BY s1.Course_id;
```

---

## Output

### Part 1: Students in the Same Department

```text
┌───────┬─────────────────┬─────────────┬───────┬─────────────────┬─────────────┐
│ St_id │ St_Name         │ Department  │ St_id │ St_Name         │ Department  │
├───────┼─────────────────┼─────────────┼───────┼─────────────────┼─────────────┤
│ 1003  │ David Lee       │ Mathematics │ 1006  │ Light Yagami    │ Mathematics │
│ 1004  │ Sarah Johnson   │ English     │ 1008  │ Patrick Bateman │ English     │
│ 1005  │ Michael Chen    │ Biology     │ 1007  │ Jordan          │ Biology     │
│ 1006  │ Light Yagami    │ Mathematics │ 1003  │ David Lee       │ Mathematics │
│ 1007  │ Jordan          │ Biology     │ 1005  │ Michael Chen    │ Biology     │
│ 1008  │ Patrick Bateman │ English     │ 1004  │ Sarah Johnson   │ English     │
└───────┴─────────────────┴─────────────┴───────┴─────────────────┴─────────────┘
```

### Part 2: Students with the Same Favorite Course

```text
┌───────┬─────────────────┬───────────┐
│ St_id │ St_Name         │ Course_id │
├───────┼─────────────────┼───────────┤
│ 1005  │ Michael Chen    │ BIO103    │
│ 1007  │ Jordan          │ BIO103    │
│ 1004  │ Sarah Johnson   │ ENG201    │
│ 1008  │ Patrick Bateman │ ENG201    │
│ 1003  │ David Lee       │ MAT202    │
│ 1006  │ Light Yagami    │ MAT202    │
└───────┴─────────────────┴───────────┘
```

---



## Result

The **SELF JOIN** queries were executed successfully. The first query displayed pairs of students from the same department, while the second query identified students who had selected the same favorite course. This experiment demonstrated how **SELF JOIN** can be used to compare and relate records within the same table.
