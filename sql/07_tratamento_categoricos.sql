CREATE OR REPLACE TABLE `projeto-01-rota-b-claudia.dados_tratados.musicas_spotify_categorico_tratado` AS
SELECT
  *,
  CASE
    WHEN main_music_genre IS NULL OR main_music_genre = '' THEN 'Nao informado'
    WHEN main_music_genre = 'Disco-pop' THEN 'Disco pop'
    ELSE main_music_genre
  END AS main_music_genre_tratado
FROM `projeto-01-rota-b-claudia.dados_tratados.musicas_spotify_sem_duplicados`;
