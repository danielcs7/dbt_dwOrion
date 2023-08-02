{{ config(
    tags = ['your_tag'],
    materialized = 'incremental',
    unique_key = 'nk_cod_cliente',
    pre_hook = '
        {% if is_incremental() %}
            DELETE FROM {{ this }} WHERE dt_carga >= (SELECT MAX(dt_carga) FROM {{ this }})
        {% endif %}
    '
) }}


SELECT DISTINCT
    c.cod_cliente_pedido as nk_cod_cliente_pedido
    ,c.cod_cliente as nk_cod_cliente
    ,geo.cidade
    ,geo.estado
    ,geo.latitude
    ,geo.longitude
    ,geo.prefix_cep
    ,CURRENT_TIMESTAMP    as dt_carga
FROM 
    {{ source('public', 'clientes') }} c
LEFT JOIN
    {{ source('public', 'geolocalizacao') }} geo ON geo.prefix_cep = c.prefix_cep
WHERE 1=1
LIMIT 10    
