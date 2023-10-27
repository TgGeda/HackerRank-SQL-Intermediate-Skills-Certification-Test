# HackerRank SQL (Intermediate) Skills Certification Test

This repository contains the solutions to the HackerRank SQL (Intermediate) Skills Certification Test. The test consists of two tasks that involve querying a database using SQL.

## Task 1: Business Expansion

As part of the business expansion efforts at a company, your help is needed to find all pairs of customers and agents who have been in contact more than once. For each such pair, the user id, first name, last name, customer id, customer name, and the number of their contacts should be displayed. The results should be ordered by user id in ascending order.

### SQL Query:

```sql
SELECT
    ua.id AS user_id,
    ua.first_name,
    ua.last_name,
    c.id AS customer_id,
    c.customer_name,
    COUNT(*) AS contact_count
FROM
    customer AS c
    JOIN contact AS con ON c.id = con.customer_id
    JOIN user_account AS ua ON ua.id = con.user_account_id
GROUP BY
    ua.id,
    ua.first_name,
    ua.last_name,
    c.id,
    c.customer_name
HAVING
    COUNT(*) > 1
ORDER BY
    ua.id ASC;
```

## Task 2: Product Sales per City

For each pair of city and product, the names of the city and product, as well as the total amount spent on the product (rounded to 2 decimal places), should be returned. The results should be ordered by the amount spent in descending order, then by city name and product name in ascending order.

### SQL Query:

```sql
SELECT
    ci.city_name,
    pr.product_name,
    ROUND(SUM(ii.line_total_price), 2) AS total_amount_spent
FROM
    city ci,
    customer cu,
    invoice i,
    invoice_item ii,
    product pr
WHERE
    ci.id = cu.city_id
    AND cu.id = i.customer_id
    AND i.id = ii.invoice_id
    AND ii.product_id = pr.id
GROUP BY
    ci.city_name,
    pr.product_name
ORDER BY
    total_amount_spent DESC,
    ci.city_name,
    pr.product_name;
```

Please refer to the respective SQL queries for each task to execute them against your database.
