select 
    date_day::date,
    extract(day from date_day) as number_day,
    extract(month from date_day) as number_month,
    extract(year from date_day) as number_year,
    date_trunc('week', date_day)::date as week,
    date_trunc('month', date_day)::date as mth,
    date_trunc('year', date_day)::date as year
from {{ ref('int_dim_calendar') }}