with source as (
      select * from {{ source('public', 'city') }}
),
renamed as (
    select
        city_id,
        city,
        country_id,
        last_update as update_at,
        last_update::date as update_date

    from source
)
select * from renamed
  