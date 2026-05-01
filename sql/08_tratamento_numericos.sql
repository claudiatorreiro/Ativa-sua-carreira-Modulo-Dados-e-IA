CREATE OR REPLACE TABLE `projeto-01-rota-b-claudia.dados_tratados.musicas_spotify_final` AS
SELECT
  track_id,
  track_name,
  artists_name,
  artist_count,
  main_music_genre_tratado,
  main_country,
  released_year,
  released_month,
  released_day,

  SAFE_CAST(in_spotify_playlists AS INT64) AS in_spotify_playlists,

  in_spotify_charts,
  streams

FROM `projeto-01-rota-b-claudia.dados_tratados.musicas_spotify_categorico_tratado`;
