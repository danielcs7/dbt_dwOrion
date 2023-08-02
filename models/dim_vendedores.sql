-- dim_vendedor.sql
{{ config(
    tags = ['your_tag'],
    materialized = 'incremental',
    unique_key = 'nk_cod_vendedor',
    pre_hook = '
        {% if is_incremental() %}
            DELETE FROM {{ this }} WHERE dt_carga >= (SELECT MAX(dt_carga) FROM {{ this }})
        {% endif %}
    '
) }}


WITH cte AS (
    SELECT 
        DISTINCT vend.cod_vendedor AS nk_cod_vendedor,
        geo.prefix_cep AS nk_prefix_cep,
        CURRENT_TIMESTAMP AS dt_carga
    FROM 
        {{ source('public', 'vendedores') }} vend
    LEFT JOIN
        {{ source('public', 'geolocalizacao') }} geo ON geo.prefix_cep = vend.prefix_cep
    WHERE 1 = 1
)

SELECT * FROM cte
where 1=1
limit 10