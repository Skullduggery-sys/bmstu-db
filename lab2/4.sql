SELECT * FROM "user"
WHERE name IN (SELECT name from "user" WHERE name = 'Lyla');
