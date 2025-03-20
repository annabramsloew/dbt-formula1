with 

final as (
    select 
        * 
    from {{ ref('stg_f1_constructors') }}
)

select * from final