CREATE TABLE IF NOT EXISTS public.user (
    id serial,
    nickname text,
    name text,
    surname text,
    email text,
    password varchar(20)
);

CREATE TABLE IF NOT EXISTS public.status (
    id serial,
    status text
);

CREATE TABLE IF NOT EXISTS public.categories(
    id serial,
    category text
);

CREATE TABLE IF NOT EXISTS public.product (
    id serial,
    name text,
    description text,
    price real,
    categoryID int
);

CREATE TABLE IF NOT EXISTS public.order (
    id serial,
    time timestamp,
    status int,
    userID int
);

CREATE TABLE IF NOT EXISTS public.reviews (
    id serial,
    text text,
    rating int,
    userID int,
    productID int
);