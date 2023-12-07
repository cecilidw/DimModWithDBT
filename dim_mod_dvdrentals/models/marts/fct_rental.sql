with pays as (
    select
        p.rental_id,
        sum(p.amount) as amount
    from dvdrental.main.stg_pg__payments as p
    group by p.rental_id
)

select
    r.rental_id,
    r.rental_date,
    r.return_date,
    r.customer_id,
    r.staff_id,
    r.inventory_id,
    i.film_id,
    i.store_id,
    p.amount as payment_amount
from dvdrental.main.stg_pg__rentals as r 
    left join pays as p on p.rental_id = r.rental_id
        left join dvdrental.main.stg_pg__inventories as i on i.inventory_id = r.inventory_id