WITH orders AS 
    (SELECT
        pizzeria.name AS pizzeria_name,
        person.gender
    FROM person_order 
    JOIN menu ON person_order.menu_id = menu.id
    JOIN pizzeria ON menu.pizzeria_id = pizzeria.id
    JOIN person ON person_order.person_id = person.id)
(SELECT pizzeria_name FROM orders WHERE gender = 'female'
 EXCEPT
 SELECT pizzeria_name FROM orders WHERE gender = 'male')
UNION
(SELECT pizzeria_name FROM orders WHERE gender = 'male'
 EXCEPT
 SELECT pizzeria_name FROM orders WHERE gender = 'female')
ORDER BY pizzeria_name;