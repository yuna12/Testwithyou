SELECT person_id, drug_concept_id, SUM(drug_date) AS drug_date, MIN(drug_exposure_start_date) AS  drug_start_date, MIN(drug_exposure_end_date) AS drug_end_date
FROM 
(SELECT person_id, drug_concept_id, drug_exposure_start_date, drug_exposure_end_date,(drug_exposure_end_date - drug_exposure_start_date)AS drug_date  
FROM drug_exposure 
WHERE person_id = '1891866') AS foo
GROUP BY drug_concept_id,person_id
ORDER BY drug_date DESC;
