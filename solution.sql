
-- 1.Get all pairs of actors that worked together.
select distinct f1.film_id, f1.actor_id as actor1, f2.actor_id as actor2
from film_actor f1
inner join film_actor f2
on f1.film_id = f2.film_id
where f1.actor_id <> f2.actor_id; 

-- 2. Get all pairs of customers that have rented the same film more than 3 times
select * from (
	select distinct film_id ,customer_id
	from rental r
	inner join inventory i
    on r.inventory_id = i.inventory_id
	group by customer_id, film_id
	having count(film_id) > 2
    ) sub1
cross join (
select distinct customer_id
	from rental r
	inner join inventory i
    on r.inventory_id = i.inventory_id
	group by customer_id, film_id
	having count(film_id) > 2
    ) sub2
where sub1.customer_id <> sub2.customer_id; 

-- 3.Get all possible pairs of actors and films
select * from (
	select distinct actor_id
    from film_actor
    ) sub1
cross join (
	select distinct film_id 
    from film_actor
    ) sub2
order by actor_id;

