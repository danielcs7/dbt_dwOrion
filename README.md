# dbt_dwOrion

# Projeto Data Warehouse Orion

## Introdução

Este projeto tem como objetivo a construção de um data warehouse com base em um banco de dados relacional e comparar as diferentes abordagens de modelagem de dados. Os dados utilizados são do dataset de e-commerce disponibilizado pela Olist no Kaggle. A modelagem do banco relacional seguiu a proposta disponibilizada no Kaggle, conforme abaixo:
![Alt text](image.png)

A partir dos arquivos CSV foi construido um EL para a construção de um banco de dados relacional utilizando o Pentaho. Estabelecendo conexão com o PostgreSQL, foram criadas as tabelas com as devidas chaves primárias e estrangeiras , posteriormente, o tratamento de valores nulos e carregamento dos dados.

![Alt text](<Captura de Tela 2023-08-02 às 13.37.05.png>)


Com o banco relacional criado, foi utilizada a ferramenta DBT para a criação do L do data warehouse consumindo dados do banco de dados recém criado. O modelo lógico do data warehouse é descrito na imagem abaixo

![Alt text](image-1.png)

Também é possível de ver com o DBT a documentação gerada de forma automática.

![Alt text](<Captura de Tela 2023-08-02 às 13.24.15.png>)

![Alt text](<Captura de Tela 2023-08-02 às 13.27.26.png>)

![Alt text](<Captura de Tela 2023-08-02 às 13.23.35.png>)