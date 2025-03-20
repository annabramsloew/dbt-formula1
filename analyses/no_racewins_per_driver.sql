with 

--------------------- Input ---------------------

results as ( select * from {{ ref('fct_race_results') }}),

drivers as ( select * from {{ ref('dim_drivers') }}),

--------------------- CTEs ---------------------

winners as (
    select
        *
    from results
    where final_position = 1
),

race_wins as (
    select
        driver_id,
        count(final_position) as wins
    from winners
    group by driver_id
),

driver_wins as (
    select
        CONCAT(drivers.forename, ' ', drivers.surname) as driver_name,
        drivers.driver_code,
        rw.wins
    from race_wins rw
    join drivers on rw.driver_id = drivers.driver_id
)

--------------------- final ---------------------

-- find most race winning drivers
select 
    ROW_NUMBER() OVER (ORDER BY wins DESC) as row_id,
    *
from driver_wins
order by wins desc