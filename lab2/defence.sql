SELECT category, AVG(rating) as AVGRating
FROM categories
     join product on product.categoryid = categories.id
     join reviews on product.id = reviews.productid
GROUP BY category
ORDER BY AVGRating
LIMIT 1;