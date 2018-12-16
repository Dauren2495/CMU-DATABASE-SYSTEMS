SELECT city, count(*) as cnt 
FROM station 
GROUP BY city
ORDER BY cnt ASC, city ASC