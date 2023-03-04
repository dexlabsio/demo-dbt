with source as (
      select * from {{ source('public', 'film_actor') }}
),
renamed as (
    select
        actor_id,
        film_id,
        last_update as update_at,
        last_update::date as update_date

    from source
)
select * from renamed
  