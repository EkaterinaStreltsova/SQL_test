-- Г) топ-3 товаров по выручке и их доля в общей выручке за любой год

SELECT
	itemId,
    SUM(price) AS sum_of_item,
    MAX(total_revenue_by_year) AS total_revenue_by_year,
    ROUND(SUM(price)::decimal / MAX(total_revenue_by_year) * 100, 2) AS percentage_of_item
FROM
(
    SELECT
        dq.itemId AS itemId,
        dq.date AS date,
        dq.price AS price,
        SUM(dq.price) OVER w AS total_revenue_by_year
    FROM
        (
            SELECT 
                l.itemId AS itemId,
                l.date AS date,
                r.price AS price
            FROM Purchases AS l
            LEFT JOIN Users AS u ON u.userId = l.userId
            LEFT JOIN Items AS r ON r.itemId = l.itemId
        ) AS dq
    WINDOW w AS (PARTITION BY DATE_TRUNC('year', dq.date))
) AS ls
GROUP BY itemId, DATE_TRUNC('year', ls.date)
ORDER BY sum_of_item DESC
LIMIT 3
