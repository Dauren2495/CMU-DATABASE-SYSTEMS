with all_dates(day) as 
	(SELECT DISTINCT(date(start_time))
	FROM trip
	WHERE bike_id <= 100
	UNION
	SELECT DISTINCT(date(end_time))
	FROM trip
	WHERE bike_id <= 100
	), temp(day, start, ends) as
	(SELECT s.day, t.start_time, t.end_time
	FROM all_dates as s, trip as t
	WHERE t.bike_id <= 100 and  
	(s.day between date(t.start_time) and date(t.end_time))
	), temp1(day, duration) as 
	(SELECT day, 
	CASE
		WHEN date(start) = date(ends) THEN strftime('%s', ends) - strftime('%s', start)
		WHEN date(start) = day THEN 60 * 60 * 24 - (strftime('%s', start) - strftime('%s', date(start)))
		WHEN date(ends) = day THEN strftime('%s', ends) - strftime('%s', date(ends))
		ELSE 60 * 60 * 24
	END
	FROM temp
	)

SELECT day, ROUND(AVG(duration), 4) as avg
FROM temp1
GROUP BY day
ORDER BY avg DESC
LIMIT 10

