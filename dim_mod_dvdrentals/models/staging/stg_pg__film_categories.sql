select *
from {{ source('dvdrental', 'film_category') }}