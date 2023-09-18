SELECT nickname,
       password,
       CASE "user".name WHEN 'Lyla' THEN 'yes' ELSE 'no' END AS "Is it Lyla?"
FROM "user";
