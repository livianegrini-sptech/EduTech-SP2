var database = require("../database/config");

function buscarUltimasMedidas(idAquario, limite_linhas) {

    var instrucaoSql = `SELECT 
        dht11_temperatura as temperatura, 
        dht11_umidade as umidade,
                        momento,
                        DATE_FORMAT(momento,'%H:%i:%s') as momento_grafico
                    FROM medida
                    WHERE fk_aquario = ${idAquario}
                    ORDER BY id DESC LIMIT ${limite_linhas}`;

    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}

function buscarMedidasEmTempoReal(idAquario) {

    var instrucaoSql = `SELECT 
        dht11_temperatura as temperatura, 
        dht11_umidade as umidade,
                        DATE_FORMAT(momento,'%H:%i:%s') as momento_grafico, 
                        fk_aquario 
                        FROM medida WHERE fk_aquario = ${idAquario} 
                    ORDER BY id DESC LIMIT 1`;

    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}

// Para Primeiros Conceitos
function cadastrarPontos(id, pontos) {
    console.log("ACESSEI O MEDIDA MODEL \n \n\t\t >> Se aqui der erro de 'Error: connect ECONNREFUSED',\n \t\t >> verifique suas credenciais de acesso ao banco\n \t\t >> e se o servidor de seu BD está rodando corretamente. \n\n function cadastrar():", id, pontos);

    // Insira exatamente a query do banco aqui, lembrando da nomenclatura exata nos valores
    //  e na ordem de inserção dos dados.
    var instrucaoSql = `
        INSERT INTO pratica (fkConteudo, fkDisciplina, fkUsuario, pontuacao) VALUES (1,1,'${id}', '${pontos}');
    `;
    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}

// Para DML e DQL
function cadastrarPontos2(id, pontos) {
    console.log("ACESSEI O MEDIDA MODEL \n \n\t\t >> Se aqui der erro de 'Error: connect ECONNREFUSED',\n \t\t >> verifique suas credenciais de acesso ao banco\n \t\t >> e se o servidor de seu BD está rodando corretamente. \n\n function cadastrar():", id, pontos);

    // Insira exatamente a query do banco aqui, lembrando da nomenclatura exata nos valores
    //  e na ordem de inserção dos dados.
    var instrucaoSql = `
        INSERT INTO pratica (fkConteudo, fkDisciplina, fkUsuario, pontuacao) VALUES (2,1,'${id}', '${pontos}');
    `;
    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}


function listarPontos() {
    var instrucaoSql = `
                   
            SELECT pratica.id as Pratica, pontuacao, conteudo.id as conteudo FROM pratica
            JOIN usuario
            ON pratica.fkUsuario = usuario.id 
            JOIN conteudo
            ON pratica.fkConteudo = conteudo.id 
            WHERE usuario.id  = 1 AND conteudo.id = 1;`;

    console.log("Executando a instrução SQL: \n" + instrucaoSql);

    return database.executar(instrucaoSql);
}

function listarPontos2() {
    var instrucaoSql = `
                   
    SELECT pratica.id as Pratica, pontuacao, conteudo.id as conteudo FROM pratica
    JOIN usuario
    ON pratica.fkUsuario = usuario.id 
    JOIN conteudo
    ON pratica.fkConteudo = conteudo.id 
        WHERE usuario.id  = 1 AND conteudo.id = 2;`;

    console.log("Executando a instrução SQL: \n" + instrucaoSql);

    return database.executar(instrucaoSql);
}

module.exports = {
    buscarUltimasMedidas,
    buscarMedidasEmTempoReal,
    cadastrarPontos,
    cadastrarPontos2,
    listarPontos,
    listarPontos2
}
