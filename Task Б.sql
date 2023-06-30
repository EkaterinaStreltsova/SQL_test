-- Б) в каком месяце года выручка от пользователей в возрастном диапазоне 35+ самая большая

SELECT 
        SUM(price) AS Total_Sum,
        DATE_TRUNC('month', l.date) AS Months
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
    WHERE age_range = 'more than 35'
    GROUP BY DATE_TRUNC('month', l.date)
ORDER BY total_sum DESC
LIMIT 1

