-- В) какой товар обеспечивает дает наибольший вклад в выручку за последний год

SELECT 
    SUM(price) AS Total_Sum,
	l.itemId as itemId,
    DATE_TRUNC('year', l.date) AS years
FROM Purchases AS l
LEFT JOIN
	Users AS u ON u.userId = l.userId
LEFT JOIN
    Items AS r ON r.itemId = l.itemId
GROUP BY DATE_TRUNC('year', l.date), l.itemId
ORDER BY years, total_sum DESC
Limit 1
