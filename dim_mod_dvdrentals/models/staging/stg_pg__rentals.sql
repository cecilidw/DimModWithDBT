select *
from {{ source('dvdrental', 'rental') }}