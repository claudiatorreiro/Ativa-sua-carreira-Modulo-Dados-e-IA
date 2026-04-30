-- Projeto: Análise de sucesso de músicas no Spotify
-- Etapa: Identificação de registros duplicados
-- Objetivo: Verificar duplicidades na base de músicas do Spotify

SELECT
  track_id,
  COUNT(*) AS quantidade
FROM `projeto-01-rota-b-claudia.dados_tratados.musicas_spotify_tratada`
GROUP BY track_id
HAVING COUNT(*) > 1;

SELECT
  track_name,
  artists_name,
  COUNT(*) AS quantidade
FROM `projeto-01-rota-b-claudia.dados_tratados.musicas_spotify_tratada`
GROUP BY track_name, artists_name
HAVING COUNT(*) > 1;
