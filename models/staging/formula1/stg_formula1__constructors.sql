with 

source as (

    select * from {{ source('formula1', 'constructors') }}

),

renamed as (

    select
        constructorid,
        constructorref,
        name,
        nationality,
        url

    from source

)

select * from renamed
