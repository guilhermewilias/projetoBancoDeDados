CREATE DATABASE jogo;
USE jogo;

select * from usuario;

CREATE TABLE usuario (
    id INT PRIMARY KEY AUTO_INCREMENT,
    tipo VARCHAR(200),
    email VARCHAR(200),
    senha VARCHAR(200),
    nome VARCHAR(200)
);

CREATE TABLE turma (
    id INT PRIMARY KEY AUTO_INCREMENT,
    turma VARCHAR(200),
    idusuario INT,
    idescola INT,
    FOREIGN KEY (idusuario) REFERENCES usuario (id),
    FOREIGN KEY (idescola) REFERENCES escola (id)
);

CREATE TABLE escola (
    id INT PRIMARY KEY AUTO_INCREMENT,
    escola VARCHAR(200)
);

CREATE TABLE jogo (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(200)
);

CREATE TABLE regra (
    id INT PRIMARY KEY AUTO_INCREMENT,
    tempo INT,
    pontoFase4 INT,
    pontoFase3 INT,
    pontoFase2 INT,
    pontoFase1 INT,
    norma INT
);

CREATE TABLE alternativa (
    id INT PRIMARY KEY AUTO_INCREMENT,
    pergunta INT,
    alternativa1 INT,
    alternativa2 INT,
    alternativa3 INT,
    alternativa4 INT,
    resposta INT,
    etapa INT,
    dica INT
);

CREATE TABLE jogo_turma (
    id INT PRIMARY KEY AUTO_INCREMENT
);

CREATE TABLE joga (
    id INT PRIMARY KEY AUTO_INCREMENT,
    erro BOOLEAN,
    tempo DATETIME,
    acerto BOOLEAN,
    ponto INT
);

CREATE TABLE possui (
    id INT PRIMARY KEY AUTO_INCREMENT
);

CREATE TABLE apresenta (
    id INT PRIMARY KEY AUTO_INCREMENT
);

ALTER TABLE turma ADD FOREIGN KEY (idusuario) REFERENCES usuario (id);
ALTER TABLE turma ADD FOREIGN KEY (idescola) REFERENCES escola (id);
ALTER TABLE jogo_turma ADD FOREIGN KEY (id) REFERENCES jogo (id);
ALTER TABLE possui ADD FOREIGN KEY (id) REFERENCES regra (id);
ALTER TABLE apresenta ADD FOREIGN KEY (id) REFERENCES alternativa (id);