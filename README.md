# 🎧 Projeto de Análise de Dados – Spotify e Concorrentes

Este projeto foi desenvolvido como parte do **Módulo de Dados e Inteligência Artificial da Laboratória**, integrando o programa **Ativa sua Carreira**.

O objetivo é aplicar técnicas de **tratamento, organização e análise de dados** utilizando SQL no BigQuery, simulando um cenário real de análise de dados musicais.

---

## 🎯 Objetivo

Analisar dados de músicas do Spotify e plataformas concorrentes, garantindo qualidade dos dados e preparando a base para análises futuras.

---

## 🛠️ Tecnologias utilizadas

- Google BigQuery  
- SQL  
- GitHub (versionamento)  
- Metodologia de análise de dados  

---

## 📊 Estrutura do Projeto

Os dados foram organizados em três camadas:

- **Insumos (`Insumos_Rota_B`)** → dados originais  
- **Dados Brutos (`dados_brutos`)** → cópia dos dados sem alteração  
- **Dados Tratados (`dados_tratados`)** → dados limpos e preparados para análise  

---

## 🔄 Pipeline de Dados

1. Criação das tabelas de dados brutos  
2. Identificação de valores nulos  
3. Tratamento de valores nulos  
4. Identificação de registros duplicados  
5. Remoção de duplicados  
6. Tratamento de variáveis categóricas  
7. Tratamento de variáveis numéricas  
8. Junção das tabelas (JOIN)  

---

## 🔍 Principais Análises Realizadas

- Identificação de valores nulos  
- Identificação de registros duplicados  
- Padronização de variáveis categóricas  
- Conversão de tipos de dados (STRING → INTEGER)  
- Identificação e tratamento de valores inconsistentes  
- Validação da qualidade dos dados  
- Integração de bases de dados  

---

## 🧩 Decisões de Tratamento

- Valores nulos na coluna `in_shazam_charts` foram substituídos por 0, pois indicam ausência de presença nas paradas musicais.  
- Valores categóricos inconsistentes foram padronizados na coluna `main_music_genre`, tratando diferenças de escrita, espaços e valores nulos (substituídos por "Não informado").  
- A coluna `in_spotify_playlists` foi convertida de STRING para INTEGER utilizando `SAFE_CAST`.  
- Valores inválidos na coluna `streams` (ex: negativos) foram tratados e substituídos por NULL.  
- Foi realizada validação dos dados numéricos utilizando funções `MIN` e `MAX` para garantir consistência.  
- As tabelas foram integradas utilizando `track_id` como chave, após ajuste de tipagem entre as bases.  

---

## 🔗 Junção das Tabelas

- Junção entre dados do Spotify e plataformas concorrentes (Apple, Deezer e Shazam)  
- Chave utilizada: `track_id`  
- Ajuste de tipo realizado para compatibilidade (INT64)  
- Utilizado **LEFT JOIN** para preservar os dados do Spotify  
- Validação final confirmou ausência de perda de dados e valores nulos nas colunas integradas  

---

## 📁 Estrutura do Repositório

📁 sql/  
├── 01_identificacao_nulos.sql  
├── 02_criacao_dados_brutos.sql  
├── 03_criacao_dados_tratados.sql  
├── 04_validacao_tratamento.sql  
├── 05_identificacao_duplicados.sql  
├── 06_remocao_duplicados.sql  
├── 07_tratamento_numerico.sql  
└── 08_join_tabelas.sql  

📁 docs/  
└── ficha_tecnica.md  

---

## 📌 Destaques Técnicos

- Separação em camadas (insumos, brutos e tratados)  
- Uso de `GROUP BY` e `HAVING` para identificação de duplicidades  
- Uso de `CASE WHEN` para tratamento de dados categóricos  
- Uso de `SAFE_CAST` para conversão segura de tipos  
- Validação de consistência com `MIN` e `MAX`  
- Integração de múltiplas fontes com JOIN  

---

## 📄 Dataset Final

`dados_tratados.musicas_join_final`

Base consolidada contendo dados do Spotify integrados com plataformas concorrentes.

---

## 📄 Documentação Completa

A documentação detalhada do projeto está disponível em:

👉 `docs/ficha_tecnica.md`

---

## 🚀 Próximos Passos

- Análise exploratória dos dados  
- Agrupamento e resumo de métricas  
- Visualização de dados  
- Geração de insights de negócio  
- Construção de dashboard  

---

## 🤝 Contato

Se você também está em transição para a área de dados ou tecnologia, vamos trocar experiências:

🔗 [LinkedIn](www.linkedin.com/in/claudia-torreiro-52b30056)
📧 cgtorreiro@hotmail.com

---
