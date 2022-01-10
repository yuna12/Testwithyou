
SELECT *
FROM 
	(SELECT DISTINCT *
	FROM 
	(SELECT a.person_id, drug_concept_id,drug_exposure_start_date, (CASE drug_concept_id WHEN 19018935 THEN 'A' WHEN 19075601 THEN 'C' WHEN 1115171 THEN 'D' ELSE 'B' END) AS pattern
		FROM 
			(SELECT person_id,condition_concept_id 
			FROM condition_occurrence 
			WHERE condition_concept_id IN (3191208,36684827,3194332,3193274,43531010,4130162,45766052,45757474,4099651,4129519,4063043,4230254,4193704,4304377,201826,3194082,3192767)) AS a
		INNER JOIN 
			(SELECT person_id, drug_concept_id,drug_exposure_start_date
			FROM drug_exposure
			WHERE drug_concept_id IN (19018935,1539411,1539463,19075601,1115171)) AS b
		ON a.person_id = b.person_id	
		
		ORDER BY a.person_id, drug_exposure_start_date ASC) AS foo
	ORDER BY drug_exposure_start_date, pattern) AS foo
ORDER BY person_id,drug_exposure_start_date


 