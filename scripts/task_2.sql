WITH temp_vacancy (title, salary, description, area_id, employer_id, rec_create_dttm, id) AS (
	SELECT 
		md5(RANDOM()::TEXT) AS title,
		ROUND((RANDOM() * 100000)::INT) AS salary,
		md5(RANDOM()::TEXT) AS description,
		(RANDOM() * 30)::INT AS area_id,
		(RANDOM() * 100)::INT AS employer_id,
		timestamp '2021-01-01' + RANDOM() * INTERVAL '12 months' AS rec_create_dttm,
		generate_series(1, 10000) AS id
)
INSERT INTO vacancy (title, compensation_from, compensation_to, description, area_id, employer_id, rec_create_dttm, rec_update_dttm)
SELECT 
	title,
	salary as compensation_from, 
	salary + ROUND((RANDOM() * 100000)::INT, 3) as compensation_to,
	description,
	area_id,
	employer_id,
	rec_create_dttm,
	rec_create_dttm + RANDOM() * INTERVAL '10 days' AS rec_update_dttm
FROM temp_vacancy;   


WITH temp_resume (title, compensation, description, area_id, employee_id, rec_create_dttm, id) AS (
	SELECT 
		md5(RANDOM()::TEXT) AS title,
		ROUND((RANDOM() * 100000)::INT) AS compensation,
		md5(RANDOM()::TEXT) AS description,
		(RANDOM() * 30)::INT AS area_id,
		(RANDOM() * 1000)::INT AS employee_id,
		timestamp '2021-01-01' + RANDOM() * INTERVAL '12 months' AS rec_create_dttm,
		generate_series(1, 100000) AS id
)
INSERT INTO resume (title, compensation, description, area_id, employee_id, rec_create_dttm, rec_update_dttm)
SELECT 
	title,
	compensation, 
	description,
	area_id,
	employee_id,
	rec_create_dttm,
	rec_create_dttm + RANDOM() * INTERVAL '10 days' AS rec_update_dttm
FROM temp_resume;  


WITH temp_respond (vacancy_id, resume_id, rec_create_dttm, id) AS (
	SELECT 
		(RANDOM() * 9999)::INT + 1 AS vacancy_id,
		(RANDOM() * 99999)::INT + 1 AS resume_id,
		timestamp '2021-01-01' + RANDOM() * INTERVAL '12 months' AS rec_create_dttm,
		generate_series(1, 200000) AS id
)
INSERT INTO respond (vacancy_id, resume_id, rec_create_dttm, rec_update_dttm)
SELECT 
	vacancy_id,
	resume_id,
	rec_create_dttm,
	rec_create_dttm + RANDOM() * INTERVAL '10 days' AS rec_update_dttm
FROM temp_respond 
ON CONFLICT DO NOTHING; 
