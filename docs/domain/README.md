# Domain

## Objetivo

Esta pasta contém a documentação do **Domínio** do GigWise.

O domínio representa o coração da aplicação: as entidades, conceitos e regras de negócio que definem como o sistema funciona do ponto de vista do problema que ele resolve.

No GigWise, o domínio não depende de Flutter, Firebase, Isar ou qualquer outra tecnologia. Seu foco é modelar corretamente a realidade de um motorista de aplicativos e garantir que as regras de negócio permaneçam consistentes ao longo da evolução do produto.

---

# O que é o domínio?

O domínio descreve os conceitos fundamentais do negócio.

Em vez de pensar em telas, banco de dados ou APIs, o domínio responde perguntas como:

* O que é uma corrida?
* O que é uma despesa?
* Como calcular o lucro líquido?
* O que torna uma meta válida?
* Quais informações são obrigatórias para registrar uma corrida?

Essas respostas servem como base para toda a arquitetura da aplicação.

---

# Princípios

O domínio do GigWise segue os seguintes princípios:

* Independência de tecnologias.
* Foco nas regras de negócio.
* Linguagem ubíqua entre documentação e código.
* Responsabilidades bem definidas.
* Modelagem orientada ao domínio.
* Facilidade de evolução e manutenção.
* Testabilidade.

---

# Estrutura

Esta pasta está organizada da seguinte forma:

```text
domain/
├── README.md
├── glossary.md
├── domain-model.md
├── trip.md
├── expense.md
└── goal.md
```

Cada documento possui uma responsabilidade específica:

| Documento       | Responsabilidade                                               |
| --------------- | -------------------------------------------------------------- |
| README.md       | Apresentar o domínio e sua organização.                        |
| glossary.md     | Definir a linguagem oficial do projeto (Ubiquitous Language).  |
| domain-model.md | Apresentar a visão geral das entidades e seus relacionamentos. |
| trip.md         | Documentar a entidade responsável pelas corridas.              |
| expense.md      | Documentar a entidade responsável pelas despesas.              |
| goal.md         | Documentar a entidade responsável pelas metas.                 |

---

# Como utilizar esta documentação

Toda alteração que envolva regras de negócio deve começar pela documentação do domínio.

O fluxo recomendado para evolução do projeto é:

1. Identificar uma necessidade do produto.
2. Atualizar ou criar a documentação do domínio.
3. Revisar impactos em outras entidades.
4. Atualizar os épicos e regras funcionais, quando necessário.
5. Implementar as alterações no código.
6. Criar ou atualizar os testes.

Essa abordagem reduz retrabalho e mantém o software consistente ao longo do tempo.

---

# Relação com a Clean Architecture

O domínio ocupa a camada mais interna da arquitetura.

Ele não deve depender de frameworks, banco de dados, serviços externos ou detalhes de implementação.

As demais camadas da aplicação existem para servir ao domínio, e não o contrário.

Essa separação permite que as regras de negócio permaneçam estáveis mesmo quando tecnologias ou bibliotecas forem substituídas no futuro.

---

# Objetivo desta documentação

A documentação desta pasta existe para garantir que todas as decisões relacionadas ao negócio sejam registradas antes da implementação.

Dessa forma, o código passa a ser uma representação do domínio já definido, reduzindo ambiguidades e facilitando a manutenção do projeto ao longo de sua evolução.
