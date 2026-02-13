SELECT 
    person.name AS person_name1,
    person_two.name AS person_name2,
    person.address AS common_address
FROM person
INNER JOIN person AS person_two
    ON person.address = person_two.address
    AND person.id > person_two.id
ORDER BY person.name, person_two.name, person.address;