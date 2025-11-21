with staging as (

    select *
    from {{ source('bootcamp', 'raw_haunted_house_tickets') }}

)
select *
from staging
where row_num = 1