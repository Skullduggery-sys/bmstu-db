UPDATE product
SET price = (SELECT MAX(categoryid) from product)
WHERE id = 2;