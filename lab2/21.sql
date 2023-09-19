DELETE FROM "order"
WHERE statusid IN (SELECT statusid
                   from "order" join status ON "order".statusid = status.id
                   WHERE status.status = 'Done');