INSERT INTO person_discounts (id, person_id, pizzeria_id, discount)
WITH order_counts AS (
    SELECT 
        person_id,
        pizzeria_id,
        COUNT(*) AS order_count
    FROM person_order po
    JOIN menu m ON po.menu_id = m.id
    GROUP BY person_id, pizzeria_id
)
SELECT 
    ROW_NUMBER() OVER () AS id,
    person_id,
    pizzeria_id,
    CASE 
        WHEN order_count = 1 THEN 10.5
        WHEN order_count = 2 THEN 22.0
        ELSE 30.0
    END AS discount
FROM order_counts;