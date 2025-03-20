with 

source as (

    select * from {{ source('formula1', 'drivers') }}

),

renamed as (

    select
        driverid as driver_id,
        driverref as driver_ref_name,
        number as driver_number,
        code as driver_code,
        forename,
        surname,
        dob,
        nationality as driver_nationality,

    from source

)

select * from renamed