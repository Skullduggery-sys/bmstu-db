SELECT categoryid, avg(price), max(price), min(price)
FROM product
GROUP BY categoryid
HAVING avg(price) < (SELECT AVG(price) from product);