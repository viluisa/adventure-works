with

source as (
    select * from {{ source('erp', 'sales_store')}}
)

, renamed as (
        select
            cast(businessentityid as int) as store_pk
            , cast(name as string) as store_name
        from source
    )

select *
from renamed