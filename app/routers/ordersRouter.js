const express = require("express");
const router = express.Router();
const auth = require("../middlewares/auth");
const ordersController = require("../controllers/ordersControllers");

router
  .get("/", ordersController.readAll)
  .get("/:inv", ordersController.readDetail)
  .post("/", ordersController.create)
  .put("/:inv", ordersController.updateOrders)
  .delete("/:inv", ordersController.delete);

module.exports = router;
