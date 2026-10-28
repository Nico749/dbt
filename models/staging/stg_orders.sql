select
    raw_id,
    try_cast(order_id as bigint)           as order_id,
    try_cast(customer_id as bigint)        as customer_id,
    lower(trim(customer_email))            as customer_email,
    try_cast(order_date as date)           as order_date,
    lower(trim(status))                    as status,
    product_name,
    category,
    try_cast(quantity as int)              as quantity,
    try_cast(unit_price as decimal(10,2))  as unit_price,
    try_cast(total_amount as decimal(10,2)) as total_amount,
    payment_method,
    source_system,
    loaded_at
from {{ source('databricks_raw', 'raw_orders') }}