
# Expense

## Objetivo

A entidade **Expense** representa uma despesa relacionada à atividade profissional do motorista de aplicativo.

Ela registra todos os gastos que impactam o resultado financeiro da operação, permitindo que o GigWise calcule o lucro líquido, acompanhe custos operacionais e gere indicadores de desempenho.

Assim como a entidade Trip, a Expense faz parte do núcleo do domínio e deve permanecer independente de qualquer tecnologia utilizada pela aplicação.

---

# Responsabilidades

A entidade Expense é responsável por:

* Representar um gasto relacionado à atividade do motorista.
* Manter informações consistentes sobre a despesa.
* Garantir o cumprimento das regras de negócio.
* Servir como base para cálculos financeiros e estatísticas.

A entidade **não** é responsável por persistência, interface do usuário ou comunicação com serviços externos.

---

# Atributos

## Obrigatórios

| Atributo   | Descrição                                |
| ---------- | ---------------------------------------- |
| id         | Identificador único da despesa.          |
| category   | Categoria da despesa.                    |
| amount     | Valor gasto.                             |
| occurredAt | Data e horário em que a despesa ocorreu. |

## Opcionais

| Atributo | Descrição                               |
| -------- | --------------------------------------- |
| notes    | Observações registradas pelo motorista. |

---

# Categorias

Toda despesa deve pertencer a uma categoria.

Categorias previstas para o MVP:

* Fuel
* Maintenance
* OilChange
* Tire
* CarWash
* Insurance
* IPVA
* Financing
* Food
* Other

Novas categorias poderão ser adicionadas conforme o domínio evoluir.

---

# Regras de negócio

Uma Expense válida deve obedecer às seguintes regras:

* O valor da despesa deve ser maior que zero.
* Toda despesa deve possuir uma categoria válida.
* A data da despesa deve representar um momento válido.
* A despesa deve possuir identidade própria.

Essas regras pertencem ao domínio e independem da interface do usuário.

---

# Invariantes

As seguintes condições nunca podem ser violadas:

* Toda Expense possui um identificador único.
* Toda Expense pertence a exatamente uma categoria.
* Toda Expense representa um único evento financeiro.
* O valor da despesa nunca pode ser negativo.

---

# Comportamentos

A entidade poderá disponibilizar comportamentos relacionados ao seu próprio domínio, como:

* Verificar a categoria da despesa.
* Validar a consistência da entidade.
* Indicar se a despesa pertence a uma categoria específica.

Esses comportamentos fazem parte do domínio e não dependem de frameworks ou bibliotecas externas.

---

# Relacionamentos

A entidade Expense é independente das demais entidades do domínio.

Seus dados poderão ser utilizados por outros módulos da aplicação, como:

* Dashboard.
* Goal.
* Relatórios.
* Estatísticas.

Esses módulos apenas consultam as informações da Expense e não alteram suas regras de negócio.

---

# Evolução futura

A entidade poderá evoluir para suportar funcionalidades como:

* Categorias personalizadas.
* Despesas recorrentes.
* Associação da despesa a um veículo.
* Anexos (como comprovantes e notas fiscais).
* Importação automática de despesas.

Essas evoluções deverão preservar as regras de negócio estabelecidas neste documento.

---

# Fora do escopo

A entidade Expense não deve:

* Persistir dados.
* Conhecer Flutter.
* Conhecer Isar.
* Conhecer Firebase.
* Conhecer Riverpod.
* Realizar navegação.
* Exibir mensagens ao usuário.
* Consumir APIs externas.

Essas responsabilidades pertencem às demais camadas da arquitetura.
