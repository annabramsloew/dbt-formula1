{% macro milliseconds_to_minutes(column_name, scale=2) %}
    ({{ column_name }} / (1000 * 60))::numeric(16, {{ scale }})
{% endmacro %}