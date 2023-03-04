{% macro cents_to_dollars(column_name, precision) %}
    ({{ column_name }} * 1)::numeric(16, {{ precision }})
{% endmacro %}