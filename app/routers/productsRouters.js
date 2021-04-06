const express = require("express");
const router = express.Router();
const multer = require("../middlewares/multer");
const auth = require("../middlewares/auth");
const productsController = require("../controllers/productsController");

router
  .get("/", productsController.findAll)
  .get("/:id", productsController.findOne);

module.exports = router;
