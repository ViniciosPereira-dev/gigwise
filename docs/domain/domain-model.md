
# Domain Model

## Objetivo

Este documento apresenta a visão geral do domínio do GigWise.

Seu objetivo é definir os principais conceitos do negócio, as entidades do sistema, seus relacionamentos e os limites de responsabilidade de cada uma.

Este modelo serve como base para toda a arquitetura da aplicação e deve orientar a documentação, a implementação e a evolução do projeto.

---

# Domínio

O domínio do GigWise é:

> **Gestão financeira e operacional para motoristas de aplicativos.**

O sistema é responsável por registrar informações da rotina de trabalho do motorista e transformá-las em indicadores que auxiliem na tomada de decisões.

---

# Entidades do domínio

Nesta primeira versão do produto, o domínio é composto pelas seguintes entidades:

| Entidade | Responsabilidade                                         |
| -------- | -------------------------------------------------------- |
| Trip     | Representar uma corrida realizada pelo motorista.        |
| Expense  | Representar uma despesa relacionada ao trabalho.         |
| Goal     | Representar uma meta financeira definida pelo motorista. |

Cada entidade possui identidade própria, ciclo de vida independente e regras de negócio específicas.

---

# Relacionamentos

As entidades se relacionam de forma lógica, mas permanecem desacopladas.

```text
                    Driver
                       │
       ┌───────────────┼───────────────┐
       │                               │
       ▼                               ▼
    Trip                           Expense
       │                               │
       └───────────────┬───────────────┘
                       ▼
                  Dashboard
                       │
                       ▼
                     Goal
```

### Observações

* O Dashboard não armazena dados; apenas consolida informações provenientes das entidades do domínio.
* Goals utilizam indicadores derivados de Trips e Expenses para acompanhar o progresso das metas.
* As entidades permanecem independentes e não possuem dependência direta entre si.

---

# Aggregate Roots

Para manter o domínio simples e desacoplado, cada entidade principal é considerada um Aggregate Root.

* Trip
* Expense
* Goal

Cada Aggregate Root é responsável por proteger suas próprias regras de negócio.

---

# Value Objects (Evolução futura)

Conforme o domínio evoluir, alguns tipos primitivos poderão ser substituídos por Value Objects.

Exemplos:

| Value Object | Finalidade                                               |
| ------------ | -------------------------------------------------------- |
| Money        | Representar valores monetários de forma consistente.     |
| Distance     | Representar distâncias e suas unidades.                  |
| DateRange    | Representar períodos utilizados em filtros e relatórios. |

Esses objetos não fazem parte do MVP, mas foram identificados como possíveis evoluções da modelagem.

---

# Princípios do modelo

O Domain Model do GigWise segue os seguintes princípios:

* Foco nas regras de negócio.
* Independência de tecnologias.
* Baixo acoplamento entre entidades.
* Alta coesão.
* Evolução incremental.
* Linguagem ubíqua entre documentação e código.

---

# Decisões arquiteturais

As seguintes decisões foram tomadas durante a modelagem do domínio:

* O domínio não depende de Flutter, Firebase, Isar ou qualquer outra tecnologia.
* Dashboard é uma projeção de dados e não uma entidade do domínio.
* Cada entidade possui responsabilidade única.
* O modelo será expandido conforme novas funcionalidades forem incorporadas ao produto.
* Evitaremos complexidade desnecessária no MVP, mantendo a possibilidade de evoluir o modelo futuramente.

---

# Evolução do domínio

O modelo apresentado neste documento representa o estado atual do domínio.

Novas entidades poderão ser adicionadas conforme o produto evoluir, como:

* Vehicle
* Platform
* Report
* Notification
* SyncJob

Toda nova entidade deverá ser analisada sob a perspectiva do domínio antes de ser incorporada à arquitetura da aplicação.
