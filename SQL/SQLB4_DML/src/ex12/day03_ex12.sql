INSERT INTO person_order (id, person_id, menu_id, order_date)
SELECT 
    (SELECT MAX(id) FROM person_order) + generate_series.id AS new_id,
    person.id AS person_id,
    (SELECT id FROM menu WHERE pizza_name = 'greek pizza') AS menu_id,
    '2022-02-25' AS order_date
FROM person
CROSS JOIN generate_series(1, (SELECT COUNT(*) FROM person)) AS generate_series(id)
WHERE generate_series.id = person.id;



