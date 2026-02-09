SELECT generate_series.missing_date::date
FROM generate_series('2022-01-01', '2022-01-10', interval '1 day') AS generate_series(missing_date)
LEFT JOIN person_visits 
    ON person_visits.visit_date = generate_series.missing_date::date
    AND (person_visits.person_id = 1 OR person_visits.person_id = 2)
WHERE person_visits.visit_date IS NULL
ORDER BY generate_series.missing_date;