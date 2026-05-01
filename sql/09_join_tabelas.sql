-- Projeto: Análise de sucesso de músicas no Spotify
-- Etapa: Junção das tabelas
-- Objetivo: Integrar dados do Spotify com plataformas concorrentes

CREATE OR REPLACE TABLE `projeto-01-rota-b-claudia.dados_tratados.musicas_join_final` AS

SELECT
    s.track_id,
    s.track_name,
    s.artists_name,
    s.artist_count,
    s.main_music_genre_tratado,
    s.main_country,
    s.released_year,
    s.released_month,
    s.released_day,
    s.in_spotify_playlists,
    s.in_spotify_charts,
    s.streams_corrigido,

    c.in_apple_playlists,
    c.in_apple_charts,
    c.in_deezer_playlists,
    c.in_deezer_charts,
    c.in_shazam_charts

FROM `projeto-01-rota-b-claudia.dados_tratados.musicas_spotify_numerico_final` AS s

LEFT JOIN `projeto-01-rota-b-claudia.dados_tratados.musicas_concorrentes_tratada` AS c
ON CAST(s.track_id AS STRING) = c.track_id;
