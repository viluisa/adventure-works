with

source as (
    select * from {{ source('erp', 'person_countryregion') }}
),
renamed as (
    select
        cast(countryregioncode as string) as country_pk
        , cast(name as string) as country_name
    from source
)
select * from renamed