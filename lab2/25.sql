SELECT *
FROM (
    SELECT *, row_number() over (PARTITION BY userid) as cnt
    FROM "order"
     ) AS T
WHERE cnt = 1
;