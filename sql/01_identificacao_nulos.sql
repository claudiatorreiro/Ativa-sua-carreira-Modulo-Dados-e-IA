-- Projeto: Análise de sucesso de músicas no Spotify
-- Etapa: Identificação de valores nulos
-- Objetivo: Identificar valores ausentes nas tabelas para avaliar impacto na análise

SELECT
  COUNT(*) AS total_linhas,
  COUNTIF(track_id IS NULL) AS nulos_track_id
FROM `projeto-01-rota-b-claudia.dados_brutos.musicas_spotify`;
