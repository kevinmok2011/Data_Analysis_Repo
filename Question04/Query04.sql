SELECT CONCAT(a.first_name, ' ', a.last_name) AS full_name, SUM(p.amount) as total_revenue , RANK() OVER (ORDER BY SUM(p.amount) DESC) AS rank
FROM actor a 
JOIN film_actor fa ON a.actor_id = fa.actor_id
JOIN inventory i on fa.film_id = i.film_id
JOIN rental r on i.inventory_id = r.inventory_id
JOIN payment p on r.rental_id = p.rental_id
GROUP BY a.actor_id
LIMIT 10;

