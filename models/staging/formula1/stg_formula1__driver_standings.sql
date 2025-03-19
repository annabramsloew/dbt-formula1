with 

source as (

    select * from {{ source('formula1', 'driver_standings') }}

),

renamed as (

    select
        driverstandingsid,
        raceid,
        driverid,
        points,
        position,
        positiontext,
        wins

    from source

)

select * from renamed
