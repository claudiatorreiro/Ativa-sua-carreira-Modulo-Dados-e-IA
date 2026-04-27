# Ativa-sua-carreira_Modulo-Dados-e-IA

---

Módulo bônus do Ativa sua carreira programa de aprendizagem em dados para desenvolver habilidades práticas, ganhar confiança e fortalecer seu perfil para o mercado de trabalho.

---

# 🎧 Análise de Dados - Sucesso de Músicas no Spotify

Projeto desenvolvido no **Módulo de Dados e Inteligência Artificial**, complemento do programa **Ativa sua Carreira** da Laboratória.

Este projeto tem como foco aplicar técnicas de análise de dados utilizando SQL e BigQuery para investigar quais fatores podem influenciar o sucesso de uma música no Spotify.

---

## 🎯 Objetivo

Identificar padrões e possíveis variáveis que impactam o sucesso de músicas, considerando como métrica principal o número de reproduções (`streams`).

A proposta é responder a seguinte pergunta de negócio:

👉 *Quais fatores podem indicar, de forma precoce, que uma música será bem-sucedida no Spotify?*

---

## 📊 Base de Dados

Foram utilizadas duas tabelas:

### 🎧 `musicas_spotify`
Contém informações principais das músicas, como:
- Nome da música (`track_name`)
- Artista(s) (`artists_name`)
- Quantidade de artistas (`artist_count`)
- Gênero musical (`main_music_genre`)
- País (`main_country`)
- Data de lançamento (`released_year`, `released_month`, `released_day`)
- Presença em playlists e charts do Spotify
- Número de reproduções (`streams`)

### 📊 `musicas_concorrentes`
Contém dados de desempenho em outras plataformas:
- Apple Music (playlists e charts)
- Deezer (playlists e charts)
- Shazam (charts)

🔗 As tabelas estão relacionadas pela variável `track_id`.

---

## 🧠 Hipóteses de Análise

Durante o projeto, foram consideradas algumas hipóteses:

- Músicas presentes em mais playlists possuem mais streams
- Presença em charts influencia o sucesso
- O gênero musical impacta o número de reproduções
- A quantidade de artistas pode influenciar a performance
- A presença em outras plataformas pode refletir no desempenho no Spotify

---

## 🧹 Preparação e Limpeza de Dados

### 🔍 Identificação de valores nulos

Foram aplicadas consultas SQL utilizando `COUNTIF` e `IS NULL` para identificar valores ausentes.

Resultado da análise:

- Dataset com **843 registros**
- Apenas duas colunas apresentaram valores nulos:
  - `main_music_genre` → 1 registro
  - `main_country` → 1 registro

### 📌 Decisão adotada

Devido à baixa quantidade de valores nulos, optou-se por **manter os dados sem tratamento**, considerando que não impactam significativamente os resultados da análise.

---

## 🛠️ Ferramentas Utilizadas

- **Google BigQuery** → armazenamento e consulta de dados
- **SQL** → manipulação e análise
- **GitHub** → versionamento e documentação do projeto

---

## 🔄 Processo de Análise

O projeto segue uma abordagem sequencial:

1. Estruturação do ambiente (projeto, dataset e tabelas)
2. Preparação e limpeza de dados
3. Análise exploratória
4. Cruzamento de dados (JOIN)
5. Identificação de padrões
6. Geração de insights

---

## 🚀 Próximos Passos

- Identificar valores duplicados
- Analisar valores atípicos (outliers)
- Realizar JOIN entre as tabelas
- Explorar relações entre variáveis e `streams`
- Criar visualizações para apoiar a análise
- Consolidar insights finais

---

## 💡 Aprendizados

Este projeto contribuiu para o desenvolvimento de habilidades em:

- Estruturação de dados no BigQuery
- Escrita e interpretação de consultas SQL
- Análise exploratória de dados (EDA)
- Tomada de decisão baseada em dados
- Organização e documentação de projetos de dados

---

## 🌱 Sobre o Programa

O **Ativa sua Carreira**, da Laboratória, é um programa voltado ao desenvolvimento profissional, com foco em habilidades técnicas e comportamentais.

O módulo de **Dados e Inteligência Artificial** complementa essa jornada com uma abordagem prática, permitindo aplicar conceitos em projetos reais.

---

## 🤝 Conexão

Se você também está em transição para a área de dados ou tecnologia, vamos trocar experiências:

🔗 [LinkedIn](www.linkedin.com/in/claudia-torreiro-52b30056)
📧 cgtorreiro@hotmail.com
