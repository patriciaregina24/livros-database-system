USE registro_livros;

SELECT * FROM livro_genero LIMIT 1000;

-- Inserindo autores
INSERT INTO `registro_livros`.`autor`(`nome`, `nacionalidade`) VALUES
('George R. R. Martin', 'Americano'),
('Machado de Assis', 'Brasileiro'),
('Paulo Coelho', 'Brasileiro'),
('J.K. Rowling', 'Britânica'),
('José Saramago', 'Português'),
('Clarice Lispector', 'Brasileira'),
('Stephen King', 'Americano'),
('Gabriel García Márquez', 'Colombiano');

-- Inserindo editoras
INSERT INTO `registro_livros`.`editora` (`nome`, `pais`) VALUES
('Editora Leya', 'Portugal'),
('Editora Planeta', 'Brasil'),
('Editora Record', 'Brasil'),
('Bloomsbury', 'Reino Unido'),
('Companhia das Letras', 'Brasil'),
('Alfaguara', 'Espanha');

-- Inserindo gêneros
INSERT INTO `registro_livros`.`genero` (`nome`) VALUES
('Fantasia'),
('Ficção'),
('Romance'),
('Drama'),
('Terror'),
('Realismo Mágico');

-- Alterando a tabela livro para receber SMALLINT ao invés de DATE ou YEAR (ambos não estavam funcionando)
ALTER TABLE livro
MODIFY COLUMN ano_publicacao SMALLINT;

-- Inserindo livros
INSERT INTO `registro_livros`.`livro` (`titulo`, `descricao`, `ano_publicacao`, `id_editora`) VALUES
('Dom Casmurro', 'A história de Bentinho e Capitu, uma trama envolvente que aborda ciúmes e desconfianças', 1899, 3),
('Game of Thrones', 'A luta pelo trono de ferro entre famílias nobres em um mundo medieval e mágico', 1996, 1),
('O Alquimista', 'A história de um jovem pastor que parte em busca de um tesouro', 1988, 2),
('Harry Potter e a Pedra Filosofal', 'A jornada de um jovem bruxo em Hogwarts', 1997, 4),
('Ensaio sobre a Cegueira', 'Uma epidemia de cegueira súbita e o colapso social que se segue', 1995, 5),
('A Hora da Estrela', 'A história de uma nordestina invisível à sociedade', 1977, 5),
('It: A Coisa', 'Um grupo de amigos enfrenta uma entidade maligna que se disfarça de palhaço', 1986, 6),
('Cem Anos de Solidão', 'A saga da família Buendía em Macondo, repleta de realismo mágico', 1967, 7);

-- Associando livros aos autores
INSERT INTO `registro_livros`.`autor_livro` (`id_autor`, `id_livro`) VALUES
(1, 2), -- George R. R. Martin com Game of Thrones
(2, 1), -- Machado de Assis com Dom Casmurro
(3, 3), -- Paulo Coelho com O Alquimista
(4, 4), -- J.K. Rowling com Harry Potter
(5, 5), -- José Saramago com Ensaio sobre a Cegueira
(6, 6), -- Clarice Lispector com A Hora da Estrela
(7, 7), -- Stephen King com It
(8, 8); -- Gabriel García Márquez com Cem Anos de Solidão

-- Associando livros aos gêneros
INSERT INTO `registro_livros`.`livro_genero` (`id_livro`, `id_genero`) VALUES
(1, 3), -- Dom Casmurro com Romance
(2, 1), -- Game of Thrones com Fantasia
(3, 3), -- O Alquimista com Romance
(4, 1), -- Harry Potter com Fantasia
(5, 4), -- Ensaio sobre a Cegueira com Drama
(6, 4), -- A Hora da Estrela com Drama
(7, 5), -- It com Terror
(8, 6); -- Cem Anos de Solidão com Realismo Mágico