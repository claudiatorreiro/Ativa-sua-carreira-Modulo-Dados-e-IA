# 📊 Ficha Técnica — Projeto de Dados Spotify

---

# 📌 Contexto

Projeto desenvolvido no módulo bônus de Dados e Inteligência Artificial da Laboratória, utilizando SQL no BigQuery para tratamento e preparação de dados musicais.

---

# 🎯 Objetivo Técnico

Preparar e consolidar bases de dados do Spotify e plataformas concorrentes para análise exploratória.

---

# 🗂️ Bases Utilizadas

## Spotify

Tabela original:

```text
Insumos_Rota_B.musicas_spotify
```

## Concorrentes

Tabela original:

```text
Insumos_Rota_B.musicas_concorrentes
```

---

# 🏗️ Arquitetura do Projeto

```text
INSUMOS
↓
DADOS BRUTOS
↓
DADOS TRATADOS
↓
BASE FINAL
↓
JOIN FINAL
```

---

# ⚙️ Etapas Executadas

## 1. Criação das tabelas brutas

Objetivo:
- preservar os dados originais
- evitar alterações na fonte principal

---

## 2. Identificação de valores nulos

Funções utilizadas:

```sql
COUNTIF()
IS NULL
```

Validações realizadas:
- track_id
- track_name
- artists_name
- main_music_genre
- main_country
- streams
- in_shazam_charts

---

## 3. Tratamento de valores nulos

Tratamento aplicado na tabela de concorrentes:

```sql
IFNULL(in_shazam_charts, 0)
```

---

## 4. Identificação de duplicidades

Estratégia:
- validação da chave `track_id`
- contagem de duplicidades

Funções utilizadas:

```sql
COUNT(*)
GROUP BY
HAVING
```

---

## 5. Remoção de duplicidades

Método aplicado:

```sql
ROW_NUMBER() OVER (
PARTITION BY track_id
ORDER BY streams DESC
)
```

Critério:
- manter o registro com maior quantidade de streams

Resultado:
- Base original Spotify: 843 registros
- Base final sem duplicados: 839 registros

---

# ✅ Validação de Integridade

## Spotify — Base Final

| Métrica | Resultado |
|---|---|
| Total de linhas | 839 |
| IDs únicos | 839 |
| Duplicidades | 0 |

---

## Concorrentes — Base Final

| Métrica | Resultado |
|---|---|
| Total de linhas | 953 |
| IDs únicos | 953 |
| Duplicidades | 0 |

---

# 🧹 Tratamento Categórico

Padronização aplicada em:

```text
main_music_genre
```

Tratamentos realizados:
- valores nulos → `Nao informado`
- remoção de espaços
- padronização textual
- correção de categorias inconsistentes

Tratamento específico:
- música `Style` classificada como `Pop`

---

# 🔢 Tratamento Numérico

Função utilizada:

```sql
SAFE_CAST()
```

Objetivo:
- conversão segura de tipos numéricos
- prevenção de erros de conversão

---

# 🔗 Integração das Bases

Tipo de integração:

```sql
LEFT JOIN
```

Chave utilizada:

```sql
track_id
```

Compatibilização de tipos:

```sql
CAST(s.track_id AS STRING)
```

---

# 📦 Tabela Final

Tabela consolidada:

```text
dados_tratados.musicas_join_final
```

Base preparada para:
- análise exploratória
- visualizações
- correlações
- perguntas de negócio

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

# 👩‍💻 Responsável

Claudia Torreiro

Projeto desenvolvido durante o programa:

**Ativa sua Carreira — Laboratória**

---
