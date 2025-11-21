with staging as (
    select *
    from {{source('bootcamp', 'raw_customers')}}
)
select *
from staging