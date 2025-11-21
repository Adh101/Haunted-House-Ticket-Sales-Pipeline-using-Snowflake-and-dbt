with staging as (
    select *
    from {{source('bootcamp', 'raw_customer_feedbacks')}}
)
select *
from staging