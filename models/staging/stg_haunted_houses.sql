with staging as (

    select *
    from {{ source('bootcamp', 'raw_haunted_houses') }}

)
select * from staging