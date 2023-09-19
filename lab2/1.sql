SELECT *
FROM product JOIN categories ON product.categoryid = categories.id
WHERE price > 500
ORDER BY price DESC;
