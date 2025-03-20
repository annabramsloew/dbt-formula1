with 

final as (
    select 
        * 
    from {{ ref('stg_f1_drivers') }}
)

select * from final