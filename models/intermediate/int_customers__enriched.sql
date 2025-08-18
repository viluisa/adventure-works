with

customer as (
    select *
    from {{ ref('stg_erp__customer') }}
),

person as (
    select *
    from {{ ref('stg_erp__person') }}
),

store as (
    select *
    from {{ ref('stg_erp__store') }}
),

address as (
    select *
    from {{ ref('stg_erp__address') }}
),

state as (
    select * from {{ ref('stg_erp__state_province') }}
),
country as (
    select * from {{ ref('stg_erp__country_region') }}
),

joined as (
    select
        c.customer_pk
        , case 
            when c.person_fk is not null then 'individual'
            when c.store_fk is not null then 'company'
            else 'not informed'
        end as customer_type
        , coalesce(p.first_name || ' ' || p.last_name, s.store_name, 'not informed') as customer_name
        , a.address_name
        , a.city
        , sp.state_name
        , cr.country_name
    from customer c
    left join person p on c.person_fk = p.person_pk
    left join store s on c.store_fk = s.store_pk
    left join address a on c.customer_pk = a.address_pk  -- (aqui depende se a tabela de relacionamento está mapeada!)
    left join state sp on a.state_fk = sp.state_pk
    left join country cr on sp.country_fk = cr.country_pk
)

select *
from joined
