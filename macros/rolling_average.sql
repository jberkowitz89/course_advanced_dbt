{% macro rolling_average(column_name, partition_by, order_by, n_periods) %}
    avg( {{ column_name }} ) OVER (
                PARTITION BY {{ partition_by }}
                ORDER BY {{ order_by }}
                ROWS BETWEEN {{ n_periods - 1}} PRECEDING AND CURRENT ROW
            ) AS avg_{{ n_periods }}_periods_{{ column_name }}
{% endmacro %}
