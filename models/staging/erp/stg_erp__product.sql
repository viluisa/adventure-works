with

source as (
    select * from {{ source('erp', 'production_product')}}
)

, renamed as (
        select
            cast(productid as int) as product_pk
            , cast(name as string) as product_name
            , cast(productsubcategoryid as int) as product_subcategory_fk
        from source
    )

select *
from renamed