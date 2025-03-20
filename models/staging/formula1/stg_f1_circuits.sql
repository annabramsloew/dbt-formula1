with 

source as (

    select * from {{ source('formula1', 'circuits') }}

),

renamed as (

    select
        circuitid as circuit_id,
        circuitref as circuit_short_name,
        name as circuit_name,
        location as city,
        country,
        lat as latitude,
        lng as longitude,
        alt as altitude

    from source

)

select * from renamed