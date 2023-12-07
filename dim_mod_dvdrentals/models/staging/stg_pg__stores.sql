select *
from {{ source('dvdrental', 'store') }}