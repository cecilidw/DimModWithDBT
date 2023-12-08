select *
from 
    {{ source('dvdrental', 'address') }}