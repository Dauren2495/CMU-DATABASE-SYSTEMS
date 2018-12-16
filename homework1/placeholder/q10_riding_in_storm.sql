with temp(zip_code, station_name, d) as
	(SELECT s.zip_code, s.station_name, w.date
	FROM station as s
	INNER JOIN weather as w
	ON s.zip_code = w.zip_code
	WHERE w.events = 'Rain-Thunderstorm'),
	temp1(zip_code, station_name, cnt) as
	(SELECT s.zip_code, s.station_name, COUNT(*)
	FROM trip as t
	INNER JOIN temp as s
	ON date(t.start_time) = s.d and
	   t.start_station_name = s.station_name
	GROUP BY s.zip_code, s.station_name)

SELECT s.zip_code, s.station_name, MAX(s.cnt)
FROM temp1 as s
GROUP BY s.zip_code
ORDER BY s.zip_code ASC