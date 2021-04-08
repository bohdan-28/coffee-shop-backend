const express = require("express");
const router = express.Router();
const auth = require("../middlewares/auth");
const ordersController = require("../controllers/ordersControllers");

router.post("/", ordersController.create);

module.exports = router;
