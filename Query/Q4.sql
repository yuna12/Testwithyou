SELECT concept_name, cnt1
FROM 
(SELECT drug_concept_id, concept_name
FROM 
(SELECT DISTINCT drug_concept_id, concept_name, count(*) as cnt 
FROM drug_exposure
JOIN concept
ON drug_concept_id = concept_id
WHERE concept_id IN (
40213154,19078106,19009384,40224172,19127663,1511248,40169216,1539463,
19126352,1539411,1332419,40163924,19030765,19106768,19075601)
GROUP BY drug_concept_id,concept_name
ORDER BY COUNT(*) DESC) AS foo) AS f
/* drugs */

JOIN 

(SELECT drug_concept_id1,cnt1
FROM 
	(SELECT drug_concept_id1, cnt1, drug_concept_id2, cnt2
	FROM(
	SELECT a.drug_concept_id1, b.cnt AS cnt1,ROW_NUMBER() OVER(ORDER BY  drug_concept_id1) AS ROWNUM
	FROM drug_pair AS a

INNER JOIN 
	(SELECT drug_concept_id, cnt
	FROM 
		(SELECT DISTINCT drug_concept_id, concept_name, count(*) as cnt 
		FROM drug_exposure
		JOIN concept
		ON drug_concept_id = concept_id
		WHERE concept_id IN (40213154,19078106,19009384,40224172,19127663,1511248,40169216,1539463,19126352,1539411,1332419,40163924,19030765,19106768,19075601)
		GROUP BY drug_concept_id,concept_name
		ORDER BY COUNT(*) DESC) AS foo) AS b
ON a.drug_concept_id1 = b.drug_concept_id) AS c

LEFT OUTER JOIN 
	(SELECT a.drug_concept_id2, b.cnt AS cnt2,ROW_NUMBER() OVER(ORDER BY  drug_concept_id1) AS ROWNUM
	FROM drug_pair AS a
	
	INNER JOIN 
		(SELECT drug_concept_id, cnt
		FROM 
			(SELECT DISTINCT drug_concept_id, concept_name, count(*) as cnt 
			FROM drug_exposure
			JOIN concept
			ON drug_concept_id = concept_id
			WHERE concept_id IN (40213154,19078106,19009384,40224172,19127663,1511248,40169216,1539463,19126352,1539411,1332419,40163924,19030765,19106768,19075601)
			GROUP BY drug_concept_id,concept_name
			ORDER BY COUNT(*) DESC) AS foo) AS b
	ON a.drug_concept_id2 = b.drug_concept_id) AS d
ON c.rownum = d.rownum) AS e
WHERE cnt1 < cnt2)AS g
ON f.drug_concept_id = g.drug_concept_id1
order by cnt1;