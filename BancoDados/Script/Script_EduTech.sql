CREATE DATABASE EDUTECH;
USE EDUTECH;

CREATE TABLE disciplina(
id INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(45),
descricao VARCHAR(80)
);

CREATE TABLE conteudo(
id INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(45),
descricao TEXT,
fkDisciplina INT,
CONSTRAINT fkConteudoDisciplina FOREIGN KEY (fkDisciplina) REFERENCES disciplina(id)
);

CREATE TABLE usuario (
	id INT PRIMARY KEY AUTO_INCREMENT,
	nome VARCHAR(50),
	email VARCHAR(50),
	senha VARCHAR(50)
);

CREATE TABLE pratica(
id INT PRIMARY KEY AUTO_INCREMENT,
fkConteudo INT,
CONSTRAINT fkPraticaConteudo FOREIGN KEY (fkConteudo) REFERENCES conteudo(id),
fkDisciplina INT,
CONSTRAINT fkPraticaDisciplina FOREIGN KEY (fkDisciplina) REFERENCES disciplina(id),
fkUsuario INT,
CONSTRAINT fkPraticaUsuario FOREIGN KEY (fkUsuario) REFERENCES usuario(id),
pontuacao INT,
tempo TIME,
acertos INT,
erros INT,
dataPratica DATE
);

SELECT * FROM usuario;
