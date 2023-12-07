select *
from {{ source('dvdrental', 'city') }}