with

source as (
    select * from {{ source('erp', 'person_address') }}
),
renamed as (
    select
        cast(addressid as int) as address_pk
        , cast(addressline1 as string) as address_name
        , cast(city as string) as city
        , cast(stateprovinceid as int) as state_fk
    from source
)
select * from renamed