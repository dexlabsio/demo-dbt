 -- depends_on: {{ ref('dbt_metrics_default_calendar') }}
select * 
from {{
    metrics.calculate(
        metric('revenue'),
        grain='day'
    )
}}