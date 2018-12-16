with short(dates, sh) as
	(SELECT date(t.start_time), 
	CASE
			WHEN strftime('%s',t.end_time) - strftime('%s',t.start_time) <= 60 THEN 'short'
			ELSE 'not short'
	END
	FROM trip as t),
 	temp(sh, mean) as
	(SELECT s.sh, ROUND(AVG(w.mean_temp), 4)
	FROM short as s
	INNER JOIN weather as w
	ON s.dates = w.date
	GROUP BY s.sh)

SELECT f.mean, l.mean
FROM temp as f, temp as l
WHERE f.sh = 'short' and l.sh = 'not short'  