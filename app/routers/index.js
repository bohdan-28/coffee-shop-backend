const express = require("express");
const route = express.Router();

const usersRouter = require("./usersRouter");
const productsRouter = require("./productsRouter");
const ordersRouter = require("./ordersRouter");

route.use("/users", usersRouter);
route.use("/products", productsRouter);
route.use("/orders", ordersRouter);

module.exports = route;
