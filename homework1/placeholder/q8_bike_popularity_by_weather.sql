SELECT r.events, ROUND(AVG(r.cnt), 4) as avg
FROM 
(SELECT w.events, w.date, COUNT(*) as cnt
FROM trip as t 
INNER JOIN weather as w
ON date(t.start_time) = w.date
GROUP BY w.events, w.date) as r
GROUP BY r.events
ORDER BY avg DESC, r.events ASC
