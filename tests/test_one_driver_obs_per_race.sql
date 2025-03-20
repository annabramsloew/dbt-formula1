--{{ config(store_failures=true)}}
{{ config(severity="error")}}

with
--------------------- Input ---------------------

race_results as (
    -- only completed races, ie with status 'Finished'
    select 
        * 
    from {{ ref('fct_race_results') }} 
    where status_description = 'Finished'
),

--------------------- CTEs ---------------------

obs_per_race_per_driver as (
    select 
        race_id,
        driver_id,
        count(driver_id) as rows_per_driver
    from race_results
    group by race_id, driver_id
)

--------------------- final ---------------------

select * from obs_per_race_per_driver
where rows_per_driver > 1