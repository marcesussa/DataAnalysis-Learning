-- Agora é hora de praticar um pouco o que você viu durante esta aula. Em uma instalação local de postgres, execute as seguintes tarefas:

-- Crie uma tabela chamada ‘photos’ que aceita o campo ‘id’ como chave primária, autoincremental, ‘title’ como texto e campo obrigatório. O campo ‘size’ como inteiro e não obrigatório, esse campo armazena o tamanho em bytes das imagens;
CREATE TABLE photos(
id serial PRIMARY KEY,
title VARCHAR(255) NOT NULL,
size INTEGER
)
;

--Altere a tabela de forma que title se torne um índice;
CREATE INDEX idx_title ON photos(title);

--Crie uma tabela chamada “photographers”, que aceita id e name. Name sendo um texto obrigatório;
CREATE TABLE  photographers(
id SERIAL PRIMARY KEY,
name VARCHAR(255) NOT NULL);

--Altere a tabela photos de forma que ela tenha uma campo “photographer_id”, que se relaciona com o campo “id” em photographer;
ALTER TABLE photos ADD COLUMN photographer_id INTEGER REFERENCES photographers;



--Utilizando essas tabelas criadas, insira informações para 5 fotógrafos e 3 fotos para cada um:
INSERT INTO
photographers (name)
VALUES
('Nick');
INSERT INTO
photographers (name)
VALUES
('Ted');
INSERT INTO
photographers (name)
VALUES
('Fred');
INSERT INTO
photographers (name)
VALUES
('Peter');
INSERT INTO
photographers (name)
VALUES
('Milk');

--Nick
INSERT INTO
photos (title,size, photographer_id)
VALUES
('Pra sempreli',98,1);

INSERT INTO
photos (title,size, photographer_id)
VALUES
('Mamaim',52,1);

INSERT INTO
photos (title,size, photographer_id)
VALUES
('Tesouro',7,1);


-- Ted
INSERT INTO
photos (title,size, photographer_id)
VALUES
('Mamá',10,2);
INSERT INTO
photos (title,size, photographer_id)
VALUES
('Fami',100,2);
INSERT INTO
photos (title, photographer_id)
VALUES
('sozinho',2);


-- Fred
INSERT INTO
photos (title,size, photographer_id)
VALUES
('Maim',25,3);
INSERT INTO
photos (title,size, photographer_id)
VALUES
('Bebe',2,3);
INSERT INTO
photos (title,photographer_id)
VALUES
('papai',3);

-- Peter
INSERT INTO
photos (title,size, photographer_id)
VALUES
('Loja',5000,4);
INSERT INTO
photos (title,size, photographer_id)
VALUES
('Ted passando',16,4);
INSERT INTO
photos (title,size, photographer_id)
VALUES
('AUAUAU',50,4);

-- Milk
INSERT INTO
photos (title,size, photographer_id)
VALUES
('Ralph',1,5);
INSERT INTO
photos (title,size, photographer_id)
VALUES
('Nina',98,5);
INSERT INTO
photos (title,size, photographer_id)
VALUES
('Sophia',1000,5);

--Exercicios de select
--Selecione agora todas as fotos;
SELECT * from photos;

-- Selecione o tamanho máximo e mínimo das fotos inseridas;
SELECT max(size), min(size) FROM photos;

-- Selecione o nome de todos os fotógrafos;
SELECT DISTINCT name FROM photographers;

-- Selecione todas as fotos junto do nome de todos os fotógrafos;
SELECT * FROM photos a
JOIN photographers b
on a.photographer_id=b.id
;
-- Altere o nome de dois fotógrafos aleatórios;
UPDATE photographers SET name = 'Nick Wickit'
    	WHERE name LIKE 'Nick';
		
UPDATE photographers SET name = 'Milky'
    	WHERE name LIKE 'Milk';
-- Apague todas as fotos de um fotógrafo em especial.
DELETE FROM photos WHERE photographer_id=4;