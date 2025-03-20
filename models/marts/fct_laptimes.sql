with 

final as (
    select 
        * 
    from {{ ref('stg_f1_laptimes') }}
)

select * from final