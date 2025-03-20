with 

final as (
    select 
        * 
    from {{ ref('int_race_results') }}
)

select * from final