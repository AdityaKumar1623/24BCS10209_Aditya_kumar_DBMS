# Experiment 5.3

**Name:** Aditya Kumar

**UID:** 24BCS10209

## Aim

To implement conditional statements in PL/pgSQL using `IF`, `ELSIF`, and `ELSE` statements to check whether a given value lies within a particular range.

## Question

Write a PL/pgSQL program to check the value of a variable and display an appropriate message based on the range in which the value lies.

The program should check the following conditions:

- If the value is between **1 and 10**, display that the value is in the range 1 to 10.
- If the value is between **11 and 20**, display that the value is in the range 11 to 20.
- If the value is greater than **20**, display that the value is greater than 20.

The `IF`, `ELSIF`, and `ELSE` conditional statements are used to perform these checks.

---

## SQL Query Used

### PL/pgSQL Conditional Statement

```sql
DO $$
DECLARE
    VAL INT := 4;
BEGIN

    IF VAL > 0 AND VAL <= 10 THEN

        RAISE NOTICE 'YOUR VALUE IS % AND RANGE IS BETWEEN 1 TO 10', VAL;

    ELSIF VAL > 10 AND VAL <= 20 THEN

        RAISE NOTICE 'YOUR VALUE IS % AND RANGE IS BETWEEN 11 TO 20', VAL;

    ELSE

        RAISE NOTICE 'YOUR VALUE IS % AND VALUE IS GREATER THAN 20', VAL;

    END IF;

END;
$$;
```

## Query Explanation

In the above PL/pgSQL program:

- `DO $$` starts an anonymous PL/pgSQL block.
- `DECLARE` is used to declare variables.
- `VAL INT := 4;` declares an integer variable named `VAL` and initializes it with the value `4`.
- The `IF` statement checks whether the value is between `1` and `10`.
- The `ELSIF` statement checks whether the value is between `11` and `20`.
- The `ELSE` statement executes when the value is greater than `20`.
- `RAISE NOTICE` is used to display the result as a message.
- `%` in the `RAISE NOTICE` statement is replaced by the value of `VAL`.
- `END IF` marks the end of the conditional statement.
- `END` marks the end of the PL/pgSQL block.
- `$$;` terminates the anonymous block.

Since the value of `VAL` is `4`, the first `IF` condition is satisfied.

---

## Output

```text
NOTICE:  YOUR VALUE IS 4 AND RANGE IS BETWEEN 1 TO 10
```

---



## Result

The PL/pgSQL program was executed successfully using `IF`, `ELSIF`, and `ELSE` conditional statements. For the given value `4`, the program correctly identified that the value lies between **1 and 10** and displayed the appropriate message using `RAISE NOTICE`.
