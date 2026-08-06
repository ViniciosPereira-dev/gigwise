
# Glossário do Domínio (Ubiquitous Language)

## Objetivo

Este documento define a **Linguagem Ubíqua (Ubiquitous Language)** do GigWise.

Todos os termos aqui descritos representam os conceitos oficiais do domínio e devem ser utilizados de forma consistente na documentação, no código e na comunicação entre os envolvidos no projeto.

O objetivo é evitar ambiguidades e garantir que todos utilizem o mesmo vocabulário ao discutir regras de negócio e implementação.

---

# Princípios

* Cada conceito possui um único nome oficial.
* O mesmo termo deve ser utilizado na documentação e no código.
* Novos termos devem ser adicionados conforme o domínio evoluir.
* Evitar sinônimos para representar o mesmo conceito.

---

# Glossário

| Termo do Domínio | Nome no Código | Definição                                                                                                                         |
| ---------------- | -------------- | --------------------------------------------------------------------------------------------------------------------------------- |
| **Trip**         | `Trip`         | Representa uma corrida realizada pelo motorista em uma plataforma de transporte. É a principal fonte de receita do sistema.       |
| **Expense**      | `Expense`      | Representa qualquer despesa relacionada à atividade do motorista, como combustível, manutenção ou alimentação durante o trabalho. |
| **Goal**         | `Goal`         | Representa uma meta financeira definida pelo motorista para um determinado período.                                               |
| **Platform**     | `Platform`     | Plataforma em que a corrida foi realizada, como Uber ou 99.                                                                       |
| **Driver**       | `Driver`       | Usuário que utiliza o GigWise para registrar suas corridas, despesas e acompanhar seus indicadores.                               |
| **Revenue**      | `Revenue`      | Receita obtida com uma corrida antes da dedução das despesas operacionais. Inclui o valor da corrida e possíveis gorjetas.        |
| **Net Profit**   | `NetProfit`    | Lucro líquido obtido após descontar todas as despesas relacionadas à atividade do motorista.                                      |
| **Dashboard**    | `Dashboard`    | Tela principal do aplicativo que apresenta indicadores financeiros e operacionais.                                                |

---

# Convenções de nomenclatura

Para manter consistência entre documentação e implementação, adotaremos as seguintes convenções:

* Classes utilizarão nomes em inglês.
* Interfaces, entidades e repositórios seguirão a mesma nomenclatura do domínio.
* A interface do aplicativo poderá utilizar termos em português para facilitar a compreensão do usuário final.

Exemplos:

| Interface     | Código      |
| ------------- | ----------- |
| Corrida       | `Trip`      |
| Despesa       | `Expense`   |
| Meta          | `Goal`      |
| Plataforma    | `Platform`  |
| Lucro Líquido | `NetProfit` |

---

# Evolução do glossário

Este documento deverá ser atualizado sempre que um novo conceito relevante for incorporado ao domínio do GigWise.

Antes de criar uma nova entidade, serviço ou funcionalidade, recomenda-se verificar se o termo já existe neste glossário. Caso não exista, ele deve ser definido aqui antes da implementação.

Dessa forma, garantimos que a linguagem utilizada permaneça consistente durante toda a evolução do projeto.
