with source as (
      select * from {{ source('public', 'film') }}
),
renamed as (
    select
        film_id,
        title,
        description,
        release_year,
        language_id,
        rental_duration,
        rental_rate,
        length,
        replacement_cost,
        rating,
        last_update as update_at,
        last_update::date as update_date,
        special_features,
        fulltext

    from source
)
select * from renamed
  