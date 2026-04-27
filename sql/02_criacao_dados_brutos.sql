-- Projeto: Análise de sucesso de músicas no Spotify
-- Etapa: Criação de dados brutos
-- Objetivo: Organizar os dados originais em um dataset estruturado

CREATE OR REPLACE TABLE `projeto-01-rota-b-claudia.dados_brutos.musicas_spotify` AS
SELECT *
FROM `projeto-01-rota-b-claudia.Insumos_Rota_B.musicas spotify`;

CREATE OR REPLACE TABLE `projeto-01-rota-b-claudia.dados_brutos.musicas_concorrentes` AS
SELECT *
FROM `projeto-01-rota-b-claudia.Insumos_Rota_B.musicas concorrentes`;
