SELECT DISTINCT concept_name 
FROM 
(SELECT UPPER(concept_name) AS concept_name 
FROM condition_occurrence AS co
INNER JOIN concept AS cpt
ON co.condition_concept_id = cpt.concept_id) AS foo 
WHERE SUBSTR(concept_name, 1,1) IN ('A','B','C','D','E') AND concept_name LIKE '%HEART%';
