
{{ config(
    tags = ['your_tag'],
    materialized = 'incremental',
    unique_key = 'nk_cod_produto',
    pre_hook = '
        {% if is_incremental() %}
            DELETE FROM {{ this }} WHERE dt_carga >= (SELECT MAX(dt_carga) FROM {{ this }})
        {% endif %}
    '
) }}

SELECT 
distinct cod_produto as nk_cod_produto
,categoria
,tamanho_nome
,tamanho_descricao
,qnt_fotos
,massa
,comprimento
,largura
,altura
,CURRENT_TIMESTAMP    as dt_carga
FROM 
    {{ source('public', 'produtos')}} prod
WHERE 1=1
LIMIT 10   
