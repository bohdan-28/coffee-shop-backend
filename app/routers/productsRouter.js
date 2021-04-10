const express = require("express");
const router = express.Router();
const multer = require("../middlewares/multer");
const auth = require("../middlewares/auth");
const productsController = require("../controllers/productsController");

router
  .get("/", productsController.findAll)
  .get("/favourite", productsController.findAllFavourite)
  .get("/:id", productsController.findOne)
  .post(
    "/",
    auth.verification(),
    auth.isAdmin(),
    multer.uploadImage.single("image"),
    productsController.create
  )
  .put(
    "/:id",
    auth.verification(),
    multer.uploadImage.single("image"),
    productsController.update
  )
  .delete(
    "/:id",
    auth.verification(),
    auth.isAdmin(),
    productsController.delete
  );

module.exports = router;
