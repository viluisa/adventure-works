with
    int_customers as (
        select *
        from {{ ref("int_customers__enriched")}}
    )
select *
from int_customers