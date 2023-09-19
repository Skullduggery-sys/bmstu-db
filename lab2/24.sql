SELECT
    DISTINCT nickname,
    AVG(price) OVER (PARTITION BY nickname),
    MIN(price) OVER (PARTITION BY nickname),
    MAX(price) OVER (PARTITION BY nickname)
FROM "order"
    join product on productid = product.id
    join "user" on userid = "user".id;
