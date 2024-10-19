with source as (
      select * from {{ source('northwind', 'products') }}
),
renamed as (
    select
        {{ adapter.quote("product_id") }},
        {{ adapter.quote("product_name") }},
        {{ adapter.quote("supplier_id") }},
        {{ adapter.quote("category_id") }},
        {{ adapter.quote("quantity_per_unit") }},
        {{ adapter.quote("unit_price") }},
        {{ adapter.quote("units_in_stock") }},
        {{ adapter.quote("units_on_order") }},
        {{ adapter.quote("reorder_level") }},
        {{ adapter.quote("discontinued") }}

    from source
)
select * from renamed
  