with actors as (
    select 
        film_id,
        string_agg(actor_complete_name, ', ' order by actor_complete_name) as actors_complete_names
    from {{ ref('stg_store__film_actors') }} as film_actor
    left join {{ ref('stg_store__actors') }} as actor
        on actor.actor_id = film_actor.actor_id
    group by film_id
)

select 
    film.film_id,
    film.title,
    film.description,
    film.release_year,
    language.name as language,
    category.name as category,
    actors.actors_complete_names,
    film.rental_duration,
    film.rental_rate,
    film.length,
    film.replacement_cost,
    film.rating,
    film.update_at,
    film.special_features

from {{ ref('stg_store__films') }} as film
left join {{ ref('stg_store__language') }} as language
    on language.language_id = film.language_id
left join {{ ref('stg_store__film_categories') }} as film_category
    on film_category.film_id = film.film_id
left join {{ ref('stg_store__categories') }} as category
    on category.category_id = film_category.category_id
left join actors
    on actors.film_id = film.film_id
