-- Projeto: Análise de sucesso de músicas no Spotify
-- Etapa: Criação de dados tratados
-- Objetivo: Aplicar tratamento de dados (substituição de valores nulos)

CREATE OR REPLACE TABLE `projeto-01-rota-b-claudia.dados_tratados.musicas_spotify_tratada` AS
SELECT *
FROM `projeto-01-rota-b-claudia.dados_brutos.musicas_spotify`;


-- Criação da tabela tratada de músicas concorrentes
-- Os valores nulos em in_shazam_charts foram substituídos por 0.

CREATE OR REPLACE TABLE `projeto-01-rota-b-claudia.dados_tratados.musicas_concorrentes_tratada` AS
SELECT
  track_id,
  in_apple_playlists,
  in_apple_charts,
  in_deezer_playlists,
  in_deezer_charts,
  IFNULL(in_shazam_charts, 0) AS in_shazam_charts
FROM `projeto-01-rota-b-claudia.dados_brutos.musicas_concorrentes`;
