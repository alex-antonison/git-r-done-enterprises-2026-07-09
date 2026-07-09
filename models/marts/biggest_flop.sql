SELECT
    title,
    mpaa_rating,
    major_genres,
    worldwide_gross,
    production_budget,
    (worldwide_gross * 1.0)/production_budget as profit_ratio
FROM {{ ref('stg_movies') }}
WHERE production_budget > 100000000