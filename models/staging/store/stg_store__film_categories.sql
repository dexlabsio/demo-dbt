with source as (
      select * from {{ source('public', 'film_category') }}
),
renamed as (
    select
        film_id,
        category_id,
        last_update as update_at,
        last_update::date as update_date

    from source
)
select * from renamed
  