SELECT category, MAX(price) as MAX, AVG(price) as AVG, SUM(price) / COUNT(price) as Calc_AVG
from product join categories on product.categoryid = categories.id
GROUP BY (category);