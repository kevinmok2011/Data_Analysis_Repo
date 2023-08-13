WITH customer_country AS (
	SELECT cus.customer_id, cou.country
	FROM customer cus 
	JOIN address a ON cus.address_id = a.address_id
	JOIN city ci ON a.city_id = ci.city_id
	JOIN country cou ON ci.country_id = cou.country_id

)

SELECT SUM(p.amount) AS total_revenue, cc.country
FROM payment p
JOIN customer_country cc ON p.customer_id = cc.customer_id
GROUP BY cc.country;

