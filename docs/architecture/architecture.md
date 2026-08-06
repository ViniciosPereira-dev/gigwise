# Arquitetura

## Objetivo

O GigWise utiliza uma arquitetura inspirada em **Clean Architecture**, organizada por funcionalidades (**Feature First**).

O objetivo é manter o projeto escalável, de fácil manutenção e com baixo acoplamento entre as camadas da aplicação.

Esta arquitetura foi escolhida para aproximar o projeto das práticas utilizadas no mercado, sem adicionar complexidade desnecessária ao MVP.

---

# Stack Tecnológica

| Camada                  | Tecnologia                      |
| ----------------------- | ------------------------------- |
| Mobile                  | Flutter                         |
| Linguagem               | Dart                            |
| Gerenciamento de Estado | Riverpod                        |
| Banco Local             | Isar                            |
| Backend                 | Firebase                        |
| Autenticação            | Firebase Authentication         |
| Armazenamento           | Cloud Firestore / Cloud Storage |
| Versionamento           | Git + GitHub                    |
| Testes                  | flutter_test                    |
| CI/CD                   | GitHub Actions                  |

---

# Princípios

A arquitetura do GigWise segue os seguintes princípios:

* Feature First.
* Clean Architecture (adaptada ao projeto).
* SOLID.
* Repository Pattern.
* Dependency Injection com Riverpod.
* Código limpo e legível.
* Evolução incremental.

---

# Estrutura de Pastas

```text
lib/
│
├── app/
│   ├── app.dart
│   ├── router/
│   └── theme/
│
├── core/
│   ├── constants/
│   ├── errors/
│   ├── extensions/
│   ├── utils/
│   └── services/
│
├── features/
│   ├── dashboard/
│   ├── trips/
│   ├── expenses/
│   └── goals/
│
└── shared/
    ├── widgets/
    └── providers/
```

Cada funcionalidade será independente e poderá conter suas próprias camadas (`presentation`, `domain` e `data`) conforme a necessidade.

---

# Fluxo de Dependências

```text
Presentation
      │
      ▼
   Domain
      ▲
      │
     Data
```

Regras:

* A camada **Domain** não depende de nenhuma outra camada.
* A camada **Data** implementa contratos definidos pelo Domain.
* A camada **Presentation** consome casos de uso e entidades do Domain.

---

# Convenções

## Organização

* Arquitetura Feature First.
* Um módulo para cada funcionalidade.
* Separação clara entre domínio, dados e apresentação.

## Gerenciamento de Estado

* Riverpod será utilizado para gerenciamento de estado e injeção de dependências.

## Persistência

* Isar será utilizado para armazenamento local.
* Firebase será utilizado para autenticação e sincronização futura.

## Qualidade

* Flutter Lints habilitado.
* Conventional Commits.
* Pull Requests para funcionalidades relevantes.
* Testes para regras de negócio e casos de uso.

---

# Evolução da Arquitetura

A arquitetura foi planejada para crescer junto com o produto.

Novas funcionalidades deverão seguir os mesmos princípios estabelecidos neste documento, mantendo consistência, baixo acoplamento e facilidade de manutenção.
