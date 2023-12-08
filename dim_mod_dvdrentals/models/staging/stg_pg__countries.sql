select *
from {{ source('dvdrental', 'country') }}