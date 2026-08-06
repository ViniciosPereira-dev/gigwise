
# Goal

## Objetivo

A entidade **Goal** representa uma meta financeira definida pelo motorista para um período específico.

Seu propósito é permitir o acompanhamento da evolução dos ganhos e fornecer indicadores que auxiliem o motorista a alcançar seus objetivos financeiros.

A Goal faz parte do núcleo do domínio e deve permanecer independente de qualquer tecnologia utilizada pela aplicação.

---

# Responsabilidades

A entidade Goal é responsável por:

* Representar uma meta financeira.
* Definir um valor-alvo para um período.
* Garantir a consistência das regras de negócio relacionadas às metas.
* Servir como referência para o acompanhamento do progresso.

A entidade **não** calcula resultados financeiros nem consulta corridas ou despesas.

---

# Atributos

## Obrigatórios

| Atributo     | Descrição                                   |
| ------------ | ------------------------------------------- |
| id           | Identificador único da meta.                |
| targetAmount | Valor financeiro que se deseja atingir.     |
| period       | Período da meta (Daily, Weekly ou Monthly). |
| createdAt    | Data de criação da meta.                    |

## Opcionais

| Atributo    | Descrição                             |
| ----------- | ------------------------------------- |
| description | Descrição ou observação sobre a meta. |

---

# Períodos suportados

No MVP, os seguintes períodos serão suportados:

* Daily
* Weekly
* Monthly

O modelo permite adicionar novos períodos futuramente sem alterar a estrutura da entidade.

---

# Regras de negócio

Uma Goal válida deve obedecer às seguintes regras:

* O valor da meta deve ser maior que zero.
* Toda meta deve possuir um período válido.
* Toda meta deve possuir identidade própria.
* A data de criação deve representar um momento válido.

Essas regras pertencem ao domínio e independem da interface do usuário.

---

# Invariantes

As seguintes condições nunca podem ser violadas:

* Toda Goal possui um identificador único.
* Toda Goal representa exatamente um objetivo financeiro.
* Toda Goal possui um período definido.
* O valor-alvo nunca pode ser negativo.

---

# Comportamentos

A entidade poderá disponibilizar comportamentos relacionados ao seu próprio domínio, como:

* Validar a consistência da meta.
* Verificar o tipo de período.
* Atualizar seu valor-alvo respeitando as regras de negócio.

A entidade não calcula progresso ou percentual de conclusão.

---

# Relacionamentos

A entidade Goal é independente das demais entidades do domínio.

Seu progresso será calculado futuramente a partir das informações de outras entidades, como Trip e Expense, por meio de casos de uso ou serviços de domínio.

---

# Evolução futura

A entidade poderá evoluir para suportar funcionalidades como:

* Metas anuais.
* Metas personalizadas por período.
* Metas específicas por plataforma.
* Metas de lucro líquido.
* Metas de quantidade de corridas.
* Metas de horas trabalhadas.
* Metas por veículo.

Essas evoluções deverão preservar as regras de negócio estabelecidas neste documento.

---

# Fora do escopo

A entidade Goal não deve:

* Persistir dados.
* Conhecer Flutter.
* Conhecer Isar.
* Conhecer Firebase.
* Conhecer Riverpod.
* Realizar navegação.
* Exibir mensagens ao usuário.
* Consultar Trips ou Expenses diretamente.

Essas responsabilidades pertencem às demais camadas da arquitetura.
