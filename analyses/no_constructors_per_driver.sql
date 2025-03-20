with 

--------------------- Input ---------------------

results as (
    -- only in hybrid era, ie 2014+ 
    select 
        * 
    from {{ ref('fct_race_results') }}
    where race_date > '2013-12-31'
    ),

drivers as ( select * from {{ ref('dim_drivers') }}),

--------------------- CTEs ---------------------

constructor_count as (
    select
        driver_id,
        count(distinct constructor_id) as associated_constructors
    from results
    group by driver_id
),

driver_constructor_combo as (
    select
        drivers.driver_id,
        CONCAT(drivers.forename, ' ', drivers.surname) as driver_name,
        cc.associated_constructors
    from constructor_count cc
    join drivers on cc.driver_id = drivers.driver_id

)

--------------------- final ---------------------

-- find drivers with most team associations in hyrbid era
select 
    ROW_NUMBER() OVER (ORDER BY associated_constructors DESC) as row_id,
    *
from driver_constructor_combo
order by associated_constructors desc