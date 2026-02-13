REATE TABLE IF NOT EXISTS cities (
    point1 VARCHAR NOT NULL,
    point2 VARCHAR NOT NULL,
    cost INTEGER NOT NULL
);

INSERT INTO cities (point1, point2, cost) VALUES
('a', 'b', 10),
('a', 'c', 15),
('a', 'd', 20),
('b', 'c', 35),
('b', 'd', 25),
('c', 'd', 30),
('b', 'a', 10),
('c', 'a', 15),
('d', 'a', 20),
('c', 'b', 35),
('d', 'b', 25),
('d', 'c', 30);

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
ORDER BY total_cost, tour;