<!-- hackerrank -->
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
