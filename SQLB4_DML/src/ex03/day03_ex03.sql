WITH visits AS 
    (SELECT 
        pizzeria.name AS pizzeria_name,
        person.gender
    FROM person_visits 
    JOIN person ON person_visits.person_id = person.id
    JOIN pizzeria ON person_visits.pizzeria_id = pizzeria.id)
(SELECT pizzeria_name FROM visits WHERE gender = 'female'
 EXCEPT ALL
 SELECT pizzeria_name FROM visits WHERE gender = 'male')
UNION ALL
(SELECT pizzeria_name FROM visits WHERE gender = 'male'
 EXCEPT ALL
 SELECT pizzeria_name FROM visits WHERE gender = 'female')
ORDER BY pizzeria_name;