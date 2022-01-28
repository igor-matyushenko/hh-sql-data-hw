SELECT 
	vacancy.vacancy_id, 
	vacancy.title AS title
FROM vacancy 
INNER JOIN respond ON vacancy.vacancy_id = respond.vacancy_id
	WHERE EXTRACT(DAY FROM respond.rec_create_dttm - vacancy.rec_create_dttm) <= 7
GROUP BY vacancy.vacancy_id, vacancy.title
HAVING COUNT(respond.resume_id) > 5;