with 

source as (

    select * from {{ source('formula1', 'drivers') }}

),

renamed as (

    select
        driverid,
        driverref,
        number,
        code,
        forename,
        surname,
        dob,
        nationality,
        url

    from source

)

select * from renamed
