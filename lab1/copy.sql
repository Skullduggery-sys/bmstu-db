COPY public.categories(category)  FROM '/tmp/categories.csv' DELIMITER ',' CSV HEADER;
COPY public.user(nickname, name, surname, email, password) FROM '/tmp/users.csv' DELIMITER ',' CSV HEADER;
COPY public.product(name, description, price, categoryid)  FROM '/tmp/products.csv' DELIMITER ',' CSV HEADER;
COPY public.reviews(description, rating, userid, productid)  FROM '/tmp/reviews.csv' DELIMITER ',' CSV HEADER;
COPY public.status(status)  FROM '/tmp/statuses.csv' DELIMITER ',' CSV HEADER;
COPY public.order(time, statusid, userid, productid) FROM '/tmp/orders.csv' DELIMITER ',' CSV HEADER;
