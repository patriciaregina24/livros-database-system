/*
IMPORTANT NOTICE: 
(PT-BR abaixo)

- This file uses stored procedures to insert, update, and delete data while maintaining data integrity 
and avoiding duplicates.

- Use this file after the initial population of the database using insercao_dados.sql.

Procedures used:
 - AddLivro: Safely inserts a book if it does not already exist.
 - UpdateOrDeleteLivro: Updates or deletes a book record based on the specified action.

- To update or delete an already inserted book (whether from the initial data or later), call 
UpdateOrDeleteLivro with action = 'update' or 'delete'.

-------------------------------------------------------------------------------------------------------

ATENÇÃO IMPORTANTE:

- Este arquivo usa procedures para inserir, atualizar e excluir dados garantindo a integridade do banco e 
evitando duplicações.

- Utilize este arquivo após a população inicial do banco com insercao_dados.sql.

Procedures utilizadas:
 - AddLivro: Insere um livro com segurança, caso ainda não exista.
 - UpdateOrDeleteLivro: Atualiza ou exclui um livro com base na ação escolhida.

- Para atualizar ou excluir um livro já inserido (seja da inserção inicial ou posterior), chame a procedure 
UpdateOrDeleteLivro com action = 'update' ou 'delete'.
*/

-- Example procedure usage:
CALL AddLivro('Dom Casmurro', 'A história de Bentinho e Capitu, uma trama envolvente que aborda ciúmes e desconfianças', 1899, 1);
CALL AddLivro('Game of Thrones', 'A luta pelo trono de ferro entre famílias nobres em um mundo medieval e mágico', 1996, 2);
CALL AddLivro('O Alquimista', 'A história de um jovem pastor que parte em busca de um tesouro', 1988, 3);

-- To update a book:
CALL UpdateOrDeleteLivro(1, 'Dom Casmurro - Edição Revisada', 'Nova descrição atualizada', 1900, 1, 'update');

-- To delete a book:
CALL UpdateOrDeleteLivro(2, NULL, NULL, NULL, NULL, 'delete');