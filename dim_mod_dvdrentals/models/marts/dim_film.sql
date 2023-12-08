with cats as (
    select 
        fc.film_id as film_id, 
        c.name as category 
    from dvdrental.main.stg_pg__film_categories as fc
    left join dvdrental.main.stg_pg__categories as c on fc.category_id = c.category_id
    )

select 
    {{ dbt_utils.generate_surrogate_key(['f.film_id'])}} as film_key,
    f.film_id,
    f.title as film_title, 
    l.name as language_name, 
    c.category
from dvdrental.main.stg_pg__films as f
    left join cats as c on c.film_id = f.film_id 
        left join dvdrental.main.stg_pg__languages as l on l.language_id = f.language_id 