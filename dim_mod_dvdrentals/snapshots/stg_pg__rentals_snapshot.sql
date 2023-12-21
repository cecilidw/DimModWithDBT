{% snapshot stg_pg__rentals_snapshot %}

{{ config(
    target_database='dvdrental',
    target_schema='snapshots',
    unique_key='rental_id',
    strategy='timestamp',
    updated_at='last_update'

)}}

select * from {{ ref('stg_pg__rentals')}}

{% endsnapshot %}