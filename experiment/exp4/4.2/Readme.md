# Experiment 4.2

**Name:** Aditya Kumar

**UID:** 24BCS10209

## Aim

To understand the working of `JOIN` and `LEFT JOIN` by combining data from the `student` and `course` tables using the `Course_id` column.

## Question

By default, SQL returns only the matching rows when two tables are joined using the `JOIN` (INNER JOIN) operation.

However, if we want to display all the rows from the left table, even when there is no matching row in the right table, we use the `LEFT JOIN`.

Below is the syntax to perform a `LEFT JOIN`:

```sql
SELECT *
FROM student
LEFT JOIN course
ON student.Course_id = course.Course_id;
```

### Task

Write SQL queries to perform the following:

- Join the `student` and `course` tables using `Course_id` with `JOIN`.
- Join the `student` and `course` tables using `Course_id` with `LEFT JOIN`.

---

## SQL Queries Used

### 1. INNER JOIN

```sql
SELECT *
FROM student
JOIN course
ON student.Course_id = course.Course_id;
```

### 2. LEFT JOIN

```sql
SELECT *
FROM student
LEFT JOIN course
ON student.Course_id = course.Course_id;
```

---

## Output

### INNER JOIN Output

```text
St_id   St_Name          Department          Course_id  Course_id  Course_Name                          Credits  Prof_id
1001    John Smith       Computer Science    CS101      CS101      Introduction to Computer Science     3        2001
1002    Emily Brown      History             HIS102     HIS102     World History II                     3        2004
1003    David Lee        Mathematics         MAT202     MAT202     Linear Algebra                       2        2002
1004    Sarah Johnson    English             ENG201     ENG201     Advanced Writing                     4        2003
```

### LEFT JOIN Output

```text
St_id   St_Name          Department          Course_id  Course_id  Course_Name                          Credits  Prof_id
1001    John Smith       Computer Science    CS101      CS101      Introduction to Computer Science     3        2001
1002    Emily Brown      History             HIS102     HIS102     World History II                     3        2004
1003    David Lee        Mathematics         MAT202     MAT202     Linear Algebra                       2        2002
1004    Sarah Johnson    English             ENG201     ENG201     Advanced Writing                     4        2003
1005    Michael Chen     Biology             BIO103     NULL       NULL                                 NULL     NULL
```

---


## Result

The `JOIN` and `LEFT JOIN` operations were executed successfully. The `JOIN` returned only the matching records from both tables, while the `LEFT JOIN` returned all records from the `student` table along with matching course details, displaying `NULL` for students without a corresponding course.
