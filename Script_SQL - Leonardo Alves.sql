/* DESAFIO SEMANA 1 - LEONARDO ALVES */

USE programa_bolsas;

/* A - Listar todos os livros publicados após 2014 */

SELECT * FROM LIVRO WHERE YEAR(Publicacao) > 2014;

/* B -  Listar os 10 livros mais caros */

SELECT * FROM LIVRO ORDER BY Valor DESC LIMIT 10;

/* C - Listar as 5 editoras que mais tem livros na biblioteca */

SELECT A.EDITORA, B.Nome, COUNT(Editora) AS Número_de_Livros
FROM LIVRO A INNER JOIN EDITORA B
ON A.EDITORA = B.CodEditora
GROUP BY A.EDITORA, B.Nome
ORDER BY Número_de_Livros DESC LIMIT 5;

/* D - Listar a quantidade de publicações de cada autor */

SELECT Nome,
CASE 
    WHEN COUNT(Autor) = 0 THEN 'Sem publicações'
    ELSE COUNT(Autor)
END

AS Publicacoes FROM LIVRO A
RIGHT JOIN AUTOR B
ON B.CodAutor = A.Autor
GROUP BY Nome ORDER BY COUNT(autor) DESC;

 /* E - Listar a quantidade de publicações de cada editora */

SELECT A.EDITORA, B.Nome, COUNT(Editora) AS QNT_PUBLICACOES 
FROM LIVRO A INNER JOIN EDITORA B
ON A.Editora = B.CodEditora
GROUP BY A.Editora, B.CodEditora 
ORDER BY EDITORA ASC;

/* F - Listar qual é o autor com mais publicações */

SELECT A.Autor, B.Nome, COUNT(Autor) AS LIVROS_PUBLICADOS 
FROM LIVRO A INNER JOIN AUTOR B
ON A.Autor = B.CodAutor
GROUP BY A.Autor 
ORDER BY LIVROS_PUBLICADOS DESC LIMIT 1;

/* G -  Listar qual é o autor com menos ou nenhuma publicação */

SELECT Nome,
  CASE 
    WHEN COUNT(Autor) = 0 THEN 0
    ELSE COUNT(Autor)
  END
AS Publicacoes FROM LIVRO A
RIGHT JOIN AUTOR B ON B.CodAutor = A.Autor
GROUP BY Nome ORDER BY COUNT(autor) ASC LIMIT 1;