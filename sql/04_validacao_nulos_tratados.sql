-- Validação após criação das tabelas tratadas

SELECT
  COUNT(*) AS total_linhas,
  COUNTIF(in_shazam_charts IS NULL) AS nulos_in_shazam_charts
FROM `projeto-01-rota-b-claudia.dados_tratados.musicas_concorrentes_tratada`;
