with customers as(
    select *
    from {{ ref('stg_customers')}}
),
valid_domains as(
    select *
    from {{ ref('valid_domains')}}
),
dim_customers as(
    select
        c.customer_id,
        c.age,
        c.gender,
        c.email,
        coalesce 
        (regexp_like(trim(c.email), '^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}$') = true 
        and position('.' in split_part(lower(trim(c.email)), '@', 2)) > 0 and vd.valid_domain is not null,false) as is_valid_email_address
    from customers as c
    left join valid_domains as vd
        on concat('@',split_part(lower(c.email), '@', 2)) = vd.valid_domain
)
select * from dim_customers
