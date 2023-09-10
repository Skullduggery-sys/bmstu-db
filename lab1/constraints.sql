ALTER TABLE public.user
ADD UNIQUE (nickname),
ADD CHECK (char_length(password) > 0),
ALTER COLUMN password SET NOT NULL,
ALTER COLUMN email SET NOT NULL,
ALTER COLUMN nickname SET NOT NULL,
ADD PRIMARY KEY (id);

ALTER TABLE public.categories
ALTER COLUMN category SET NOT NULL,
ADD PRIMARY KEY (id);

ALTER TABLE public.status
ALTER COLUMN status SET NOT NULL,
ADD PRIMARY KEY (id);

ALTER TABLE public.product
ALTER COLUMN name SET NOT NULL,
ALTER COLUMN price SET NOT NULL,
ADD CHECK (price > 0),
ADD FOREIGN KEY (categoryid) REFERENCES public.categories (id),
ADD PRIMARY KEY (id);

ALTER TABLE public.reviews
ALTER COLUMN rating SET NOT NULL,
ADD FOREIGN KEY (userID) REFERENCES public.user (id),
ADD FOREIGN KEY (productID) REFERENCES public.product (id),
ADD PRIMARY KEY (id);

ALTER TABLE public.order
ADD PRIMARY KEY (id),
ALTER COLUMN time SET NOT NULL,
ADD FOREIGN KEY (status) REFERENCES public.status (id),
ADD FOREIGN KEY (userID) REFERENCES public.reviews (id);





