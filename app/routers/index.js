const express = require("express");
const route = express.Router();

const usersRouter = require("./usersRouter");
const productsRouter = require("./productsRouters");

route.use("/users", usersRouter);
route.use("/products", productsRouter);

module.exports = route;
