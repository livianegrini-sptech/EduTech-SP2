CREATE DATABASE EDUTECH;
USE EDUTECH;

CREATE TABLE disciplina(
id INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(45),
descricao TEXT
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
dataPratica DATETIME DEFAULT CURRENT_TIMESTAMP
);

SELECT * FROM usuario;

INSERT INTO disciplina VALUES 
(default, 'Banco de Dados', 'Aborda os fundamentos essenciais para o armazenamento, organização e manipulação de dados em sistemas computacionais.');
SELECT * FROM disciplina;

INSERT INTO conteudo VALUES
(default, 'Comandos DDL e DML', 'SQL – Structured Query Language
• Desenvolvido no início dos anos 1970, pelo Departamento de pesquisas da IBM
• Interface para o sistema de banco de dados relacional System R
• Inicialmente chamava-se SEQUEL (Structured English QUEry Language)
• A partir de 1977, passou a ser chamada de SQL
• Query = consulta, em inglês
Criando um banco de dados (Schema)
• Comando: CREATE DATABASE nome-do-banco
• No MySQL Workbench, os bancos de dados aparecem na
parte esquerda da tela, na janela Schemas
• As tabelas são criadas dentro de um banco de dados.
Para isso, devemos selecionar o banco de dados que queremos utilizar
Selecionando um banco de dados (Schema)
• Comando: USE nome-do-banco
• No MySQL Workbench, é possível selecionar o banco apenas dando
um duplo clique com o mouse em cima do nome do banco na janela SCHEMAS
Criando uma tabela
• Comando: CREATE TABLE nome-da-tabela
( nome-campo1 tipo-campo1, nome-campo2 tipo-campo2,
....... nome-campoN tipo-campoN );
• A tabela será criada dentro do banco de dados selecionado,
com os campos definidos no comando.
• No comando acima, é possível acrescentar restrições
aos campos, como PRIMARY KEY, etc.', 1);
SELECT * FROM conteudo;

SELECT * FROM usuario;

INSERT INTO pratica (fkConteudo, fkDisciplina) VALUES
(1,1);

SELECT * FROM pratica;