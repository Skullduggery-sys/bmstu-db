select categoryid
FROM product
WHERE EXISTS(SELECT category
             from product join categories on product.categoryid = categories.id
             WHERE category isnull)