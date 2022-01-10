SELECT COUNT(*)
FROM 
	(SELECT * FROM condition_occurrence WHERE condition_concept_id IN (3191208,36684827,3194332,3193274,43531010,4130162,45766052,45757474,4099651,4129519,4063043,4230254,4193704,4304377,201826,3194082,3192767)) AS a
INNER JOIN 
	(SELECT person_id, extract(year from CURRENT_DATE) - year_of_birth AS person_age FROM person) AS b
ON (a.person_id = b.person_id) AND (person_age >= 18)
INNER JOIN
	(SELECT distinct person_id, drug_concept_id 
	FROM 
		(SELECT person_id, drug_concept_id, (drug_exposure_end_date-drug_exposure_start_date) AS drug_date
		FROM drug_exposure
		WHERE drug_concept_id = 40163924) AS foo 
	WHERE drug_date >= 90) AS c
ON (a.person_id = c.person_id)
