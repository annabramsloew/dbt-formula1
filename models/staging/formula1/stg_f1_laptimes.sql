with 

source as (

    select * from {{ source('formula1', 'lap_times') }}

),

renamed as (

    select
        raceid as race_id,
        driverid as driver_id,
        lap,
        position as final_rank,
        time as lap_time,
        milliseconds as lap_time_millisec

    from source

)

select * from renamed