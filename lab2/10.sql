SELECT name, CASE
                WHEN price < 350 THEN 'Inexpensive'
                WHEN price < 650 THEN 'Fair'
                WHEN price < 800 THEN 'Expensive'
                ELSE 'Very expensive'
                END AS "price"
FROM product;