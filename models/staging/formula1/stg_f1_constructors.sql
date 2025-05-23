with 

source as (

    select * from {{ source('formula1', 'constructors') }}

),

renamed as (

    select
        constructorid as constructor_id,
        constructorref as constructor_short_name,
        name as constructor_name,
        nationality as constructor_nationality

    from source

)

select * from renamed
