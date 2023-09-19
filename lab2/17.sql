INSERT INTO product(name, description, price, categoryid)
SELECT name, description, (SELECT MAX(price) FROM product), 1
from product
WHERE name = 'Allagash Curieux';