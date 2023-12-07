select *
from {{ source('dvdrental', 'film_actor') }}