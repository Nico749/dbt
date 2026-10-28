select
    order_date,
    category,
    count(*)          as orders,
    sum(quantity)     as units_sold,
    sum(total_amount) as revenue
from {{ ref('stg_orders') }}
where status not in ('cancelled', 'refunded')
group by order_date, category