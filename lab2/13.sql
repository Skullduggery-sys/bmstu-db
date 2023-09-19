SELECT id, email
FROM "user"
WHERE id in (
    SELECT userid
    FROM "order"
    WHERE userid in (
        SELECT userid
        FROM reviews
        WHERE rating = 5
        )
    );