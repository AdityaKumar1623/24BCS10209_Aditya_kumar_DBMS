# Experiment 5.2

**Name:** Aditya Kumar

**UID:** 24BCS10209

## Aim

To identify invalid tweets using the `CHAR_LENGTH()` string function in SQL.

## Question

The `Tweets` table contains information about tweets posted on a social media application.

A tweet is considered **invalid** if the number of characters in its `content` is **strictly greater than 15**.

### Task

Write a SQL query to find the `tweet_id` of all invalid tweets.

The `Tweets` table contains the following fields:

- `tweet_id` INT
- `content` VARCHAR

### Condition

A tweet is invalid when:

```text
CHAR_LENGTH(content) > 15
```

---

## SQL Query Used

### Find Invalid Tweets

```sql
SELECT tweet_id
FROM Tweets
WHERE CHAR_LENGTH(content) > 15;
```

## Query Explanation

In the above query:

- `CHAR_LENGTH(content)` calculates the number of characters in the tweet content.
- The `WHERE` clause checks whether the character count is greater than `15`.
- Only tweets satisfying this condition are selected.
- `tweet_id` is displayed as the output.

For example:

- `Let us Code` has 11 characters, so it is valid.
- `More than fifteen chars are here!` has more than 15 characters, so it is invalid.

---

## Output

```text
┌──────────┐
│ tweet_id │
├──────────┤
│ 2        │
└──────────┘
```




## Result

The IDs of invalid tweets were successfully identified using the `CHAR_LENGTH()` function. Tweets with more than **15 characters** were selected from the `Tweets` table.
