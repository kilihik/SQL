INSERT INTO person_visits (id, person_id, pizzeria_id, visit_date)
VALUES (
    (SELECT MAX(id) + 1 FROM person_visits), 
    (SELECT id FROM person WHERE name = 'Dmitriy'), 
    (SELECT DISTINCT m.pizzeria_id 
        FROM menu m
        WHERE m.price < 800 
          AND m.pizzeria_id != (
              SELECT p.id 
              FROM pizzeria p
              JOIN mv_dmitriy_visits_and_eats mv ON p.name = mv.pizzeria_name
              LIMIT 1)
        LIMIT 1),
    '2022-01-08');

REFRESH MATERIALIZED VIEW mv_dmitriy_visits_and_eats;