-- Criação do Banco de Dados (opcional)
CREATE DATABASE db_pizzaria_legal;
USE db_pizzaria_legal;

CREATE TABLE tb_categorias(
   id_categoria BIGINT PRIMARY KEY AUTO_INCREMENT,
   nome_categoria VARCHAR(100),
   descricao_categoria TEXT
);

CREATE TABLE tb_pizzas(
  id_pizza INT PRIMARY KEY AUTO_INCREMENT,
  nome_pizza VARCHAR(100),
  tamanho VARCHAR(50),    
  sabor   VARCHAR(50),
  valor   DECIMAL(6,2),
  id_categoria   BIGINT,         
  FOREIGN KEY (id_categoria) REFERENCES tb_categorias(id_categoria)
);
SELECT * FROM tb_categorias;
INSERT INTO tb_categorias (nome_categoria, descricao_categoria)
VALUES 
  ('Pizza Salgada', 'Pizzas com sabores salgados e tradicionais'),
  ('Pizza Doce', 'Pizzas com sabores doces, ideais para sobremesa'),
  ('Esfiha', 'Esfihas de diversos sabores'),
  ('Beirutes', 'Lanches no estilo beirute');


INSERT INTO tb_pizzas (nome_pizza, tamanho, sabor, valor, id_categoria)
VALUES 
  ('Calabresa Especial', 'Média', 'Calabresa com mussarela', 45.00, 1),
  ('Marguerita', 'Grande', 'Tomate e manjericão', 55.00, 1),
  ('Chocolate Supremo', 'Média', 'Chocolate com morango', 50.00, 2),
  ('Prestígio', 'Pequena', 'Chocolate com coco', 40.00, 2),
  ('Esfiha de Carne', 'Unica', 'Carne temperada', 8.00, 3),
  ('Esfiha de Queijo', 'Unica', 'Queijo derretido', 7.50, 3),
  ('Beirute Clássico', 'Grande', 'Carne com legumes', 30.00, 4),
  ('Beirute Vegano', 'Grande', 'Legumes e tofu', 32.00, 4);
  
SELECT * FROM tb_pizzas
WHERE valor > 45.00;

SELECT * FROM tb_pizzas
WHERE valor BETWEEN 50.00 AND 100.00;

SELECT * FROM tb_pizzas
WHERE nome_pizza LIKE '%M%';

SELECT 
  p.id_pizza,
  p.nome_pizza,
  p.tamanho,
  p.valor,
  c.nome_categoria,
  c.descricao_categoria
FROM tb_pizzas p
INNER JOIN tb_categorias c ON p.id_categoria = c.id_categoria;


SELECT 
  p.id_pizza,
  p.nome_pizza,
  p.tamanho,
  p.valor,
  c.nome_categoria,
  c.descricao_categoria
FROM tb_pizzas p
INNER JOIN tb_categorias c ON p.id_categoria = c.id_categoria
WHERE c.nome_categoria = 'Pizza Doce';

