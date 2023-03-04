select 
    customer.customer_id,
    customer.customer_store_id,
    customer.customer_name,
    customer.email,
    customer.customer_is_active,
    customer.created_at,
    customer.update_at,
    address.address_number,
    address.address,
    address.phone,
    city.city,
    country.country

from {{ ref('stg_store__customers') }} as customer
left join {{ ref('stg_store__address') }} as address
    on address.address_id = customer.address_id
left join {{ ref('stg_store__cities') }} as city
    on address.city_id = city.city_id
left join {{ ref('stg_store__countries') }} as country
    on country.country_id = city.country_id