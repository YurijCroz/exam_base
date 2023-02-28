WITH subquery AS (
  SELECT "Contests"."userId", SUM("Contests"."prize")
  FROM "Contests"
  WHERE "Contests"."createdAt" BETWEEN '2022-12-25' AND '2023-1-14'
  GROUP BY "Contests"."userId"
)
UPDATE "Users"
SET "balance" = "balance" + subquery.sum*0.1
FROM subquery
WHERE "Users"."id" = "subquery"."userId";