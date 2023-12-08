select *
from {{ source('dvdrental', 'category') }}