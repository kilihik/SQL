SELECT 
    menu_1.pizza_name,
    pizzeria_1.name AS pizzeria_name_1,
    pizzeria_2.name AS pizzeria_name_2,
    menu_1.price
FROM menu menu_1
JOIN menu menu_2 ON menu_1.pizza_name = menu_2.pizza_name 
    AND menu_1.price = menu_2.price 
    AND menu_1.pizzeria_id > menu_2.pizzeria_id
JOIN pizzeria pizzeria_1 ON menu_1.pizzeria_id = pizzeria_1.id
JOIN pizzeria pizzeria_2 ON menu_2.pizzeria_id = pizzeria_2.id
ORDER BY menu_1.pizza_name;