SELECT id, name, price, avg(price), min(price)
FROM product
WHERE categoryid = 1
GROUP BY id, name, price
ORDER BY id;