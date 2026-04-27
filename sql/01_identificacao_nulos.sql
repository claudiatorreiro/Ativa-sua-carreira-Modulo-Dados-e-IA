SELECT
  COUNT(*) AS total_linhas,
  COUNTIF(track_id IS NULL) AS nulos_track_id
FROM `projeto-01-rota-b-claudia.Insumos_Rota_B.musicas spotify`;
