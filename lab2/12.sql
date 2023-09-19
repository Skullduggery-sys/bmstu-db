SELECT nickname, email, time
FROM "user"
join (SELECT userid, time
      FROM "order"
      WHERE time > '2022-10-15') AS D on D.userid = "user".id;