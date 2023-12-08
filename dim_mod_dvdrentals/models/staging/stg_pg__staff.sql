select *
from {{ source('dvdrental', 'staff') }}