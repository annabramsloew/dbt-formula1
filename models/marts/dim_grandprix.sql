with 

--------------------- Input ---------------------

races as ( select * from {{ ref('stg_f1_races') }} ),

circuits as ( select * from {{ ref('stg_f1_circuits') }} ),

--------------------- CTEs ---------------------
grandprix as (
    select 
        circuit_id,
        grandprix_name,
        min(race_year) as first_race_year,
        max(race_year) as last_race_year
    from races
    group by circuit_id, grandprix_name
),

location as (
    select 
        circuit_id,
        circuit_name,
        city,
        country
    from circuits

), 

--------------------- dim table ---------------------

final as (
    select
    grandprix.circuit_id,
    grandprix.grandprix_name,
    grandprix.first_race_year,
    grandprix.last_race_year,
    location.circuit_name,
    location.city,
    location.country
    from grandprix
    left join location on grandprix.circuit_id = location.circuit_id
    
)

select * from final