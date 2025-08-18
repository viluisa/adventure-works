with

source as (
    select * from {{ source('erp', 'person_stateprovince') }}
),
renamed as (
    select
        cast(stateprovinceid as int) as state_pk
        , cast(name as string) as state_name
        , cast(countryregioncode as string) as country_fk
    from source
)
select * from renamed