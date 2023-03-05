select 
    store_id,
    staff_manager_name,
    address_number,
    address,
    district,
    postal_code,
    phone,
    city,
    country
    
from {{ ref('int_dim__store') }} as store