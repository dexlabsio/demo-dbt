with inventory as (
    select
        film_id,
        count(film_id) as number_of_films
    from {{ ref('stg_store__inventory') }}
    group by film_id

)

select 
    film.film_id,
    film.title,
    film.description,
    film.release_year,
    film.language,
    film.category,
    film.actors_complete_names,
    film.rental_duration,
    film.rental_rate,
    film.length,
    film.replacement_cost,
    inventory.number_of_films as films_on_inventory,
    film.rating,
    film.update_at,
    film.special_features
    
from {{ ref('int_dim_films') }} as film
left join inventory
    on inventory.film_id = film.film_id
order by film_id desc