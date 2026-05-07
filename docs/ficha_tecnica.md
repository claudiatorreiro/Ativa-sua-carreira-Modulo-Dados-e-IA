# 📊 Ficha Técnica – Projeto de Dados (Spotify e Concorrentes)

---

## 📌 Contexto

Este projeto foi desenvolvido no módulo de **Dados e Inteligência Artificial da Laboratória**, como parte do programa **Ativa sua Carreira**.

O foco é simular um cenário real de trabalho com dados, aplicando técnicas de **preparação, limpeza, validação e organização de dados** utilizando SQL no BigQuery.

---

## 🎯 Objetivo Técnico

Preparar e tratar uma base de dados de músicas para garantir:

- Qualidade e confiabilidade dos dados  
- Consistência entre variáveis  
- Eliminação de duplicidades  
- Padronização de variáveis categóricas  
- Tratamento de inconsistências numéricas  
- Compatibilidade entre tipos de dados  
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
SELECT *
FROM `Insumos_Rota_B.musicas_spotify`;
```

---

### 🔹 Dados Tratados

Estrutura final após aplicação das etapas de limpeza:

- `musicas_spotify_sem_duplicados`
- `musicas_spotify_numerico_tratado`
- `musicas_spotify_categorico_tratado`
- `musicas_spotify_final`
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

- Identificação de valores nulos em variáveis categóricas  
- Identificação de valores nulos em métricas de plataformas concorrentes  

---

### 2. Tratamento de Valores Nulos

Tratamento aplicado na tabela de concorrentes:

```sql
COALESCE(in_shazam_charts, 0) AS in_shazam_charts
```

📌 Justificativa:

Valores nulos representam ausência de presença nas paradas musicais.

✔ Resultado:

- Eliminação dos valores nulos na coluna `in_shazam_charts`

---

### 3. Validação do Tratamento de Nulos

```sql
SELECT
  COUNTIF(in_shazam_charts IS NULL) AS nulos_restantes
FROM `dados_tratados.musicas_concorrentes_tratada`;
```

✔ Resultado:

- 0 valores nulos restantes

---

### 4. Identificação de Duplicidades

```sql
SELECT
  track_id,
  COUNT(*) AS quantidade
FROM `dados_brutos.musicas_spotify`
GROUP BY track_id
HAVING COUNT(*) > 1;
```

🔎 Resultado:

- Identificação de registros duplicados utilizando `track_id` como chave

---

### 5. Remoção de Duplicados

```sql
CREATE OR REPLACE TABLE `dados_tratados.musicas_spotify_sem_duplicados` AS
SELECT DISTINCT *
FROM `dados_brutos.musicas_spotify`;
```

✔ Resultado:

- Remoção de registros duplicados  
- Base validada sem repetição de `track_id`  

---

### 6. Tratamento de Variáveis Categóricas

Padronização aplicada:

```sql
TRIM(main_music_genre) AS main_music_genre
```

🔎 Problemas identificados:

- Espaços extras  
- Diferenças de formatação  

✔ Resultado:

- Variáveis categóricas padronizadas  
- Redução de ruído na análise  

📌 Observação:

Os valores nulos identificados nas variáveis categóricas foram mantidos devido à baixa representatividade na base.

---

### 7. Tratamento de Variáveis Numéricas

Correção aplicada:

```sql
CASE
  WHEN streams < 0 THEN NULL
  ELSE streams
END AS streams_tratado
```

🔎 Problema identificado:

- Existência de valor negativo na variável `streams`

✔ Validação realizada:

```sql
SELECT
  MIN(streams_tratado),
  MAX(streams_tratado)
FROM `dados_tratados.musicas_spotify_numerico_tratado`;
```

✔ Resultado:

- Valores negativos removidos  
- Variáveis numéricas consistentes para análise  

---

### 8. Validação de Compatibilidade de Tipos

Durante a integração das tabelas foi identificado conflito de tipos na coluna `track_id`:

- Spotify → `INT64`  
- Concorrentes → `STRING`  

✔ Correção aplicada:

```sql
CAST(s.track_id AS STRING)
```

✔ Resultado:

- Compatibilidade garantida entre as tabelas

---

### 9. Junção das Tabelas (JOIN)

```sql
CREATE OR REPLACE TABLE `dados_tratados.musicas_join_final` AS

SELECT
  s.*,
  c.in_apple_playlists,
  c.in_apple_charts,
  c.in_deezer_playlists,
  c.in_deezer_charts,
  c.in_shazam_charts

FROM `dados_tratados.musicas_spotify_final` s

LEFT JOIN `dados_tratados.musicas_concorrentes_tratada` c
ON CAST(s.track_id AS STRING) = c.track_id;
```

📌 Estratégia:

- Utilização de `LEFT JOIN` para preservar os dados do Spotify  
- Compatibilização de tipos utilizando `CAST`  

✔ Validação realizada:

```sql
SELECT
  COUNT(*) AS total_linhas,
  COUNTIF(in_apple_playlists IS NULL) AS sem_match_concorrentes
FROM `dados_tratados.musicas_join_final`;
```

✔ Resultado:

- JOIN realizado sem perda de registros  
- Nenhuma duplicidade identificada após integração  
- Correspondência completa entre as tabelas  

---

## 🔍 Resultado Final

Tabela consolidada:

```text
dados_tratados.musicas_join_final
```

Contendo:

- Dados limpos  
- Sem duplicidades  
- Variáveis categóricas padronizadas  
- Variáveis numéricas validadas  
- Integração entre plataformas concorrentes  
- Base pronta para análise exploratória  

---

## 📈 Status do Projeto

✔ Preparação de dados concluída  
✔ Tratamento de dados concluído  
✔ Integração das bases concluída  
🔜 Próxima etapa: análise exploratória e geração de insights  

---

## 📌 Próximos Passos

- Agrupar e resumir dados  
- Criar métricas e indicadores  
- Explorar padrões de comportamento  
- Gerar insights de negócio  
- Construir dashboard  

---

## 🔁 Processo de Revisão

Durante o desenvolvimento, as tabelas tratadas foram removidas e recriadas para reforço do aprendizado e validação completa do pipeline de tratamento de dados.

Esse processo permitiu revisar cada etapa individualmente, compreender melhor os erros encontrados e consolidar o entendimento sobre tratamento e integração de dados no BigQuery.

---

## 🤝 Aprendizado Colaborativo

O desenvolvimento do projeto também contou com trocas constantes entre as participantes do grupo da Laboratória.

A colaboração foi fundamental para:

- Revisar consultas SQL  
- Identificar inconsistências  
- Validar tratamentos  
- Compreender erros de tipagem  
- Fortalecer o aprendizado coletivo  

---
