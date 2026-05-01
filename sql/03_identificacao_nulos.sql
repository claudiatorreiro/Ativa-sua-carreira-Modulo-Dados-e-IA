-- Projeto: Análise de sucesso de músicas no Spotify
-- Etapa: Identificação de valores nulos
-- Objetivo: Identificar valores ausentes nas tabelas para avaliar impacto na análise

SELECT
  COUNT(*) AS total_linhas,
  COUNTIF(track_id IS NULL) AS nulos_track_id,
  COUNTIF(track_name IS NULL) AS nulos_track_name,
  COUNTIF(artists_name IS NULL) AS nulos_artists_name,
  COUNTIF(main_music_genre IS NULL OR main_music_genre = '') AS nulos_main_music_genre,
  COUNTIF(main_country IS NULL OR main_country = '') AS nulos_main_country,
  COUNTIF(streams IS NULL) AS nulos_streams
FROM `projeto-01-rota-b-claudia.dados_brutos.musicas_spotify`;

SELECT
  COUNT(*) AS total_linhas,
  COUNTIF(track_id IS NULL) AS nulos_track_id,
  COUNTIF(in_apple_playlists IS NULL) AS nulos_in_apple_playlists,
  COUNTIF(in_apple_charts IS NULL) AS nulos_in_apple_charts,
  COUNTIF(in_deezer_playlists IS NULL) AS nulos_in_deezer_playlists,
  COUNTIF(in_deezer_charts IS NULL) AS nulos_in_deezer_charts,
  COUNTIF(in_shazam_charts IS NULL) AS nulos_in_shazam_charts
FROM `projeto-01-rota-b-claudia.dados_brutos.musicas_concorrentes`;
