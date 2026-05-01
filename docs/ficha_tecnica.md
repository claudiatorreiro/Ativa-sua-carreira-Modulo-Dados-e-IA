# 📊 Ficha Técnica – Projeto de Dados (Spotify e Concorrentes)

---

## 📌 Contexto

Este projeto foi desenvolvido no módulo de **Dados e Inteligência Artificial da Laboratória**, como parte do programa **Ativa sua Carreira**.

O foco é simular um cenário real de trabalho com dados, aplicando técnicas de **preparação, limpeza e organização de dados** utilizando SQL no BigQuery.

---

## 🎯 Objetivo Técnico

Preparar e tratar uma base de dados de músicas para garantir:

- Qualidade e confiabilidade dos dados  
- Consistência entre variáveis  
- Eliminação de duplicidades  
- Correção de tipos de dados  
- Padronização de variáveis categóricas  
- Integração entre diferentes fontes  

A base final deve estar pronta para análise exploratória e geração de insights.

---

## 🗂️ Estrutura dos Dados

### 🔹 Insumos (dados originais)

- `Insumos_Rota_B.musicas_spotify`
- `Insumos_Rota_B.musicas_concorrentes`

---

### 🔹 Dados Brutos

Cópia fiel dos dados originais para preservação:

- `dados_brutos.musicas_spotify`
- `dados_brutos.musicas_concorrentes`

```sql
CREATE OR REPLACE TABLE `dados_brutos.musicas_spotify` AS
SELECT * FROM `Insumos_Rota_B.musicas_spotify`;
```

---

### 🔹 Dados Tratados

Estrutura final após aplicação das etapas de limpeza:

- `musicas_spotify_tratada`
- `musicas_spotify_sem_duplicados`
- `musicas_spotify_categorico_tratado`
- `musicas_spotify_numerico_final`
- `musicas_concorrentes_tratada`
- `musicas_join_final`

---

## 🔄 Pipeline de Tratamento

### 1. Identificação de Valores Nulos

Consulta aplicada:

```sql
SELECT
  COUNT(*) AS total_linhas,
  COUNTIF(track_id IS NULL) AS nulos_track_id,
  COUNTIF(track_name IS NULL) AS nulos_track_name,
  COUNTIF(artists_name IS NULL) AS nulos_artists_name,
  COUNTIF(main_music_genre IS NULL OR main_music_genre = '') AS nulos_main_music_genre,
  COUNTIF(main_country IS NULL OR main_country = '') AS nulos_main_country,
  COUNTIF(streams IS NULL) AS nulos_streams
FROM `dados_brutos.musicas_spotify`;
```

🔎 Resultado:
- Presença de valores nulos em variáveis categóricas e numéricas
- Necessidade de tratamento direcionado

---

### 2. Tratamento de Valores Nulos

Decisão aplicada:

```sql
IFNULL(in_shazam_charts, 0) AS in_shazam_charts
```

📌 Justificativa:
Valores nulos representam ausência de ranking → substituídos por 0

---

### 3. Validação do Tratamento

```sql
SELECT
  COUNTIF(in_shazam_charts IS NULL) AS nulos_restantes
FROM `dados_tratados.musicas_concorrentes_tratada`;
```

✔ Resultado: 0 valores nulos

---

### 4. Identificação de Duplicidades

```sql
SELECT track_id, COUNT(*)
FROM `dados_tratados.musicas_spotify_tratada`
GROUP BY track_id
HAVING COUNT(*) > 1;
```

🔎 Resultado:
- Identificação de registros duplicados por `track_id`

---

### 5. Remoção de Duplicados

```sql
CREATE OR REPLACE TABLE `dados_tratados.musicas_spotify_sem_duplicados` AS
SELECT *
FROM (
  SELECT *,
  ROW_NUMBER() OVER (PARTITION BY track_id ORDER BY track_id) AS row_num
  FROM `dados_tratados.musicas_spotify_tratada`
)
WHERE row_num = 1;
```

✔ Resultado: Base sem duplicidades

---

### 6. Tratamento de Variáveis Categóricas

Padronização aplicada:

```sql
CASE
  WHEN main_music_genre IS NULL OR TRIM(main_music_genre) = '' THEN 'Não informado'
  WHEN LOWER(TRIM(main_music_genre)) IN ('disco-pop', 'disco pop') THEN 'Disco pop'
  ELSE TRIM(main_music_genre)
END AS main_music_genre_tratado
```

🔎 Problemas identificados:
- Valores nulos
- Variações de escrita
- Inconsistência de formatação

✔ Resultado:
- Variável padronizada
- Redução de ruído na análise

---

### 7. Tratamento de Variáveis Numéricas

Conversão de tipo:

```sql
SAFE_CAST(in_spotify_playlists AS INT64)
```

Correção de valores inválidos:

```sql
CASE
  WHEN streams < 0 THEN NULL
  ELSE streams
END AS streams_corrigido
```

Validação:

```sql
SELECT
  MIN(in_spotify_playlists),
  MAX(in_spotify_playlists),
  MIN(streams_corrigido),
  MAX(streams_corrigido)
FROM `dados_tratados.musicas_spotify_numerico_final`;
```

✔ Resultado:
- Tipos corrigidos
- Valores consistentes

---

### 8. Junção das Tabelas (JOIN)

```sql
CREATE OR REPLACE TABLE `dados_tratados.musicas_join_final` AS

SELECT
  s.*,
  c.in_apple_playlists,
  c.in_apple_charts,
  c.in_deezer_playlists,
  c.in_deezer_charts,
  c.in_shazam_charts

FROM `dados_tratados.musicas_spotify_numerico_final` s

LEFT JOIN `dados_tratados.musicas_concorrentes_tratada` c
ON CAST(s.track_id AS STRING) = c.track_id;
```

📌 Estratégia:
- LEFT JOIN para preservar dados do Spotify
- CAST para compatibilização de tipos

✔ Validação:

```sql
SELECT
  COUNTIF(in_apple_playlists IS NULL),
  COUNTIF(in_deezer_playlists IS NULL),
  COUNTIF(in_shazam_charts IS NULL)
FROM `dados_tratados.musicas_join_final`;
```

✔ Resultado: 0 inconsistências

---

## 🔍 Resultado Final

Tabela consolidada:

```
dados_tratados.musicas_join_final
```

Contendo:
- Dados limpos
- Sem duplicidade
- Tipos corretos
- Variáveis padronizadas
- Integração entre plataformas

---

## 📈 Status do Projeto

✔ Preparação de dados concluída  
✔ Tratamento concluído  
✔ Integração concluída  
🔜 Próxima etapa: Análise exploratória  

---

## 📌 Próximos Passos

- Agrupar e resumir dados  
- Criar métricas  
- Explorar padrões  
- Gerar insights de negócio  
- Construir dashboard  

---
