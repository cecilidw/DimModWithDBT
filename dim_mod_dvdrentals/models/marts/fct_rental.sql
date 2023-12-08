with pays as (
    select
        p.rental_id,
        sum(p.amount) as amount
    from dvdrental.main.stg_pg__payments as p
    group by p.rental_id
)

select
    {{ dbt_utils.generate_surrogate_key(['r.rental_id'])}} as rental_key,
    r.rental_id,
    r.rental_date,
    r.return_date,
    {{ dbt_utils.generate_surrogate_key(['r.customer_id'])}} as customer_key,
    {{ dbt_utils.generate_surrogate_key(['i.film_id'])}} as film_key,
    {{ dbt_utils.generate_surrogate_key(['i.store_id'])}} as store_key,
    r.customer_id,
    r.staff_id,
    r.inventory_id,
    i.film_id,
    i.store_id,
    p.amount as payment_amount
from dvdrental.main.stg_pg__rentals as r 
    left join pays as p on p.rental_id = r.rental_id
        left join dvdrental.main.stg_pg__inventories as i on i.inventory_id = r.inventory_id