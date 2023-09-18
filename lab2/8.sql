SELECT name,
       description,
       (SELECT AVG(price) from product) AS AVG_PRICE,
       (SELECT MAX(price) from product) AS MAX_PRICE
FROM product join categories on product.categoryid = categories.id
WHERE category = 'Clothes';