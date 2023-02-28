/* 1 */
WITH subquery AS (
  SELECT "id"
  FROM "Users"
  WHERE "Users"."role" = 'creator'
  ORDER BY "Users"."rating" DESC
  LIMIT 3
)
UPDATE "Users"
SET "balance" = "balance" + 10
FROM subquery
WHERE "Users"."id" = subquery.id;

/* 2 */
UPDATE "Users"
SET "balance" = "balance" + 10
WHERE "Users"."id" IN (
    SELECT "id"
    FROM "Users"
    WHERE "Users"."role" = 'creator'
    ORDER BY "rating" DESC
    LIMIT 3
  );
