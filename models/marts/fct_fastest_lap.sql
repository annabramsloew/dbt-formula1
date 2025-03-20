with 

--------------------- Input ---------------------

laptimes as ( select * from {{ ref('stg_f1_laptimes') }} ),

drivers as ( select * from {{ ref('stg_f1_drivers') }} ),

races as ( select * from {{ ref('stg_f1_races') }} ),

--------------------- CTEs ---------------------
fastest_lap_times as (
    select 
        race_id, 
        min(lap_time_millisec) as fastest_lap_time
    from laptimes
    group by race_id
),

fastest_laps as (
    select 
        lt.race_id,
        lt.driver_id,
        lt.lap,
        lt.final_rank,
        lt.lap_time_millisec as lap_time
    from laptimes lt
    join fastest_lap_times flt 
        on lt.race_id = flt.race_id 
        and lt.lap_time_millisec = flt.fastest_lap_time
),

fastest_laps_addinfo as (
    -- add driver and grandprix info
    select
        fl.race_id,
        races.race_date,
        races.grandprix_name,
        fl.driver_id,
        drivers.driver_code,
        fl.lap,
        fl.final_rank,
        fl.lap_time
    from fastest_laps fl
    left join races on fl.race_id = races.race_id
    left join drivers on fl.driver_id = drivers.driver_id

)


--------------------- dim table ---------------------

select * from fastest_laps_addinfo