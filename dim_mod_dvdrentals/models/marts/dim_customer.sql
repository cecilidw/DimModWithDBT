select 
    {{ dbt_utils.generate_surrogate_key(['customer_id'])}} as customer_key,
    c.customer_id,
    c.first_name,
    c.last_name,
    c.email,
    a.address_id,
    c.activebool,
    c.create_date,
    a.address,
    a.address2,
    a.district,
    a.postal_code,
    a.phone,
    co.country,
    ci.city
from 
    dvdrental.main.stg_pg__customers as c
        left join dvdrental.main.stg_pg__addresses as a on c.address_id = a.address_id
            left join dvdrental.main.stg_pg__cities as ci on a.city_id = ci.city_id
                left join dvdrental.main.stg_pg__countries as co on ci.country_id = co.country_id