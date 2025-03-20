with 

source as (

    select * from {{ source('formula1', 'races') }}

),

renamed as (

    select
        raceid as race_id,
        year as race_year,
        round as race_number,
        circuitid as circuit_id,
        name as grandprix_name,
        date as race_date,
        time as race_starttime

    from source

)

select * from renamed