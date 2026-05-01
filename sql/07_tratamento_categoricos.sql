-- Projeto: Análise de sucesso de músicas no Spotify
-- Etapa: Tratamento de valores atípicos categóricos
-- Objetivo: Padronizar inconsistências na variável main_music_genre

CREATE OR REPLACE TABLE `projeto-01-rota-b-claudia.dados_tratados.musicas_spotify_categorico_tratado` AS
SELECT
  *,
  CASE
    WHEN main_music_genre IS NULL OR TRIM(main_music_genre) = '' THEN 'Nao informado'
    WHEN LOWER(TRIM(main_music_genre)) = 'main genre' THEN 'Nao informado'
    WHEN LOWER(TRIM(main_music_genre)) = 'disco-pop' THEN 'Disco pop'
    ELSE TRIM(main_music_genre)
  END AS main_music_genre_tratado
FROM `projeto-01-rota-b-claudia.dados_tratados.musicas_spotify_sem_duplicados`;
