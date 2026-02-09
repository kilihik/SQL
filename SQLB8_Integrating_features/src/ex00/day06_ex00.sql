CREATE TABLE person_discounts (
    id BIGINT PRIMARY KEY,
    person_id BIGINT NOT NULL,
    pizzeria_id BIGINT NOT NULL,
    discount NUMERIC(5,2) NOT NULL CHECK (discount >= 0 AND discount <= 100),
    
    CONSTRAINT fk_person_discounts_person_id 
        FOREIGN KEY (person_id) 
        REFERENCES person(id),
    
    CONSTRAINT fk_person_discounts_pizzeria_id 
        FOREIGN KEY (pizzeria_id) 
        REFERENCES pizzeria(id),
    
    CONSTRAINT unique_person_pizzeria UNIQUE (person_id, pizzeria_id)
);