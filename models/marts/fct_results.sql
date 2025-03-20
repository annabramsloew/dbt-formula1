with 

final as (
    select 
        * 
    from {{ ref('int_results') }}
)

select * from final