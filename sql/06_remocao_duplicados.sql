-- Projeto: Análise de sucesso de músicas no Spotify
-- Etapa: Tratamento de registros duplicados
-- Objetivo: Criar uma tabela sem registros duplicados

CREATE OR REPLACE TABLE `projeto-01-rota-b-claudia.dados_tratados.musicas_spotify_sem_duplicados` AS
SELECT *
FROM (
  SELECT
    *,
    ROW_NUMBER() OVER (
      PARTITION BY track_id
      ORDER BY streams DESC
    ) AS rn
  FROM `projeto-01-rota-b-claudia.dados_tratados.musicas_spotify_tratada`
)
WHERE rn = 1;
