with

source as (
    select * from {{ source('erp', 'production_productsubcategory')}}
)

, renamed as (
        select
            cast(productsubcategoryid as int) as subcategory_pk
            , cast(productcategoryid as int) as subcategory_category_fk
            , cast(name as string) as subcategory_name
        from source
    )

select *
from renamed