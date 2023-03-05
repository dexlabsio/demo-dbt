 -- depends_on: {{ ref('dbt_metrics_default_calendar') }}
select * 
from {{
    metrics.calculate(
        metric('rentals'),
        grain='day'
    )
}}