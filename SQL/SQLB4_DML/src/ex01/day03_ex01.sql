SELECT id AS menu_id
FROM menu
WHERE id NOT IN (
    SELECT DISTINCT menu_id
    FROM person_order
    WHERE menu_id IS NOT NULL
)
ORDER BY menu_id; 