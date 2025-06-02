/*
 Procedure: AddLivro
 PT-BR abaixo)
 
 Purpose: Insert a new book into the 'livro' table while ensuring no duplicate title and verifying that the
 publisher exists in the database.
 
 Behavior:
   - Checks if the publisher exists before inserting.
   - Checks if a book with the same title already exists to avoid duplicates.
   - In case of error, returns specific messages to help with diagnosis.
 
 Parameters:
   - p_titulo: title of the book to insert
   - p_descricao: description of the book
   - p_ano_publicacao: publication year of the book
   - p_id_editora: ID of the publisher associated with the book
 
 --------------------------------------------------------------------------------------
 Procedure: AddLivro
 
 Propósito: Inserir um novo livro na tabela 'livro' garantindo que não haja duplicação de título e que a 
 editora exista no banco de dados.
 
 Comportamento:
   - Verifica se a editora existe antes de inserir.
   - Verifica se já existe um livro com o mesmo título para evitar duplicatas.
   - Em caso de erro, retorna mensagens específicas para facilitar o diagnóstico.
 
 Parâmetros:
   - p_titulo: título do livro a ser inserido
   - p_descricao: descrição do livro
   - p_ano_publicacao: ano de publicação do livro
   - p_id_editora: identificador da editora associada ao livro
 */

DELIMITER $$

CREATE PROCEDURE AddLivro(
    IN p_titulo VARCHAR(100),
    IN p_descricao VARCHAR(1000),
    IN p_ano_publicacao INT,
    IN p_id_editora INT
)
BEGIN
    DECLARE editora_exists INT DEFAULT 0;
    DECLARE livro_exists INT DEFAULT 0;

    -- Verifies if the publisher exists | Verifica se editora existe
    SELECT COUNT(*) INTO editora_exists FROM editora WHERE id_editora = p_id_editora;

    IF editora_exists = 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Editora não existe.';
    ELSE
        -- Verifies if book with this title already exists | Verifica se livro com esse título já existe
        SELECT COUNT(*) INTO livro_exists FROM livro WHERE titulo = p_titulo;

        IF livro_exists > 0 THEN
            SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Livro com esse título já existe.';
        ELSE
            -- Inserts the book | Insere o livro
            INSERT INTO livro (titulo, descricao, ano_publicacao, id_editora)
            VALUES (p_titulo, p_descricao, p_ano_publicacao, p_id_editora);
        END IF;
    END IF;
END $$

DELIMITER ;

/*
 Procedure: UpdateOrDeleteLivro
 (PT-BR abaixo)
 
 Purpose: Update or delete an existing book from the database.
 
 This procedure checks if the book exists by the given ID.
  - If the action is 'update', it updates the book's data (title, description, publication year, and publisher),
  also validating if the given publisher exists.
  - If the action is 'delete', it removes the book from the database.
  - If the book does not exist or the action is invalid, an error is raised.
 
 Parameters:
    p_id_livro: Book's ID to update or delete.
    p_titulo: New book title (only used for updates).
    p_descricao: New book description (only used for updates).
    p_ano_publicacao: New publication year (only used for updates).
    p_id_editora: Publisher ID (only used for updates).
    p_acao: 'update' to update or 'delete' to delete.
 
 Example usage:
    CALL UpdateOrDeleteLivro(3, 'New Title', 'New description', 2020, 2, 'update');
    CALL UpdateOrDeleteLivro(5, NULL, NULL, NULL, NULL, 'delete');
 
 ------------------------------------------------------------------------------------------------------

 Procedure: UpdateOrDeleteLivro
 
 Propósito: Atualizar ou excluir um livro existente do banco de dados.
 
 Esta procedure verifica se o livro existe pelo ID informado.
  - Se a ação for 'update', atualiza os dados do livro (título, descrição, ano de publicação e editora), 
  validando também se a editora informada existe.
  - Se a ação for 'delete', exclui o livro do banco de dados.
  - Caso o livro não exista ou a ação seja inválida, um erro é gerado.
 
 Parâmetros:
    p_id_livro: ID do livro a ser atualizado ou excluído.
    p_titulo: Novo título do livro (usado apenas na atualização).
    p_descricao: Nova descrição do livro (usado apenas na atualização).
    p_ano_publicacao: Novo ano de publicação (usado apenas na atualização).
    p_id_editora: ID da editora (usado apenas na atualização).
    p_acao: 'update' para atualizar ou 'delete' para excluir.
 
 Exemplo de uso:
    CALL UpdateOrDeleteLivro(3, 'Novo Título', 'Nova descrição', 2020, 2, 'update');
    CALL UpdateOrDeleteLivro(5, NULL, NULL, NULL, NULL, 'delete');
 */

DELIMITER $$

CREATE PROCEDURE UpdateOrDeleteLivro(
    IN p_id_livro INT,
    IN p_titulo VARCHAR(100),
    IN p_descricao VARCHAR(1000),
    IN p_ano_publicacao INT,
    IN p_id_editora INT,
    IN p_acao VARCHAR(10) -- 'update' para modificar, 'delete' para excluir
)
BEGIN
    DECLARE livro_exists INT DEFAULT 0;
    DECLARE editora_exists INT DEFAULT 0;

    -- Verifies if the book exists | Verifica se o livro existe
    SELECT COUNT(*) INTO livro_exists FROM livro WHERE id_livro = p_id_livro;

    IF livro_exists = 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Livro não encontrado.';
    ELSE
        -- If the action is "delete", it deletes the book | Se a ação for delete, apaga o livro
        IF p_acao = 'delete' THEN
            DELETE FROM livro WHERE id_livro = p_id_livro;
        ELSEIF p_acao = 'update' THEN
            -- Verifies before updating if the publisher exists | Verifica se a editora existe antes de atualizar
            SELECT COUNT(*) INTO editora_exists FROM editora WHERE id_editora = p_id_editora;

            IF editora_exists = 0 THEN
                SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Editora não existe.';
            ELSE
                -- Updates book's data | Atualiza os dados do livro
                UPDATE livro
                SET titulo = p_titulo,
                    descricao = p_descricao,
                    ano_publicacao = p_ano_publicacao,
                    id_editora = p_id_editora
                WHERE id_livro = p_id_livro;
            END IF;
        ELSE
            SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Ação inválida. Use "update" ou "delete".';
        END IF;
    END IF;
END $$

DELIMITER ;