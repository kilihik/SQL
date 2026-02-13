WITH RECURSIVE paths AS (
    SELECT 
        point1,
        point2,
        cost,
        ARRAY[point1] AS path,
        cost AS total_cost
    FROM cities
    WHERE point1 = 'a'
    
    UNION ALL
    
    SELECT 
        c.point1,
        c.point2,
        c.cost,
        p.path || c.point1,
        p.total_cost + c.cost
    FROM paths p
    JOIN cities c ON p.point2 = c.point1
    WHERE NOT c.point1 = ANY(p.path)
),
full_paths AS (
    SELECT 
        total_cost + (SELECT cost FROM cities WHERE point1 = p.point2 AND point2 = 'a') AS total_cost,
        path || point2 || 'a' AS tour
    FROM paths p
    WHERE array_length(path, 1) = 4
)
SELECT 
    total_cost,
    '{' || array_to_string(tour, ',') || '}' AS tour
FROM full_paths
WHERE total_cost = (SELECT MIN(total_cost) FROM full_paths)
   OR total_cost = (SELECT MAX(total_cost) FROM full_paths)
ORDER BY total_cost, tour;