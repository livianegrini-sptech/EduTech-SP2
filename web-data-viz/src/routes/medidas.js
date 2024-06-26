var express = require("express");
var router = express.Router();

var medidaController = require("../controllers/medidaController");

router.get("/ultimas/:idAquario", function (req, res) {
    medidaController.buscarUltimasMedidas(req, res);
});

router.get("/tempo-real/:idAquario", function (req, res) {
    medidaController.buscarMedidasEmTempoReal(req, res);
})

router.post("/cadastrarPontos", function (req, res) {
    medidaController.cadastrarPontos(req, res);
})

router.post("/cadastrarPontos2", function (req, res) {
    medidaController.cadastrarPontos2(req, res);
})

router.get("/quiz/", function (req, res) {
    medidaController.listarPontos(req, res);
});

router.get("/quiz2/", function (req, res) {
    medidaController.listarPontos2(req, res);
});

module.exports = router;