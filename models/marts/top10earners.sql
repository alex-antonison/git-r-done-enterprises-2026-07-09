SELECT 
movie_id, 
title,
worldwide_gross
FROM {{ ref('stg_movies') }}
ORDER BY worldwide_gross DESC
LIMIT 10