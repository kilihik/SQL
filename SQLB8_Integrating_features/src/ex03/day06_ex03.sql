CREATE UNIQUE INDEX idx_person_discounts_unique ON person_discounts (person_id, pizzeria_id);

SET enable_seqscan = OFF;
SET enable_sort = OFF;

EXPLAIN ANALYZE
SELECT * FROM person_discounts 
ORDER BY person_id, pizzeria_id 
LIMIT 5;

SET enable_seqscan = ON;
SET enable_sort = ON;