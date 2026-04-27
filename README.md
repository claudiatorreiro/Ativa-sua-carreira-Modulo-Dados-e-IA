# 🎧 Análise de Dados – Sucesso de Músicas no Spotify

## 📌 Sobre o Projeto

Este projeto foi desenvolvido como parte do **módulo de Dados e Inteligência Artificial** do programa **Ativa sua Carreira**, da Laboratória.

O objetivo é analisar um conjunto de dados de músicas para identificar possíveis fatores que indicam o sucesso de uma música no Spotify, medido pela quantidade de reproduções (*streams*).

---

## 🎯 Objetivo da Análise

Investigar quais variáveis podem influenciar o sucesso de uma música, como:

* Presença em playlists
* Aparição em charts
* Gênero musical
* País de origem
* Plataformas concorrentes

---

## 🛠️ Ferramentas Utilizadas

* **Google BigQuery** – processamento e análise de dados com SQL
* **SQL** – consultas, limpeza e transformação dos dados
* **GitHub** – versionamento e documentação do projeto

---

## 📊 Estrutura dos Dados

O projeto foi organizado em três camadas, seguindo boas práticas de análise de dados:

* **Insumos**: dados originais importados diretamente das fontes, sem alterações.
* **Dados brutos**: dados organizados e padronizados a partir dos insumos.
* **Dados tratados**: dados preparados para análise, com aplicação de tratamentos (como substituição de valores nulos).

Essa separação permite maior controle, rastreabilidade e segurança no processo de análise.

### 🔄 Fluxo dos dados

Insumos → Dados Brutos → Dados Tratados → Análise

---

## 🧪 Etapas do Projeto

### 1. Preparação dos dados

* Criação do projeto e dataset no BigQuery
* Importação das tabelas

### 2. Identificação de valores nulos

* Uso de `COUNT`, `COUNTIF` e `IS NULL`
* Análise da presença de dados ausentes

### 3. Tratamento de dados

* Substituição de valores nulos na variável `in_shazam_charts` por `0`
* Manutenção de nulos em variáveis com baixo impacto na análise

### 4. Organização dos dados

* Separação entre dados brutos e dados tratados
* Padronização de nomes e estrutura

### 5. Validação

* Verificação pós-tratamento para garantir consistência dos dados

---

## 📂 Estrutura do Repositório

```text
.
├── README.md
└── sql/
    ├── 01_identificacao_nulos.sql
    ├── 02_criacao_dados_brutos.sql
    ├── 03_criacao_dados_tratados.sql
    └── 04_validacao_tratamento.sql
```

---

## 🧠 Principais Decisões

* Separação em camadas (insumos, bruto e tratado) para garantir rastreabilidade
* Tratamento de valores nulos apenas quando necessário
* Organização das consultas SQL por etapas do projeto

---

## 🚀 Próximos Passos

* Identificação de dados duplicados
* Análise exploratória dos dados (EDA)
* Cruzamento das tabelas (JOIN)
* Criação de visualizações e insights

---

## 👩‍💻 Sobre mim

Profissional com experiência em gestão pública e Direito, em transição para a área de tecnologia e dados, integrando análise, raciocínio lógico e tomada de decisão baseada em dados.

---

## 🤝 Contato

Se você também está em transição para a área de dados ou tecnologia, vamos trocar experiências:

🔗 [LinkedIn](www.linkedin.com/in/claudia-torreiro-52b30056)
📧 cgtorreiro@hotmail.com

---
