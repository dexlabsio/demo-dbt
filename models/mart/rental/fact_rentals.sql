select 
    rental_id,
    rental_date,
    customer_id,
    return_date,
    time_to_return_days,
    rental_duration,
    return_status,
    staff_id,
    film_id,
    store_id,
    {{cents_to_dollars('rental_payment', 4)}} as rental_payment,
    update_at,
    update_date

from {{ ref('int_fact_rentals') }} as rental
where rental_payment is not null