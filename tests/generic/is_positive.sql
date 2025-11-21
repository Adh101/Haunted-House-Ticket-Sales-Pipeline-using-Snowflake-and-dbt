{% test is_positive(model, column_name) %}
    with validation as (
      select {{ column_name }} as val
      from {{ model }}
    )
    select *
    from validation
    where val <= 0
{% endtest %}