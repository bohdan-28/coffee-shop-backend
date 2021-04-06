const express = require("express");
const route = express.Router();

const usersRouter = require("./usersRouter");

route.use("/users", usersRouter);

module.exports = route;
