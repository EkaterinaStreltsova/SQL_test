--А) какую сумму в среднем в месяц тратит:
-- - пользователи в возрастном диапазоне от 18 до 25 лет включительно

SELECT
	ROUND(AVG(avg_order_sum_by_client), 2) AS Avg_sum_in_18_25
FROM 
(SELECT 
	(SUM(price)/COunt(DISTINCT u.userId)) AS avg_order_sum_by_client,
    DATE_TRUNC('month', l.date)
    
FROM 
	Purchases AS l
LEFT JOIN
	(SELECT 
	userId,
    age,
	CASE
    	WHEN age >= 18 AND age <= 25 THEN '18-25'
        WHEN age >= 26 AND age <= 35 THEN '26-35'
        WHEN age > 35 THEN 'more than 35'
        ELSE 'Not applicable'
    END AS age_range
FROM Users) AS u ON u.userId = l.userId
LEFT JOIN
	Items AS r ON r.itemId = l.itemId
WHERE age_range = '18-25'
GROUP BY DATE_TRUNC('month', l.date)) AS new_table


-- - пользователи в возрастном диапазоне от 26 до 35 лет включительно

SELECT
	ROUND(AVG(avg_order_sum_by_client), 2) AS Avg_sum_in_26_35
FROM 
(SELECT 
	(SUM(price)/COunt(DISTINCT u.userId)) AS avg_order_sum_by_client,
    DATE_TRUNC('month', l.date)
    
FROM 
	Purchases AS l
LEFT JOIN
	(SELECT 
	userId,
    age,
	CASE
    	WHEN age >= 18 AND age <= 25 THEN '18-25'
        WHEN age >= 26 AND age <= 35 THEN '26-35'
        WHEN age > 35 THEN 'more than 35'
        ELSE 'Not applicable'
    END AS age_range
FROM Users) AS u ON u.userId = l.userId
LEFT JOIN
	Items AS r ON r.itemId = l.itemId
WHERE age_range = '26-35'
GROUP BY DATE_TRUNC('month', l.date)) AS new1_table


