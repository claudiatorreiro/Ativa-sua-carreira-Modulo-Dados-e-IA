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
3. Tratamento dos dados (valores nulos)
4. Identificação de registros duplicados
5. Validação dos dados tratados

---

## 🔍 Principais Análises Realizadas

- Identificação de valores nulos
- Identificação de registros duplicados
- Análise de consistência dos dados
- Validação após tratamento

---

## 🧩 Decisões de Tratamento

- Valores nulos na coluna `in_shazam_charts` foram substituídos por 0, pois indicam ausência de presença nas paradas musicais.
- A tabela de músicas do Spotify foi mantida sem alterações nesta etapa, pois não foram identificados valores nulos relevantes para tratamento imediato.
  
---

## 📁 Estrutura do Repositório

```
📁 sql/
├── 01_identificacao_nulos.sql
├── 02_criacao_dados_brutos.sql
├── 03_tratamento_spotify.sql
└── 04_validacoes.sql

📁 docs/
└── ficha_tecnica.md
```

---

## 📌 Destaques Técnicos

- Separação clara entre dados brutos e tratados
- Uso de `GROUP BY` e `HAVING` para identificação de duplicidades
- Validação de consistência após tratamento

---

## 📄 Documentação Completa

A documentação detalhada do projeto está disponível em:

👉 `docs/ficha_tecnica.md`

---

## 🚀 Próximos Passos

- Análise exploratória dos dados
- Criação de visualizações
- Geração de insights de negócio

---

## 🤝 Contato

Se você também está em transição para a área de dados ou tecnologia, vamos trocar experiências:

🔗 [LinkedIn](www.linkedin.com/in/claudia-torreiro-52b30056)
📧 cgtorreiro@hotmail.com

---
