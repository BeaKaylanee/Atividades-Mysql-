CREATE DATABASE db_farmacia_bem_estar;
USE db_farmacia_bem_estar;


CREATE TABLE tb_categorias (
  id_categoria INT PRIMARY KEY AUTO_INCREMENT,
  nome_categoria VARCHAR(100),
  descricao_categoria TEXT
);

CREATE TABLE tb_produtos (
  id_produto INT PRIMARY KEY AUTO_INCREMENT,
  nome_produto VARCHAR(100),
  valor DECIMAL(8,2),
  quantidade INT,
  id_categoria INT,
  FOREIGN KEY (id_categoria) REFERENCES tb_categorias(id_categoria)
);

INSERT INTO tb_categorias (nome_categoria, descricao_categoria)
VALUES 
  ('Cosméticos', 'Produtos para cuidados pessoais e beleza'),
  ('Medicamentos', 'Produtos farmacêuticos e remédios'),
  ('Suplementos', 'Produtos para apoio nutricional'),
  ('Higiene', 'Produtos para higiene pessoal e limpeza'),
  ('Alimentos', 'Produtos alimentícios e naturais');

INSERT INTO tb_produtos (nome_produto, valor, quantidade, id_categoria)
VALUES 
  ('Creme Facial', 55.00, 30, 1),     
  ('Analgesico', 20.00, 50, 2),         
  ('Vitamina C', 15.00, 100, 3),       
  ('Sabonete', 5.50, 200, 4),          
  ('Chá Verde', 7.00, 80, 5),           
  ('Loção Corporal', 65.00, 40, 1),     
  ('Antialérgico', 45.00, 60, 2),
  ('Proteína Whey', 120.00, 25, 3);      

SELECT * FROM tb_produtos
WHERE valor > 50.00;

SELECT * FROM tb_produtos
WHERE valor BETWEEN 5.00 AND 60.00;

SELECT * FROM tb_produtos
WHERE nome_produto LIKE '%C%';

SELECT 
  p.id_produto,
  p.nome_produto,
  p.valor,
  p.quantidade,
  c.nome_categoria,
  c.descricao_categoria
FROM tb_produtos p
INNER JOIN tb_categorias c ON p.id_categoria = c.id_categoria;

SELECT 
  p.id_produto,
  p.nome_produto,
  p.valor,
  p.quantidade,
  c.nome_categoria,
  c.descricao_categoria
FROM tb_produtos p
INNER JOIN tb_categorias c ON p.id_categoria = c.id_categoria
WHERE c.nome_categoria = 'Cosméticos';