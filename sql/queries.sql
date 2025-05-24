USE registro_livros;

-- Consulta 1: Listar todos os livros com seus autores
SELECT l.titulo, a.nome AS autor
FROM livro l
JOIN autor_livro al ON l.id_livro = al.id_livro
JOIN autor a ON a.id_autor = al.id_autor;

-- Consulta 2: Listar todos os livros com seus gêneros
SELECT l.titulo, g.nome AS genero
FROM livro l
JOIN livro_genero lg ON l.id_livro = lg.id_livro
JOIN genero g ON g.id_genero = lg.id_genero;

-- Consulta 3: Listar livros com autor, gênero e editora
SELECT 
  l.titulo,
  a.nome AS autor,
  g.nome AS genero,
  e.nome AS editora
FROM livro l
JOIN autor_livro al ON l.id_livro = al.id_livro
JOIN autor a ON a.id_autor = al.id_autor
JOIN livro_genero lg ON l.id_livro = lg.id_livro
JOIN genero g ON g.id_genero = lg.id_genero
JOIN editora e ON l.id_editora = e.id_editora;

-- Consulta 4: Listar todos os autores e os livros que escreveram
SELECT a.nome AS autor, l.titulo AS livro
FROM autor a
JOIN autor_livro al ON a.id_autor = al.id_autor
JOIN livro l ON l.id_livro = al.id_livro;

-- Consulta 5: Listar livros publicados por cada editora
SELECT e.nome AS editora, l.titulo AS livro
FROM editora e
JOIN livro l ON e.id_editora = l.id_editora;

-- Consulta 6: Contar quantos livros existem por gênero
SELECT g.nome AS genero, COUNT(*) AS total_livros
FROM genero g
JOIN livro_genero lg ON g.id_genero = lg.id_genero
GROUP BY g.nome;