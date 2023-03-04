select 
    store.store_id,
    staff.complete_name as staff_manager_name,
    address.address_number,
    address.address,
    address.district,
    address.postal_code,
    address.phone,
    cities.city,
    countries.country
from {{ ref('stg_store__store') }} as store
left join {{ ref('stg_store__staff') }} as staff 
    on staff.staff_id = store.manager_staff_id
left join {{ ref('stg_store__address') }} as address 
    on address.address_id = store.address_id
left join {{ ref('stg_store__cities') }} as cities 
    on cities.city_id = address.city_id
left join {{ ref('stg_store__countries') }} as countries 
    on countries.country_id = cities.country_id