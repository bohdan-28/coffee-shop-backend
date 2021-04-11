const express = require("express");
const router = express.Router();
const auth = require("../middlewares/auth");
const ordersController = require("../controllers/ordersControllers");

router
  .get("/", auth.verification(), ordersController.readAll)
  .get("/:inv", auth.verification(), ordersController.readDetail)
  .post("/", auth.verification(), ordersController.create)
  .post("/cart", auth.verification(), ordersController.createCart)
  .get("/cart/user/:user", auth.verification(), ordersController.findCart)
  .put("/:inv", auth.verification(), ordersController.updateOrders)
  .delete("/:inv", auth.verification(), ordersController.delete);

module.exports = router;
