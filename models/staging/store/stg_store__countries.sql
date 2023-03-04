with source as (
      select * from {{ source('public', 'country') }}
),
renamed as (
    select
        country_id,
        country,
        last_update as update_at,
        last_update::date as update_date

    from source
)
select * from renamed
  