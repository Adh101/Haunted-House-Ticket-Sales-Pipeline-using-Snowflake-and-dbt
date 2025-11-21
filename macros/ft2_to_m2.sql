{% macro ft2_to_m2(column_name, scale=2) %}
    ({{ column_name }} / 10.764)::numeric(16, {{ scale }})
{% endmacro %}