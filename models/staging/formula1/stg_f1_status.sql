with 

source as (

    select * from {{ source('formula1', 'status') }}

),

renamed as (

    select
        statusid as status_id,
        status as status_description

    from source

)

select * from renamed