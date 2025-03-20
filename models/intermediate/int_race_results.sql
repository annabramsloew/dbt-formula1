with 

--------------------- Input ---------------------

results as ( select * from {{ ref('stg_f1_results') }} ),

status as ( select * from {{ ref('stg_f1_status') }} ),

races as ( select * from {{ ref('stg_f1_races') }} ),

--------------------- CTEs ---------------------

result_status as (
    select
        results.result_id,
        results.race_id,
        results.driver_id,
        results.constructor_id,
        results.starting_grid_pos,
        results.final_position,
        results.final_rank,
        results.points,
        results.laps,
        {{milliseconds_to_minutes('race_time_millisec')}} as race_time,
        results.fastestlap_no,
        results.fastestlap_time,
        results.fastestlap_speed,
        results.status_id,
        status.status_description,
        races.grandprix_name,
        races.race_date
    from
    results
    left join status on results.status_id = status.status_id
    left join races on results.race_id = races.race_id
),

--------------------- dim table ---------------------

final as (
    select
        *
    from result_status
    
)

select * from final