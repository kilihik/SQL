SELECT 
    pz.name,
    COALESCE(visits.count, 0) + COALESCE(orders.count, 0) AS total_count
FROM 
    pizzeria pz
LEFT JOIN (
    SELECT 
        pizzeria_id,
        COUNT(*) AS count
    FROM 
        person_visits
    GROUP BY 
        pizzeria_id
) AS visits ON pz.id = visits.pizzeria_id
LEFT JOIN (
    SELECT 
        m.pizzeria_id,
        COUNT(*) AS count
    FROM 
        person_order po
    JOIN 
        menu m ON po.menu_id = m.id
    GROUP BY 
        m.pizzeria_id
) AS orders ON pz.id = orders.pizzeria_id
ORDER BY 
    total_count DESC,
    pz.name ASC;