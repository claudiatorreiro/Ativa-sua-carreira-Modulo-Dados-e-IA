# 🎵 Projeto de Análise de Dados — Spotify e Plataformas Concorrentes

## 📌 Sobre o Projeto

Este projeto foi desenvolvido durante o módulo bônus de **Dados e Inteligência Artificial** do programa **Ativa sua Carreira — Laboratória**.

O objetivo foi aplicar técnicas de tratamento, validação e integração de dados utilizando SQL no BigQuery, simulando um fluxo real de preparação de dados para análise.

---

# 🎯 Objetivos do Projeto

O projeto teve como foco:

- Criar datasets estruturados no BigQuery
- Identificar e tratar valores nulos
- Identificar e remover registros duplicados
- Tratar inconsistências categóricas
- Padronizar variáveis numéricas
- Integrar múltiplas tabelas utilizando JOIN
- Preparar uma base consolidada para análise exploratória

---

# 🗂️ Estrutura do Projeto

```text
Insumos_Rota_B
│
├── musicas_spotify
└── musicas_concorrentes

dados_brutos
│
├── musicas_spotify
└── musicas_concorrentes

dados_tratados
│
├── musicas_spotify_tratada
├── musicas_concorrentes_tratada
├── musicas_spotify_sem_duplicados
├── musicas_spotify_categorico_tratado
├── musicas_spotify_final
└── musicas_join_final
```

---

# ⚙️ Tecnologias Utilizadas

- Google BigQuery
- SQL
- GitHub

---

# 📂 Estrutura SQL

| Arquivo | Objetivo |
|---|---|
| 01_criacao_dados_brutos.sql | Criação das tabelas brutas |
| 02_criacao_dados_tratados.sql | Criação das tabelas tratadas |
| 03_identificacao_nulos.sql | Identificação de valores nulos |
| 04_validacao_tratamento.sql | Validação dos tratamentos |
| 05_identificacao_duplicados.sql | Identificação de registros duplicados |
| 06_remocao_duplicados.sql | Remoção de duplicados |
| 07_tratamento_categoricos.sql | Tratamento de variáveis categóricas |
| 08_tratamento_numericos.sql | Tratamento de variáveis numéricas |
| 09_join_tabelas.sql | Integração das tabelas |

---

# ✅ Validação de Integridade

## Spotify — Base Bruta

| Métrica | Resultado |
|---|---|
| Total de linhas | 843 |
| IDs preenchidos | 843 |
| IDs únicos | 839 |
| Possíveis duplicados | 4 |

---

## Spotify — Base Tratada Sem Duplicados

| Métrica | Resultado |
|---|---|
| Total de linhas | 839 |
| IDs preenchidos | 839 |
| IDs únicos | 839 |
| Possíveis duplicados | 0 |

---

## Concorrentes — Base Bruta

| Métrica | Resultado |
|---|---|
| Total de linhas | 953 |
| IDs preenchidos | 953 |
| IDs únicos | 953 |
| Possíveis duplicados | 0 |

---

## Concorrentes — Base Tratada

| Métrica | Resultado |
|---|---|
| Total de linhas | 953 |
| IDs preenchidos | 953 |
| IDs únicos | 953 |
| Possíveis duplicados | 0 |

---

# 🔎 Tratamento de Duplicidades

Foi identificada duplicidade na tabela Spotify utilizando a chave `track_id`.

A remoção foi realizada utilizando:

```sql
ROW_NUMBER() OVER (
PARTITION BY track_id
ORDER BY streams DESC
)
```

A estratégia adotada manteve o registro com maior quantidade de streams.

---

# 🧹 Tratamento Categórico

Foi realizado tratamento de inconsistências na variável `main_music_genre`.

Exemplos:

- valores nulos → `Nao informado`
- padronização de textos
- ajuste de categorias inconsistentes

A música `Style` foi mantida na base e tratada como gênero `Pop`, preservando o registro em vez de removê-lo.

---

# 🔢 Tratamento Numérico

Foi utilizado:

```sql
SAFE_CAST()
```

para padronização de tipos numéricos e prevenção de erros durante a conversão.

---

# 🔗 Integração das Tabelas

A integração entre Spotify e plataformas concorrentes foi realizada utilizando:

```sql
LEFT JOIN
```

com compatibilização de tipos:

```sql
CAST(s.track_id AS STRING)
```

---

# 📊 Resultado Final

O projeto resultou em uma tabela consolidada pronta para:

- análise exploratória
- criação de gráficos
- identificação de padrões
- análise comparativa entre plataformas

---

## 🤝 Contato

Se você também está em transição para a área de dados ou tecnologia, vamos trocar experiências:

🔗 LinkedIn: www.linkedin.com/in/claudia-torreiro-52b30056  
📧 cgtorreiro@hotmail.com

---

# 👩‍💻 Autora

Claudia Torreiro

Projeto desenvolvido no programa:

**Ativa sua Carreira — Laboratória**

---
