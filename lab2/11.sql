SELECT SUM(price)
INTO tmp
FROM "order"
    join product on "order".productid = product.id
    join status on "order".statusid = status.id
    join "user" on userid = "user".id
WHERE "user".name is not null
GROUP BY "order".id;
