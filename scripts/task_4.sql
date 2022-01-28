WITH vacancy_temp("month") AS (
	SELECT
		EXTRACT(MONTH FROM rec_create_dttm) AS "month",
		COUNT(vacancy_id) AS vacancy_count
	FROM vacancy
	GROUP BY "month"
	ORDER BY vacancy_count DESC
 	LIMIT 1
),
resume_temp("month") AS (
	SELECT 
		EXTRACT(MONTH FROM rec_create_dttm) AS "month",
		COUNT(resume_id) AS resume_count
	FROM resume
	GROUP BY "month"
	ORDER BY resume_count DESC
	LIMIT 1
)
SELECT vacancy_temp."month" AS vacancy_month,
 	resume_temp."month" AS resume_month
	FROM vacancy_temp, resume_temp;