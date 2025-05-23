# 📚 Sistema de Registro de Livros
Modelagem e Implementação de Banco de Dados Relacional

📘 This project is also available in English: [README-en.md](./README-en.md)

Este projeto consiste em um modelo de banco de dados para o gerenciamento de livros, autores, editoras e gêneros literários, com foco em eficiência e segurança na gestão de dados.

## 🛠️ Tecnologias
- **SQL**: Modelagem e manipulação dos dados.
- **MySQL Workbench**: Modelagem lógica e física do banco de dados.
- **MySQL (InnoDB)**: Sistema de gerenciamento de banco de dados utilizado na implementação, com suporte a integridade referencial.
- **BrModelo**: Modelo conceitual (DER).

## Análise de Requisitos
A solução foi projetada com base em uma análise detalhada de requisitos, visando a criação de um sistema eficiente e bem estruturado.
📄 Documento completo: [requisitos.pdf](./requisitos.pdf)

## Normalização
O banco segue as boas práticas de normalização (1FN, 2FN, 3FN), garantindo a eliminação de redundâncias e a consistência dos dados.

## 🧱 Estrutura do Banco

- **Banco de dados**: `registro_livros`
- **Tabelas**:
  - `editora` 
  - `livro` 
  - `genero` 
  - `autor` 
  - `autor_livro` 
  - `livro_genero`
 
🔍 Consulte o [dicionário de dados completo (PDF)](./dicionario_de_dados.pdf)

## Modelagem
Inclui modelagem conceitual, lógica e física para garantir a integridade e a segurança dos dados.

- **Modelo Conceitual**  
  ![Modelo Conceitual](./imagens/modelo_conceitual.png)

- **Modelo Lógico**  
  ![Modelo Lógico](./imagens/modelo_logico.png)

## 🚀 Como Usar

1. Abra o MySQL Workbench.
2. Execute o script `modelo_fisico.sql` incluído neste repositório.
3. Pronto! O banco estará criado.

## 🧠 Observações

- É possível cadastrar um autor, gênero ou editora sem relacioná-los de imediato com livros.
- Os relacionamentos N:N são resolvidos por tabelas associativas (`autor_livro` e `livro_genero`).
- A integridade referencial garante consistência entre os dados.

## 💌 Contato

Este projeto foi criado com fins de aprendizado.  
📬 Entre em contato para conversar sobre dados, projetos ou colaborações!

📧 E-mail: [patiregina1350@gmail.com](mailto:patiregina1350@gmail.com)
