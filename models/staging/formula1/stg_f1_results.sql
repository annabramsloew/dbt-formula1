with 

source as (

    select * from {{ source('formula1', 'results') }}

),

renamed as (

    select
        resultid as result_id,
        raceid as race_id,
        driverid as driver_id,
        constructorid as constructor_id,
        grid as starting_grid_pos,
        position as final_position,
        positionorder as final_rank,
        points,
        laps,
        milliseconds as race_time_millisec,
        fastestlap as fastestlap_no,
        fastestlaptime as fastestlap_time,
        fastestlapspeed as fastestlap_speed,
        statusid as status_id

    from source

)

select * from renamed