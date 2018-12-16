SELECT t.bike_id, COUNT(DISTINCT(s.city)) as cnt 
FROM station as s, trip as t 
WHERE s.station_name = t.start_station_name or s.station_name = t.end_station_name
GROUP BY t.bike_id
HAVING cnt > 1
ORDER BY cnt DESC, t.bike_id ASC