{{ config(
    tags = ['your_tag'],
    materialized = 'incremental',
    unique_key = 'nk_cod_pedido',
    pre_hook = '
        {% if is_incremental() %}
            DELETE FROM {{ this }} WHERE dt_carga >= (SELECT MAX(dt_carga) FROM {{ this }})
        {% endif %}
    '
) }}

SELECT
cod_pedido as nk_cod_pedido,
sequencial_pagamento ,
tipo ,
parcelas ,
valor ,
CURRENT_TIMESTAMP    as dt_carga
FROM 
    {{ source('public', 'pagamentos')}} prod
WHERE 1=1
LIMIT 10
