WITH customer_country AS (
	SELECT cus.customer_id, cou.country
	FROM customer cus 
	JOIN address a ON cus.address_id = a.address_id
	JOIN city ci ON a.city_id = ci.city_id
	JOIN country cou ON ci.country_id = cou.country_id
	WHERE cou.country = 'India' OR cou.country =  'China' OR cou.country = 'United States'
)

SELECT SUM(p.amount) revenue_per_day,  DATE(p.payment_date), cc.country
FROM payment p
JOIN customer_country cc ON p.customer_id = cc.customer_id
GROUP BY DATE(p.payment_date), cc.country
ORDER BY DATE(p.payment_date);

