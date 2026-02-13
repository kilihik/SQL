SELECT DISTINCT person.name
FROM person
INNER JOIN person_order ON person.id =person_order.person_id
INNER JOIN menu ON person_order.menu_id = menu.id
WHERE person.gender = 'female'
    AND menu.pizza_name IN ('cheese pizza')

INTERSECT

SELECT DISTINCT person.name
FROM person
INNER JOIN person_order ON person.id =person_order.person_id
INNER JOIN menu ON person_order.menu_id = menu.id
WHERE person.gender = 'female'
    AND menu.pizza_name IN ('pepperoni pizza')
ORDER BY name;