with stg_movies as (
    
    select * 
    from {{ ref('stg_movies') }}

),

director_metrics as (

    select 
        director,
        sum(us_gross) as gross_sum,
        sum(production_budget) as budget_sum,
        count(distinct title) as movie_count
    from stg_movies
    group by 1

),

final as (

    select 
        director,
        round(gross_sum / nullif(budget_sum, 0), 2) as roi,
        gross_sum,
        budget_sum,
        movie_count,
        rank() over (order by (gross_sum / nullif(budget_sum, 0)) desc) as roi_rank
    from director_metrics

)

select * 
from final