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
3. Identificação de registros duplicados  
4. Remoção de duplicados  
5. Tratamento de variáveis categóricas  
6. Tratamento de variáveis numéricas  
7. Validação dos tipos de dados  
8. Junção das tabelas (JOIN)  

---

## 🔍 Principais Análises Realizadas

- Identificação de valores nulos  
- Identificação de registros duplicados  
- Padronização de variáveis categóricas  
- Validação da qualidade dos dados  
- Integração de bases de dados  
- Validação de schema e compatibilidade de tipos antes do JOIN  

---

## 🧩 Decisões de Tratamento

- Valores nulos na coluna `in_shazam_charts` foram substituídos por 0, pois indicam ausência de presença nas paradas musicais.  
- Valores categóricos foram padronizados na coluna `main_music_genre`, tratando diferenças de escrita e espaços extras.  
- Os valores nulos identificados nas variáveis categóricas foram mantidos devido à baixa representatividade na base.  
- Foi realizada validação dos dados numéricos utilizando funções `MIN` e `MAX` para garantir consistência.  
- Foi realizado ajuste de tipagem da coluna `track_id` utilizando `CAST` para compatibilizar os dados entre as tabelas antes do JOIN.  
- As tabelas foram integradas utilizando `track_id` como chave principal.  

---

## 🔗 Junção das Tabelas

- Junção entre dados do Spotify e plataformas concorrentes (Apple, Deezer e Shazam)  
- Chave utilizada: `track_id`  
- Ajuste de tipagem realizado com `CAST` para garantir compatibilidade entre os schemas das tabelas  
- Utilizado `LEFT JOIN` para preservar os dados do Spotify  
- Validação final confirmou ausência de perda de dados, ausência de duplicidades após o JOIN e integridade das colunas utilizadas na integração  

---

## 🔁 Processo de Revisão

Durante o desenvolvimento, as tabelas tratadas foram removidas e recriadas para reforço do aprendizado e validação completa do pipeline de tratamento de dados.

Esse processo permitiu revisar cada etapa individualmente, compreender melhor os erros encontrados e consolidar o entendimento sobre tratamento e integração de dados no BigQuery.

---

## 📁 Estrutura do Repositório

```text
📁 sql/
├── 01_criacao_dados_brutos.sql
├── 02_criacao_dados_tratados.sql
├── 03_identificacao_nulos.sql
├── 04_validacao_tratamento.sql
├── 05_identificacao_duplicados.sql
├── 06_remocao_duplicados.sql
├── 07_tratamento_categoricos.sql
├── 08_tratamento_numericos.sql
└── 09_join_tabelas.sql

📁 docs/
└── ficha_tecnica.md
```

---

## 📌 Destaques Técnicos

- Separação em camadas (insumos, brutos e tratados)  
- Uso de `GROUP BY` e `HAVING` para identificação de duplicidades  
- Uso de `CASE WHEN` para padronização de variáveis categóricas  
- Uso de `CAST` para compatibilização de tipos de dados  
- Validação de consistência utilizando `MIN` e `MAX`  
- Integração de múltiplas fontes com `JOIN`  
- Validação de schema antes da integração das tabelas  

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

🔗 LinkedIn: www.linkedin.com/in/claudia-torreiro-52b30056  
📧 cgtorreiro@hotmail.com

---
