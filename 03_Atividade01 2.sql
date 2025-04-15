create DATABASE db_generation_game_online;

use db_generation_game_online;


CREATE TABLE tb_classes (
  id_classe INT PRIMARY KEY AUTO_INCREMENT,
  tipo_personagem VARCHAR(100),  
  nivel INT,                   
  descricao TEXT                 
);

CREATE TABLE tb_personagens (
  id_personagem INT PRIMARY KEY AUTO_INCREMENT,
  nome_personagem VARCHAR(100),  
  vida INT,                     
  poder_ataque INT,             
  poder_defesa INT,              
  id_classe INT,                
  FOREIGN KEY (id_classe) REFERENCES tb_classes(id_classe)
);


INSERT INTO tb_classes (tipo_personagem, nivel, descricao)
VALUES 
  ("Mago", 100, "Mago com habilidades mágicas e controle sobre elementos"),
  ("Guerreiro", 80, "Guerreiro com armadura pesada e habilidades de combate corpo a corpo"),
  ("Arqueiro", 90, "Arqueiro com habilidades de longo alcance e agilidade"),
  ("Curandeiro", 60, "Curandeiro com habilidades de cura e suporte a aliados"),
  ("Assassino", 75, "Assassino ágil e mortal em ataques furtivos");




INSERT INTO tb_personagens (nome_personagem, vida, poder_ataque, poder_defesa, id_classe)
VALUES 
  ("Luna", 1200, 2200, 800, 1),  
  ("Thorin", 2000, 1800, 1500, 2),  
  ("Elyra", 1500, 2500, 900, 3),  
  ("Ragnar", 1700, 2100, 1300, 2),  
  ("Kael", 1100, 2700, 700, 1),  
  ("Sylas", 1300, 1950, 1100, 4),  
  ("Mira", 900, 800, 600, 5),  
  ("Jomaria", 900, 800, 600, 5), 
  ("Carla", 100, 800, 200, 4),
  ("Dorian", 1600, 2050, 1000, 3);  


SELECT * FROM tb_personagens WHERE poder_ataque > 2000;

SELECT nome_personagem, poder_defesa FROM tb_personagens WHERE poder_defesa > 1000 AND 2000;

SELECT nome_personagem FROM tb_personagens WHERE nome_personagem LIKE  '%c%';

SELECT nome_personagem, vida, poder_defesa,tb_classes.tipo_personagem, tb_classes.descricao
FROM tb_personagens INNER JOIN tb_classes 
ON tb_personagens.id_personagem = tb_classes.id_classe;


SELECT c.tipo_personagem, c.descricao, AVG(c.nivel) AS nivel_medio
FROM tb_personagens p
INNER JOIN tb_classes c ON p.id_classe = c.id_classe
GROUP BY c.tipo_personagem, c.descricao;


SELECT p.nome_personagem, p.vida, p.poder_ataque, c.tipo_personagem
FROM tb_personagens AS p
INNER JOIN tb_classes AS c ON p.id_classe = c.id_classe
WHERE c.tipo_personagem = "Arqueiro";
