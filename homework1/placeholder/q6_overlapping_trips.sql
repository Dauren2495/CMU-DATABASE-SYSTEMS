with rides(id, bike_id, stime, etime) as
(SELECT id, bike_id, start_time, end_time
FROM trip
WHERE bike_id between 100 and 200)

SELECT f.bike_id, f.id, f.stime, f.etime, l.id, l.stime, l.etime
FROM rides as f, rides as l
WHERE f.bike_id = l.bike_id and f.id < l.id and
	  ((f.stime >= l.stime and f.stime < l.etime) or
	  (f.etime > l.stime and f.etime <= l.etime))
ORDER BY f.bike_id, f.id, l.id