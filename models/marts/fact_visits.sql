with stg_haunted_house_tickets as (

    select
        ticket_id,
        customer_id,
        haunted_house_id,
        purchase_date,
        visit_date,
        ticket_type,
        ticket_price

    from {{ ref('stg_haunted_house_tickets') }}

),
stg_customer_feedbacks as(
    select
        feedback_id,
        ticket_id,
        rating, 
        comments
    from {{ ref('stg_customer_feedbacks') }}
),
visits as(
    select
        sht.ticket_id as ticket_id,
        sht.customer_id as customer_id,
        sht.haunted_house_id as haunted_house_id,
        sht.purchase_date as purchase_date,
        sht.visit_date as visit_date,
        sht.ticket_type as ticket_type,
        sht.ticket_price as ticket_price,
        scf.rating as rating,
        scf.comments as comments
    from stg_haunted_house_tickets as sht
    left join stg_customer_feedbacks as scf
        on sht.ticket_id = scf.ticket_id  
)
select * from visits