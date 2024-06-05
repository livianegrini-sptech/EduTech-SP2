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
(default, 'Conceitos e primeiros comandos', 'SQL – Structured Query Language
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
aos campos, como PRIMARY KEY, etc.', 1),
(default, 'Comandos DDL e DML', 'Modelagem de Dados: • A modelagem de dados é uma técnica utilizada para:
• Conhecer melhor o contexto de negócio.
• Retratar os dados que suportam esse contexto de negócio.
• Projetar o banco de dados.
• Promover o compartilhamento dos dados e a integração dos
sistemas por meio da reutilização de estruturas de dados comuns.
• Contribuir para que a perspectiva da organização a respeito dos
seus dados seja unificada. Tipos de SGBD: • Modelo hierárquico
• Modelo em rede
• Modelo relacional
• Modelo orientado a objeto
Modelo Hierárquico:
• Primeiro a ser reconhecido como um modelo de dados.
• Representação hierárquica das informações.
• Dados são estruturados em árvores ou hierarquias.
• Cada nó da árvore corresponde à ocorrência de registros
(coleção de campos).
• Registro-pai e registros-filhos.
• Ligação – associação entre 2 registros.
• Sistema comercial: IMS (Information Management System)
da IBM.
Modelo Hierárquico: 
• Exemplo de estrutura do modelo hierárquico
• Conta corrente – endereço
Modelo em Rede:
• Extensão ao modelo hierárquico.
• Eliminou a hierarquia
• Um registro pode estar envolvido em várias associações
• Representado graficamente por grafos.
• Padronizado pela CODASYL (Conference on Data Systems
Languages)
Modelo em Rede:
• Exemplo de estrutura do modelo em rede
• Conta corrente – endereço
Modelo Relacional: • Surgiu para
• Aumentar a independência dos dados
• Prover um conjunto de funções para armazenamento e
recuperação de dados
• Criado por Edgar Codd, em 1970, tendo como base a
teoria dos conjuntos e a álgebra relacional
• Flexível e adequado para solucionar vários problemas na
concepção e implementação da base de dados
• Estrutura fundamental: relação (tabela)
• Relação é constituída por um ou mais atributos (campos)
Modelo Relacional: 
• Exemplo de tabelas do modelo relacional
• Conta corrente / cliente
Modelo Orientado a Objetos:
• Comercialmente viável em meados de 1980.
• Surgimento motivado em função dos limites de
armazenamento e representação semântica impostas no
modelo relacional
• Ex: sistemas de informações geográficas (tipos complexos de
dados)
• Uso de linguagens de programação orientadas a objetos.
• Atualmente, usados em aplicações especializadas
• Representados por diagramas de classes UML (Unified
Modeling Language)
Modelo Orientado a Objetos: 
• Exemplo de diagrama de classes UML
• Conta corrente – endereço
Principais Conceitos:
• chave primária (primary key)
• Campo que identifica de forma única uma tupla ou registro da
tabela. Por exemplo: campo RA da tabela Aluno.
• chave estrangeira (foreign key)
• Campo que se refere à chave primária de uma outra tabela. Por
exemplo: campo Empresa de interesse da tabela Aluno, que
contém o código da empresa (chave primária da tabela Empresa).
Veja slide da Aula01.
• valor NULL
• Quando um determinado campo, para um registro (linha) não tem
nenhum valor, ele recebe o valor NULL.
• DDL (relacionado à linguagem SQL)
• Data Definition Language – grupo de instruções do SQL para criar
tabelas, alterar a estrutura das tabelas ou eliminar tabelas.
• Instruções CREATE, ALTER, DROP
• DML (relacionado à linguagem SQL)
• Data Manipulation Language – grupo de instruções do SQL para
manipular as tabelas, ou seja, para inserir dados, atualizar os
dados, excluir dados, consultar dados
• Instruções INSERT, UPDATE, DELETE, SELECT
• DCL (relacionado à linguagem SQL)
• Data Control Language - lidam principalmente com os direitos,
permissões e outros controles do sistema de banco de dados.
• GRANT - concede privilégios de acesso do usuário ao banco de dados.
• REVOKE - retira os privilégios de acesso do usuário dados usando o
comando GRANT.', 1);

SELECT * FROM conteudo;
SELECT * FROM disciplina;
SELECT * FROM usuario;
SELECT * FROM pratica;
SELECT * FROM usuario;

SELECT pratica.id as Pratica, pontuacao, dataPratica, disciplina.nome as Disciplina, conteudo.nome as Conteudo
FROM pratica JOIN disciplina
ON pratica.fkDisciplina = disciplina.id
JOIN conteudo 	
ON pratica.fkConteudo = conteudo.id;

-- INSERT INTO pratica (fkConteudo, fkDisciplina) VALUES
-- (1,1);

SELECT * FROM pratica;

SELECT pratica.id as idPratica, pontuacao, conteudo.id as conteudo FROM pratica
JOIN usuario
ON pratica.fkUsuario = usuario.id 
JOIN conteudo
ON pratica.fkConteudo = conteudo.id 
	WHERE usuario.id  = 1 AND conteudo.id = 1;
    
SELECT pratica.id as idPratica, pontuacao, conteudo.id as conteudo FROM pratica
JOIN usuario
ON pratica.fkUsuario = usuario.id 
JOIN conteudo
ON pratica.fkConteudo = conteudo.id 
	WHERE usuario.id  = 1 AND conteudo.id = 2;

