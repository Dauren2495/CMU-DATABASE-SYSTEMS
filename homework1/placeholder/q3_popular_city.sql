with total(cnt) as 
(SELECT COUNT(*) as cnt
FROM station as s, trip as t
WHERE s.station_name = t.start_station_name or s.station_name = t.end_station_name)

SELECT r.city, ROUND(CAST(r.cnt as FLOAT)/total.cnt, 4) as ratio
FROM 
(SELECT s.city as city, COUNT(*) as cnt
FROM station as s, trip as t
WHERE s.station_name = t.start_station_name or s.station_name = t.end_station_name
GROUP BY city) as r, total
ORDER BY ratio DESC, r.city  ASC

