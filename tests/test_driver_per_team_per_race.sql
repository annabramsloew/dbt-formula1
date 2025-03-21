--{{ config(store_failures=true)}}
{{ config(severity="error")}}

with
--------------------- Input ---------------------

race_results as (
    -- only in hybrid era, ie 2014+
    select 
        * 
    from {{ ref('fct_race_results') }} 
    where race_date > '2013-12-31'
),

--------------------- CTEs ---------------------

drivers_per_team_per_race as (
    select 
        race_id,
        constructor_id,
        count(distinct driver_id) as no_drivers
    from race_results
    group by race_id, constructor_id
)

--------------------- final ---------------------

select * from drivers_per_team_per_race
where no_drivers > 2