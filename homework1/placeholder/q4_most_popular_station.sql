with station_cnt(city, name, cnt) as
(SELECT city, station_name, COUNT(*)
FROM station as s, trip as t
WHERE s.station_name = t.start_station_name or s.station_name = t.end_station_name
GROUP BY station_name)

SELECT city, name, MAX(cnt)
FROM station_cnt
GROUP BY city
ORDER BY city ASC