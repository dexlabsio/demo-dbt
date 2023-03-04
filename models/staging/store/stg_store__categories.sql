with source as (
      select * from {{ source('public', 'category') }}
),
renamed as (
    select
        category_id,
        name,
        last_update as update_at,
        last_update::date as update_date

    from source
)
select * from renamed
  