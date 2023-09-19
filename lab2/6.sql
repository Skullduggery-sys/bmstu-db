SELECT name, description, price
FROM product
WHERE price > ALL(SELECT price
                  from product join categories on product.categoryid = categories.id
                  where category = 'Shoes');
