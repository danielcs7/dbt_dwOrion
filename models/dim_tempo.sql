SELECT 
    to_char(data, 'YYYY-MM-DD') as cod_dia,
    data,
    EXTRACT(WEEK FROM data) as cod_semana,
    to_char(data, 'Day') as nome_dia_semana,
    EXTRACT(MONTH FROM data) as cod_mes,
    to_char(data, 'Month') as nome_mes,
    to_char(data, 'YYYY-MM') as cod_mes_ano,
    to_char(data, 'Month YYYY') as nome_mes_ano,
    EXTRACT(QUARTER FROM data) as cod_trimestre,
    'Trimestre ' || EXTRACT(QUARTER FROM data) as nome_trimestre,
    to_char(data, 'YYYY-Q') || EXTRACT(QUARTER FROM data) as cod_trimestre_ano,
    'Trimestre ' || EXTRACT(QUARTER FROM data) || ' ' || to_char(data, 'YYYY') as nome_trimestre_ano,
    EXTRACT(MONTH FROM data) % 2 + 1 as cod_semestre,
    'Semestre ' || (EXTRACT(MONTH FROM data) % 2 + 1) as nome_semestre,
    to_char(data, 'YYYY-') || EXTRACT(MONTH FROM data) % 2 + 1 as cod_semestre_ano,
    'Semestre ' || (EXTRACT(MONTH FROM data) % 2 + 1) || ' ' || to_char(data, 'YYYY') as nome_semestre_ano,
    EXTRACT(YEAR FROM data) as ano,
    CASE 
        WHEN EXTRACT(ISODOW FROM data) IN (6, 7) THEN 'Fim de Semana'
        ELSE 'Dia Útil'
    END as tipo_dia
FROM (
    SELECT generate_series(
        '2016-01-01'::date,
        '2024-12-31'::date,
        '1 day'::interval
        ) AS data
) AS tempo