SELECT DISTINCT
    person_order.order_date AS action_date,
    person.name 
FROM person_order
INNER JOIN person
    ON person_order.person_id = person.id
ORDER BY action_date ASC, person.name DESC;  