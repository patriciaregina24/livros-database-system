USE registro_livros;

-- Inserindo autores
INSERT INTO `registro_livros`.`autor`(`nome`, `nacionalidade`) VALUES
('George R. R. Martin', 'Americano'),
('Machado de Assis', 'Brasileiro'),
('Paulo Coelho', 'Brasileiro'),
('J.K. Rowling', 'Britânica'),
('José Saramago', 'Português'),
('Clarice Lispector', 'Brasileira'),
('Stephen King', 'Americano'),
('Gabriel García Márquez', 'Colombiano'),
('Haruki Murakami', 'Japonês'),
('Chimamanda Ngozi Adichie', 'Nigeriana'),
('Isabel Allende', 'Chilena'),
('Neil Gaiman', 'Britânico'),
('Toni Morrison', 'Americana'),
('Jorge Luis Borges', 'Argentino'),
('Virginia Woolf', 'Britânica'),
('Franz Kafka', 'Tcheco'),
('Margaret Atwood', 'Canadense'),
('Paulo Freire', 'Brasileiro'),
('Elena Ferrante', 'Italiana'),
('Salman Rushdie', 'Indiano');

-- Inserindo editoras
INSERT INTO `registro_livros`.`editora` (`nome`, `pais`) VALUES
('Editora Leya', 'Portugal'),
('Editora Planeta', 'Brasil'),
('Editora Record', 'Brasil'),
('Bloomsbury', 'Reino Unido'),
('Companhia das Letras', 'Brasil'),
('Alfaguara', 'Espanha'),
('Penguin Random House', 'Estados Unidos'),
('HarperCollins', 'Estados Unidos'),
('Gallimard', 'França'),
('Faber & Faber', 'Reino Unido');

-- Inserindo gêneros
INSERT INTO `registro_livros`.`genero` (`nome`) VALUES
('Fantasia'),
('Ficção Científica'),
('Romance'),
('Drama'),
('Terror'),
('Realismo Mágico'),
('Mistério'),
('Biografia'),
('Histórico'),
('Literatura Clássica');

-- Alterando a tabela livro para receber SMALLINT ao invés de DATE ou YEAR (ambos não estavam funcionando)
ALTER TABLE livro
MODIFY COLUMN ano_publicacao SMALLINT;

-- Inserindo livros
INSERT INTO `registro_livros`.`livro` (`titulo`, `descricao`, `ano_publicacao`, `id_editora`) VALUES
('Dom Casmurro', 'A história de Bentinho e Capitu, uma trama envolvente que aborda ciúmes e desconfianças', 1899, 5), -- Companhia das Letras
('Game of Thrones', 'A luta pelo trono de ferro entre famílias nobres em um mundo medieval e mágico', 1996, 2), -- Editora Planeta
('O Alquimista', 'A história de um jovem pastor que parte em busca de um tesouro', 1988, 3), -- Editora Record
('Harry Potter e a Pedra Filosofal', 'A jornada de um jovem bruxo em Hogwarts', 1997, 4), -- Bloomsbury
('Ensaio sobre a Cegueira', 'Uma epidemia de cegueira súbita e o colapso social que se segue', 1995, 5), -- Companhia das Letras
('A Hora da Estrela', 'A história de uma nordestina invisível à sociedade', 1977, 5), -- Companhia das Letras
('It: A Coisa', 'Um grupo de amigos enfrenta uma entidade maligna que se disfarça de palhaço', 1986, 6), -- Alfaguara
('Cem Anos de Solidão', 'A saga da família Buendía em Macondo, repleta de realismo mágico', 1967, 1), -- Editora Leya
('Kafka à Beira-Mar', 'Um jovem foge de casa e vive uma série de eventos mágicos e surreais', 2002, 7), -- Penguin Random House
('Americanah', 'História de uma jovem nigeriana que emigra para os EUA em busca de uma nova vida', 2013, 8), -- HarperCollins
('A Casa dos Espíritos', 'Uma saga familiar cheia de mistérios e elementos sobrenaturais', 1982, 9), -- Gallimard
('Deuses Americanos', 'Um homem envolvido numa guerra entre velhos e novos deuses', 2001, 7), -- Penguin Random House
('Amada', 'A luta de uma ex-escrava para superar seu passado traumático', 1987, 10), -- Faber & Faber
('Ficciones', 'Uma coleção de contos que exploram temas filosóficos e fantásticos', 1944, 9), -- Gallimard
('Mrs Dalloway', 'Um dia na vida de uma mulher na Londres do pós-guerra', 1925, 4), -- Bloomsbury
('O Processo', 'Um homem é preso sem saber o motivo, numa história absurda e angustiante', 1925, 7), -- Penguin Random House
('O Conto da Aia', 'Uma distopia sobre uma sociedade totalitária que subjuga as mulheres', 1985, 10), -- Faber & Faber
('Pedagogia do Oprimido', 'Reflexões sobre educação e libertação social', 1968, 3), -- Editora Record
('A Filha Perdida', 'Uma mulher enfrenta crises pessoais durante suas férias na Itália', 2006, 9), -- Gallimard
('Os Filhos da Meia-Noite', 'Um romance mágico sobre a Índia em sua independência', 1981, 2); -- Editora Planeta

-- Associando livros aos autores
INSERT INTO `registro_livros`.`autor_livro` (`id_autor`, `id_livro`) VALUES
(2, 1),  -- Machado de Assis - Dom Casmurro
(1, 2),  -- George R. R. Martin - Game of Thrones
(3, 3),  -- Paulo Coelho - O Alquimista
(4, 4),  -- J.K. Rowling - Harry Potter e a Pedra Filosofal
(5, 5),  -- José Saramago - Ensaio sobre a Cegueira
(6, 6),  -- Clarice Lispector - A Hora da Estrela
(7, 7),  -- Stephen King - It: A Coisa
(8, 8),  -- Gabriel García Márquez - Cem Anos de Solidão
(9, 9),  -- Haruki Murakami - Kafka à Beira-Mar
(10, 10),-- Chimamanda Ngozi Adichie - Americanah
(11, 11),-- Isabel Allende - A Casa dos Espíritos
(12, 12),-- Neil Gaiman - Deuses Americanos
(13, 13),-- Toni Morrison - Amada
(14, 14),-- Jorge Luis Borges - Ficciones
(15, 15),-- Virginia Woolf - Mrs Dalloway
(16, 16),-- Franz Kafka - O Processo
(17, 17),-- Margaret Atwood - O Conto da Aia
(18, 18),-- Paulo Freire - Pedagogia do Oprimido
(19, 19),-- Elena Ferrante - A Filha Perdida
(20, 20);-- Salman Rushdie - Os Filhos da Meia-Noite

-- Associando livros aos gêneros
INSERT INTO `registro_livros`.`livro_genero` (`id_livro`, `id_genero`) VALUES
(1, 10), -- Dom Casmurro - Literatura Clássica
(2, 1),  -- Game of Thrones - Fantasia
(3, 3),  -- O Alquimista - Romance
(4, 1),  -- Harry Potter - Fantasia
(5, 4),  -- Ensaio sobre a Cegueira - Drama
(6, 4),  -- A Hora da Estrela - Drama
(7, 5),  -- It: A Coisa - Terror
(8, 6),  -- Cem Anos de Solidão - Realismo Mágico
(9, 1),  -- Kafka à Beira-Mar - Fantasia
(10, 3), -- Americanah - Romance
(11, 7), -- A Casa dos Espíritos - Mistério
(12, 1), -- Deuses Americanos - Fantasia
(13, 8), -- Amada - Biografia
(14, 7), -- Ficciones - Mistério
(15, 3), -- Mrs Dalloway - Romance
(16, 7), -- O Processo - Mistério
(17, 1), -- O Conto da Aia - Fantasia (distopia)
(18, 9), -- Pedagogia do Oprimido - Histórico (educação/social)
(19, 4), -- A Filha Perdida - Drama
(20, 3); -- Os Filhos da Meia-Noite - Romance (magia e história)