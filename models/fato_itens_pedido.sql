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
    ped.cod_pedido as nk_cod_pedido
    ,CONCAT(ped.cod_pedido,pag.sequencial_pagamento) AS nk_cod_pagamento
    ,it.item_pedido
    ,geo.prefix_cep as nk_prefix_cep
    ,FORMAT(ped.data,'yyyyMMdd') AS data_pedido
    ,CAST(ped.data AS TIME(0)) AS hora_pedido
    ,FORMAT(ped.data_aprovacao,'yyyyMMdd') AS data_aprovacao
    ,CAST(ped.data_aprovacao AS TIME(0)) AS hora_aprovacao
    ,FORMAT(ped.data_entrega_transportadora,'yyyyMMdd' ) AS data_entrega_transportadora
    ,CAST(ped.data_entrega_transportadora AS TIME(0)) AS hora_entrega_transportadora
    ,FORMAT(ped.data_entrega_cliente,'yyyyMMdd') AS data_entrega_cliente
    ,CAST(ped.data_entrega_cliente AS TIME(0)) AS hora_entrega_cliente
    ,FORMAT(ped.data_estimada_entrega, 'yyyyMMdd') AS data_estimada_entrega
    ,ped.status
    ,CASE WHEN pag.sequencial_pagamento = 1 THEN it.preco ELSE 0 END AS valor_item_pedido
    ,CASE WHEN pag.sequencial_pagamento = 1 THEN it.frete ELSE 0 END AS frete_item_pedido
    ,geo.cod_cliente_pedido as nk_cod_cliente
    ,it.cod_vendedor as nk_cod_vendedor
    ,prod.cod_produto as nk_cod_produto
    ,CURRENT_TIMESTAMP    as dt_carga
FROM
    {{ source('public', 'item_pedido')}} it
LEFT JOIN
    {{ source('public', 'pedido')}}  ped ON ped.cod_pedido = it.cod_pedido

LEFT JOIN
    {{ source('public', 'produtos')}}  prod ON prod.cod_produto = it.cod_produto
LEFT JOIN
    {{ source('public', 'pagamentos')}}  pag ON pag.cod_pedido = it.cod_pedido
LEFT JOIN
    (SELECT c.cod_cliente_pedido, geo.cidade, geo.estado, geo.latitude, geo.longitude, geo.prefix_cep 
    FROM {{ source('public', 'clientes')}} c
    INNER JOIN
    {{ source('public', 'geolocalizacao')}} geo ON c.prefix_cep = geo.prefix_cep) geo ON geo.cod_cliente_pedido = ped.cod_cliente
LEFT JOIN
    {{ source('public', 'vendedores')}} vend ON vend.cod_vendedor = it.cod_vendedor
where 1=1
limit 10








