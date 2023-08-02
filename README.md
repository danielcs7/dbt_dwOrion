# dbt_dwOrion

# Projeto Data Warehouse Orion

## Introdução

Este projeto tem como objetivo a construção de um data warehouse com base em um banco de dados relacional e comparar as diferentes abordagens de modelagem de dados. Os dados utilizados são do dataset de e-commerce disponibilizado pela Olist no Kaggle. A modelagem do banco relacional seguiu a proposta disponibilizada no Kaggle, conforme abaixo:
![image](https://github.com/danielcs7/dbt_dwOrion/assets/29869300/4dd6563f-9b55-4839-90f9-90cbd9329f69)


A partir dos arquivos CSV foi construido um EL para a construção de um banco de dados relacional utilizando o Pentaho. Estabelecendo conexão com o PostgreSQL, foram criadas as tabelas com as devidas chaves primárias e estrangeiras , posteriormente, o tratamento de valores nulos e carregamento dos dados.

![Captura de Tela 2023-08-02 às 13 37 05](https://github.com/danielcs7/dbt_dwOrion/assets/29869300/abe0e88f-1e88-44d2-8445-96e6a9ce6c52)


Com o banco relacional criado, foi utilizada a ferramenta DBT para a criação do L do data warehouse consumindo dados do banco de dados recém criado. O modelo lógico do data warehouse é descrito na imagem abaixo

![image-1](https://github.com/danielcs7/dbt_dwOrion/assets/29869300/50f8ed9b-c757-4971-8be6-dd59117f821e)


Também é possível de ver com o DBT a documentação gerada de forma automática.

![Captura de Tela 2023-08-02 às 13 24 15](https://github.com/danielcs7/dbt_dwOrion/assets/29869300/03fd283b-3db7-4970-9699-952d4747dbaa)

![Captura de Tela 2023-08-02 às 13 27 26](https://github.com/danielcs7/dbt_dwOrion/assets/29869300/79f00995-8f08-42b0-8825-e69cf711bcc5)

![Captura de Tela 2023-08-02 às 13 23 35](https://github.com/danielcs7/dbt_dwOrion/assets/29869300/8a07614b-0c0e-4080-b979-325966d5c082)

