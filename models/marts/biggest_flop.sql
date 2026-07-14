with movies as (

    select * from {{ ref('stg_movies') }}

)

select
    title,
    imdb_rating,
    major_genres,
    worldwide_gross,
    production_budget,
    (worldwide_gross * 1.0) / production_budget as box_office_multiple
from movies
where production_budget > 100000000
and (worldwide_gross * 1.0) / production_budget < 1