with payments as (
    select 
        rental_id,
        sum(amount) as rental_payment
    from {{ ref('stg_store__payments') }} as payment
    group by rental_id
)
select 
    rental.rental_id,
    rental.rental_date::timestamp,
    rental.customer_id,
    rental.return_date::timestamp,
    date_part('day', return_date::timestamp - rental.rental_date::timestamp) as time_to_return_days,
    film.rental_duration,
    case 
        when rental_duration >= date_part('day', return_date::timestamp - rental.rental_date::timestamp) then 'Returned on Time'
        else 'Returned Late' 
    end as return_status,
    rental.staff_id,
    inventory.film_id,
    inventory.store_id,
    round(payment.rental_payment::numeric, 2) as rental_payment,
    rental.update_at::timestamp,
    rental.update_date::timestamp

from {{ ref('stg_store__rentals') }} as rental
left join {{ ref('stg_store__inventory') }} as inventory
    on rental.inventory_id = inventory.inventory_id
left join {{ ref('stg_store__films') }} as film
    on film.film_id = inventory.film_id
left join payments as payment
    on rental.rental_id = payment.rental_id