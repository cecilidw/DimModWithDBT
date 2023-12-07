select *
from {{ source('dvdrental', 'customer') }}