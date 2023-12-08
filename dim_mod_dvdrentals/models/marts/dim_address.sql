select
    {{ dbt_utils.generate_surrogate_key(['address_id'])}} as address_key,
    ad.address_id,
    ci.city_id,
    co.country_id,
    ad.address,
    ad.address2,
    ad.district,
    ad.postal_code,
    ad.phone,
    co.country,
    ci.city
from 
    {{ ref('stg_pg__addresses')}} as ad
    left join {{ ref('stg_pg__cities')}} as ci on ad.city_id = ci.city_id
    left join {{ ref('stg_pg__countries')}} as co on ci.country_id = co.country_id