SELECT 
	area_id,
	ROUND(AVG(compensation_from), 2) as average_compensation_from,
	ROUND(AVG(compensation_to), 2) as average_compensation_to,
	ROUND(AVG(compensation_from + compensation_to) / 2, 2) AS average_from_and_to
FROM vacancy
GROUP BY area_id
ORDER BY average_from_and_to DESC;