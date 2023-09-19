INSERT INTO "user"(nickname, name, surname, email, password) VALUES
                                                               ('sdfjsdfsd', null, null,'dklsdks@mail.com', 'sdklfsd'),
                                                                ('ojfkmsp', null, null,'dklsdks@mail.com', 'sdklfsd'),
                                                                ('d;lkdjlmvd', null, null,'dklsdks@mail.com', 'sdklfsd'),
                                                                ('lfsv;', null, null,'dklsdks@mail.com', 'sdklfsd');

WITH CTE(nickname, total) AS (
    SELECT nickname, COUNT(*) as total
    FROM "user"
    WHERE name is null || surname is null
    GROUP BY nickname
)

SELECT nickname, total as "without nickname" from CTE;