WITH all_dates AS (SELECT generate_series('2022-01-01'::date, '2022-01-10'::date, interval '1 day')::date AS missing_date
)
SELECT all_dates.missing_date
FROM all_dates
FULL JOIN person_visits
    ON person_visits.visit_date = all_dates.missing_date
    AND (person_visits.person_id = 1 OR person_visits.person_id = 2)
WHERE person_visits.visit_date IS NULL
ORDER BY all_dates.missing_date;