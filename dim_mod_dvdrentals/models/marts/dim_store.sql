select 
    {{ dbt_utils.generate_surrogate_key(['so.store_id'])}} as store_key,
    so.store_id,
    so.manager_staff_id,
    concat(sa.first_name, ' ', sa.last_name) as manager_full_name,
    sa.email as manager_email,
    sa.address_id as manager_address_id,
    so.address_id as store_address_id,
    a.address as store_address,
    a.address2 as store_address_2,
    a.district as store_district,
    a.city_id as store_city_id,
    ci.city as store_city,
    co.country as store_country,
    a.postal_code as store_postal_code,
    a.phone as store_phone
from dvdrental.main.stg_pg__stores as so
    left join dvdrental.main.stg_pg__staff as sa on so.manager_staff_id = sa.staff_id 
        left join dvdrental.main.stg_pg__addresses as a on so.address_id = a.address_id
            left join dvdrental.main.stg_pg__cities as ci on a.city_id = ci.city_id 
                left join dvdrental.main.stg_pg__countries as co on ci.country_id = co.country_id 