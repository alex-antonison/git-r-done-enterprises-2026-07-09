SELECT
title,
production_budget, 
release_date,
major_genres,
director
from {{ ref('stg_movies') }}
order by production_budget desc