# 📊 Ficha Técnica – Projeto de Dados (Spotify e Concorrentes)

---

## 📌 Contexto

Este projeto foi desenvolvido no módulo de **Dados e Inteligência Artificial**, complemento do programa **Ativa sua Carreira**, da Laboratória.

O objetivo do projeto é analisar dados de músicas do Spotify e de plataformas concorrentes para identificar possíveis fatores relacionados ao sucesso de uma música, considerando como principal métrica a quantidade de reproduções (`streams`).

---

## 🎯 Objetivo Técnico

Preparar e organizar as bases de dados para análise, garantindo:

- Preservação dos dados originais
- Separação entre dados brutos e dados tratados
- Identificação de valores nulos
- Tratamento de valores nulos quando necessário
- Identificação e tratamento de duplicidades
- Criação de tabelas finais consistentes para análise

---

## 🗂️ Estrutura dos Dados no BigQuery

O projeto foi organizado em três camadas:

### 🔹 Insumos

Dataset inicial onde as tabelas foram importadas originalmente.

Tabelas:

- `Insumos_Rota_B.musicas spotify`
- `Insumos_Rota_B.musicas concorrentes`

Essa camada representa os dados conforme foram carregados inicialmente.

---

### 🔹 Dados Brutos

Dataset criado para armazenar uma cópia organizada dos dados originais, sem alteração no conteúdo.

Tabelas:

- `dados_brutos.musicas_spotify`
- `dados_brutos.musicas_concorrentes`

Objetivo:

- Preservar os dados originais
- Padronizar os nomes das tabelas
- Evitar alterações diretas nos insumos

---

### 🔹 Dados Tratados

Dataset criado para armazenar as tabelas limpas e preparadas para análise.

Tabelas criadas até o momento:

- `dados_tratados.musicas_spotify_tratada`
- `dados_tratados.musicas_concorrentes_tratada`
- `dados_tratados.musicas_spotify_final`

---

## 🔄 1. Criação das Tabelas de Dados Brutos

As tabelas originais foram copiadas para o dataset `dados_brutos`.

```sql
CREATE OR REPLACE TABLE `projeto-01-rota-b-claudia.dados_brutos.musicas_spotify` AS
SELECT *
FROM `projeto-01-rota-b-claudia.Insumos_Rota_B.musicas spotify`;
```

```sql
CREATE OR REPLACE TABLE `projeto-01-rota-b-claudia.dados_brutos.musicas_concorrentes` AS
SELECT *
FROM `projeto-01-rota-b-claudia.Insumos_Rota_B.musicas concorrentes`;
```

---

## 🔍 2. Identificação de Valores Nulos

Foram utilizadas consultas SQL com `COUNTIF` e `IS NULL` para identificar valores ausentes nas duas tabelas.

---

### 🎧 2.1 Tabela `musicas_spotify`

```sql
SELECT
  COUNT(*) AS total_linhas,
  COUNTIF(track_id IS NULL) AS nulos_track_id,
  COUNTIF(track_name IS NULL) AS nulos_track_name,
  COUNTIF(artists_name IS NULL) AS nulos_artists_name,
  COUNTIF(artist_count IS NULL) AS nulos_artist_count,
  COUNTIF(main_music_genre IS NULL) AS nulos_main_music_genre,
  COUNTIF(main_country IS NULL) AS nulos_main_country,
  COUNTIF(released_year IS NULL) AS nulos_released_year,
  COUNTIF(released_month IS NULL) AS nulos_released_month,
  COUNTIF(released_day IS NULL) AS nulos_released_day,
  COUNTIF(in_spotify_playlists IS NULL) AS nulos_in_spotify_playlists,
  COUNTIF(in_spotify_charts IS NULL) AS nulos_in_spotify_charts,
  COUNTIF(streams IS NULL) AS nulos_streams
FROM `projeto-01-rota-b-claudia.dados_brutos.musicas_spotify`;
```

### Resultado encontrado

- Total de registros: **843**
- `main_music_genre`: **1 valor nulo**
- `main_country`: **1 valor nulo**
- Demais colunas analisadas: sem valores nulos relevantes

### Decisão

Como a quantidade de valores nulos é muito baixa, os dados foram mantidos sem alteração nessa etapa, pois não comprometem a análise.

---

### 📊 2.2 Tabela `musicas_concorrentes`

```sql
SELECT
  COUNT(*) AS total_linhas,
  COUNTIF(track_id IS NULL) AS nulos_track_id,
  COUNTIF(in_apple_playlists IS NULL) AS nulos_in_apple_playlists,
  COUNTIF(in_apple_charts IS NULL) AS nulos_in_apple_charts,
  COUNTIF(in_deezer_playlists IS NULL) AS nulos_in_deezer_playlists,
  COUNTIF(in_deezer_charts IS NULL) AS nulos_in_deezer_charts,
  COUNTIF(in_shazam_charts IS NULL) AS nulos_in_shazam_charts
FROM `projeto-01-rota-b-claudia.dados_brutos.musicas_concorrentes`;
```

### Resultado encontrado

- Total de registros: **953**
- `in_shazam_charts`: **50 valores nulos**
- Demais colunas analisadas: sem valores nulos relevantes

### Decisão

Os valores nulos da coluna `in_shazam_charts` foram interpretados como ausência da música nos charts do Shazam.

Por isso, a decisão foi substituir os valores nulos por `0`.

---

## 🧹 3. Criação das Tabelas Tratadas

---

### 🎧 3.1 Tabela Spotify tratada

Como os valores nulos encontrados na tabela do Spotify foram considerados irrelevantes para a análise inicial, a tabela foi copiada para a camada tratada sem alteração.

```sql
CREATE OR REPLACE TABLE `projeto-01-rota-b-claudia.dados_tratados.musicas_spotify_tratada` AS
SELECT *
FROM `projeto-01-rota-b-claudia.dados_brutos.musicas_spotify`;
```

---

### 📊 3.2 Tabela Concorrentes tratada

Na tabela de concorrentes, os valores nulos em `in_shazam_charts` foram substituídos por `0`.

```sql
CREATE OR REPLACE TABLE `projeto-01-rota-b-claudia.dados_tratados.musicas_concorrentes_tratada` AS
SELECT
  track_id,
  in_apple_playlists,
  in_apple_charts,
  in_deezer_playlists,
  in_deezer_charts,
  IFNULL(in_shazam_charts, 0) AS in_shazam_charts
FROM `projeto-01-rota-b-claudia.dados_brutos.musicas_concorrentes`;
```

---

## ✅ 4. Validação do Tratamento de Valores Nulos

Após o tratamento da coluna `in_shazam_charts`, foi realizada validação para confirmar se ainda existiam valores nulos.

```sql
SELECT
  COUNT(*) AS total_linhas,
  COUNTIF(in_shazam_charts IS NULL) AS nulos_in_shazam_charts
FROM `projeto-01-rota-b-claudia.dados_tratados.musicas_concorrentes_tratada`;
```

### Resultado esperado

- `nulos_in_shazam_charts`: **0**

### Conclusão

O tratamento dos valores nulos em `in_shazam_charts` foi realizado com sucesso.

---

## 🔁 5. Identificação de Registros Duplicados

---

### 🎧 5.1 Duplicados na tabela Spotify

Foi utilizada a combinação `track_name` + `artists_name` para identificar músicas repetidas.

```sql
SELECT
  track_name,
  artists_name,
  COUNT(*) AS repeticoes
FROM `projeto-01-rota-b-claudia.dados_tratados.musicas_spotify_tratada`
GROUP BY track_name, artists_name
HAVING COUNT(*) > 1
ORDER BY repeticoes DESC;
```

### Resultado encontrado

- Foram identificadas **8 músicas duplicadas**
- Cada música apareceu com **2 registros**

### Interpretação

A duplicidade foi analisada considerando que uma mesma música, com o mesmo artista, não deveria aparecer mais de uma vez com dados iguais.

---

### 📊 5.2 Duplicados na tabela Concorrentes

Foi utilizada a coluna `track_id` para identificar duplicidades na tabela de concorrentes.

```sql
SELECT
  track_id,
  COUNT(*) AS repeticoes
FROM `projeto-01-rota-b-claudia.dados_tratados.musicas_concorrentes_tratada`
GROUP BY track_id
HAVING COUNT(*) > 1
ORDER BY repeticoes DESC;
```

### Resultado encontrado

- Não foram identificados registros duplicados na tabela de concorrentes.

---

## 🔎 6. Análise dos Duplicados da Tabela Spotify

Para validar os registros duplicados, foi analisado um exemplo específico.

```sql
SELECT *
FROM `projeto-01-rota-b-claudia.dados_tratados.musicas_spotify_tratada`
WHERE track_name = 'SPIT IN MY FACE!';
```

### Observação

A análise demonstrou que os registros possuíam:

- Mesmo nome da música (`track_name`)
- Mesmo artista (`artists_name`)
- Demais atributos iguais
- Diferença apenas no identificador técnico (`track_id`)

### Conclusão

Os registros foram considerados duplicidades técnicas, ou seja, a mesma música registrada mais de uma vez com identificadores diferentes.

---

## 🧹 7. Tratamento de Duplicados da Tabela Spotify

Foi aplicada a função `ROW_NUMBER()` para manter apenas um registro por música, considerando a combinação `track_name` + `artists_name`.

```sql
CREATE OR REPLACE TABLE `projeto-01-rota-b-claudia.dados_tratados.musicas_spotify_final` AS
SELECT
  track_id,
  track_name,
  artists_name,
  artist_count,
  main_music_genre,
  main_country,
  released_year,
  released_month,
  released_day,
  SAFE_CAST(in_spotify_playlists AS INT64) AS in_spotify_playlists,
  in_spotify_charts,
  streams
FROM (
  SELECT *,
         ROW_NUMBER() OVER (
           PARTITION BY track_name, artists_name
           ORDER BY track_id
         ) AS rn
  FROM `projeto-01-rota-b-claudia.dados_tratados.musicas_spotify_tratada`
)
WHERE rn = 1;
```

### Estratégia adotada

- Agrupar por `track_name` e `artists_name`
- Manter apenas o primeiro registro de cada grupo
- Remover a coluna auxiliar `rn` da tabela final
- Converter `in_spotify_playlists` de texto para número inteiro com `SAFE_CAST`

---

## ✅ 8. Validação Pós-Tratamento de Duplicados

Após a criação da tabela `musicas_spotify_final`, foi realizada nova validação para confirmar se ainda existiam duplicidades.

```sql
SELECT
  track_name,
  artists_name,
  COUNT(*) AS repeticoes
FROM `projeto-01-rota-b-claudia.dados_tratados.musicas_spotify_final`
GROUP BY track_name, artists_name
HAVING COUNT(*) > 1;
```

### Resultado esperado

- Nenhum registro duplicado encontrado

### Conclusão

O tratamento de duplicidades foi realizado com sucesso.

---

## 📊 9. Situação Atual dos Dados

### 🎧 Spotify

Tabela final para análise:

- `dados_tratados.musicas_spotify_final`

Resumo:

- Total inicial: **843 registros**
- Músicas duplicadas identificadas: **8**
- Duplicidades tratadas: **sim**
- Valores nulos relevantes: **não identificados**
- Coluna `in_spotify_playlists` convertida para número inteiro

---

### 📊 Concorrentes

Tabela final para análise:

- `dados_tratados.musicas_concorrentes_tratada`

Resumo:

- Total inicial: **953 registros**
- Valores nulos em `in_shazam_charts`: **50**
- Tratamento aplicado: substituição por `0`
- Duplicidades identificadas: **não**

---

## 🧠 10. Decisões Técnicas

Durante a preparação dos dados, foram tomadas as seguintes decisões:

- Manter os dados originais preservados no dataset de insumos
- Criar uma camada de dados brutos com nomes padronizados
- Realizar tratamentos apenas na camada de dados tratados
- Manter os nulos irrelevantes da tabela Spotify
- Substituir os nulos de `in_shazam_charts` por `0`
- Remover duplicidades técnicas da tabela Spotify
- Utilizar `track_name` + `artists_name` como critério de unicidade para músicas
- Validar os dados após cada tratamento aplicado

---

## 🚀 11. Próximos Passos

As próximas etapas do projeto serão:

- Realizar o JOIN entre as tabelas finais
- Fazer análise exploratória dos dados
- Agrupar e resumir informações
- Criar visualizações
- Analisar possíveis correlações
- Responder às perguntas de negócio
- Consolidar os resultados em relatório ou dashboard

---
