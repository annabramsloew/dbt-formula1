with 

final as (
    select 
        * 
    from {{ ref('stg_formula1__drivers') }}
)

select * from final