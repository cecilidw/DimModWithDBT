select *
from {{ source('dvdrental', 'inventory') }}