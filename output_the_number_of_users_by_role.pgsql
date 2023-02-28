SELECT "Users"."role",
COUNT("role") AS total
FROM "Users"
GROUP BY "role";
