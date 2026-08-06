
# Trip

## Objetivo

A entidade **Trip** representa uma corrida realizada por um motorista de aplicativo.

Ela é a principal fonte de receita do GigWise e fornece as informações necessárias para cálculos financeiros, indicadores de desempenho e análises operacionais.

A Trip pertence ao núcleo do domínio e deve permanecer independente de qualquer tecnologia utilizada pela aplicação.

---

# Responsabilidades

A entidade Trip é responsável por:

* Representar uma corrida realizada.
* Manter informações consistentes sobre a viagem.
* Garantir o cumprimento das regras de negócio.
* Disponibilizar dados para cálculo de indicadores.
* Servir como base para funcionalidades futuras, como importação por OCR e sincronização.

A entidade **não** é responsável por persistência, interface do usuário ou comunicação com serviços externos.

---

# Atributos

## Obrigatórios

| Atributo   | Descrição                                                  |
| ---------- | ---------------------------------------------------------- |
| id         | Identificador único da corrida.                            |
| platform   | Plataforma em que a corrida foi realizada.                 |
| amount     | Valor recebido pela corrida.                               |
| distanceKm | Distância percorrida em quilômetros.                       |
| startedAt  | Data e horário de início da corrida.                       |
| finishedAt | Data e horário de término da corrida.                      |
| source     | Origem do registro da corrida (Manual, OCR ou Importação). |

## Opcionais

| Atributo    | Descrição                               |
| ----------- | --------------------------------------- |
| tip         | Valor recebido em gorjetas.             |
| toll        | Valor de pedágio pago pelo motorista.   |
| origin      | Local de origem da corrida.             |
| destination | Local de destino da corrida.            |
| notes       | Observações registradas pelo motorista. |

---

# Propriedades derivadas

As informações abaixo são calculadas a partir dos atributos persistidos e não devem ser armazenadas diretamente.

| Propriedade  | Descrição                                 |
| ------------ | ----------------------------------------- |
| duration     | Tempo total da corrida.                   |
| totalRevenue | Soma do valor da corrida com as gorjetas. |

---

# Regras de negócio

Uma Trip válida deve obedecer às seguintes regras:

* O valor da corrida deve ser maior que zero.
* A distância não pode ser negativa.
* A data e hora de término devem ser posteriores ao início da corrida.
* A plataforma é obrigatória.
* O valor da gorjeta não pode ser negativo.
* O valor do pedágio não pode ser negativo.
* A origem do registro deve ser válida.
* A data da corrida não pode representar um momento claramente inválido.

Essas regras pertencem ao domínio e não à interface do usuário.

---

# Invariantes

As seguintes condições nunca podem ser violadas:

* Toda Trip possui identidade própria.
* Toda Trip pertence a uma plataforma.
* Toda Trip representa exatamente uma corrida.
* Toda Trip possui um período válido de execução.
* A receita da corrida nunca pode ser negativa.

---

# Comportamentos

A entidade poderá disponibilizar comportamentos relacionados ao próprio domínio, como:

* Calcular a duração da corrida.
* Calcular a receita total.
* Verificar se existe gorjeta.
* Verificar se existe pedágio.
* Validar a consistência da entidade.

Esses comportamentos fazem parte do domínio e não dependem de Flutter ou de qualquer biblioteca externa.

---

# Relacionamentos

A entidade Trip é independente das demais entidades do domínio.

Seus dados poderão ser utilizados por outros módulos da aplicação, como:

* Dashboard.
* Goal.
* Relatórios.
* Estatísticas.

Esses módulos apenas consultam as informações da Trip e não alteram suas regras de negócio.

---

# Evolução futura

A entidade poderá evoluir para suportar novas funcionalidades, como:

* Importação automática por OCR.
* Sincronização em nuvem.
* Associação a veículos.
* Classificação por categorias.
* Integração com novas plataformas.

A evolução deverá preservar as regras de negócio já estabelecidas.

---

# Fora do escopo

A entidade Trip não deve:

* Persistir dados.
* Conhecer Flutter.
* Conhecer Isar.
* Conhecer Firebase.
* Conhecer Riverpod.
* Realizar navegação.
* Exibir mensagens ao usuário.
* Acessar APIs externas.

Essas responsabilidades pertencem a outras camadas da arquitetura.
