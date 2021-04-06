const fs = require("fs");
const productsModel = require("../models/productsModel");
const helper = require("../helpers/printHelper");

module.exports = {
  findAll: (req, res) => {
    const { page, perPage } = req.query;
    const keyword = req.query.keyword ? req.query.keyword : "";
    const sortBy = req.query.sortBy ? req.query.sortBy : "id";
    const order = req.query.order ? req.query.order : "ASC";

    productsModel
      .getAllProducts(page, perPage, keyword, sortBy, order)
      .then(([totalData, totalPage, result, page, perPage]) => {
        if (result < 1) {
          helper.printError(res, 400, "Products not found");
          return;
        }
        for (let i = 0; i < perPage; i++) {
          if (result[i] === undefined) {
            break;
          } else {
            delete result[i].password;
          }
        }
        helper.printPaginate(
          res,
          200,
          "Find all products successfully",
          totalData,
          totalPage,
          result,
          page,
          perPage
        );
      })
      .catch((err) => {
        helper.printError(res, 500, err.message);
      });
  },
};
