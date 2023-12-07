select *
from {{ source('dvdrental', 'payment') }}