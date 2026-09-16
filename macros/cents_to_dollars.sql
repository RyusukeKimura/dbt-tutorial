{% macro cents_to_dollars(column_name, decimal_places=2) %}
    round( cast(({{ column_name }} / 100) as numeric), {{ decimal_places }} )
{% endmacro %}
