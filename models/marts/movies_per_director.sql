select 
    director,
    count(title) as number_of_movies
from {{ ref ('stg_movies')  }}
group by all