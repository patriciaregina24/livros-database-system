USE registro_livros;

SELECT * FROM livro_genero LIMIT 1000;

-- Inserindo autores
INSERT INTO `registro_livros`.`autor`(`nome`, `nacionalidade`) VALUES
('George R. R. Martin', 'Americano'),
('Machado de Assis', 'Brasileiro'),
('Paulo Coelho', 'Brasileiro');

-- Inserindo editoras
INSERT INTO `registro_livros`.`editora` (`nome`, `pais`) VALUES
('Editora Leya', 'Portugal'),
('Editora Planeta', 'Brasil'),
('Editora Record', 'Brasil');

-- Inserindo gêneros
INSERT INTO `registro_livros`.`genero` (`nome`) VALUES
('Fantasia'),
('Ficção'),
('Romance');

-- Alterando a tabela livro para receber SMALLINT ao invés de DATE ou YEAR (ambos não estavam funcionando)
ALTER TABLE livro
MODIFY COLUMN ano_publicacao SMALLINT;

-- Inserindo livros
INSERT INTO `registro_livros`.`livro` (`titulo`, `descricao`, `ano_publicacao`, `id_editora`) VALUES
('Dom Casmurro', 'A história de Bentinho e Capitu, uma trama envolvente que aborda ciúmes e desconfianças', 1899, 3),
('Game of Thrones', 'A luta pelo trono de ferro entre famílias nobres em um mundo medieval e mágico', 1996, 1),
('O Alquimista', 'A história de um jovem pastor que parte em busca de um tesouro', 1988, 2);

-- Associando livros aos autores
INSERT INTO `registro_livros`.`autor_livro` (`id_autor`, `id_livro`) VALUES
(1, 2), -- George R. R. Martin com Game of Thrones
(2, 1), -- Machado de Assis com Dom Casmurro
(3, 3); -- Paulo Coelho com O Alquimista

-- Associando livros aos gêneros
INSERT INTO `registro_livros`.`livro_genero` (`id_livro`, `id_genero`) VALUES
(1, 3), -- Dom Casmurro com Romance
(2, 1), -- Game of Thrones com Fantasia
(3, 3); -- O Alquimista com Romance
