SELECT * FROM (SELECT person_id ,SUM(visit_end_date - (visit_start_date + 1))  FROM visit_occurrence GROUP BY person_id) AS "all_visit" 
WHERE SUM = (SELECT max(SUM) AS "max_visit" FROM (SELECT person_id ,SUM(visit_end_date - (visit_start_date + 1))  FROM visit_occurrence GROUP BY person_id) AS "all_visit")

