const fs = require("fs");
const path = require("path");
const productsModel = require("../models/productsModel");
const helper = require("../helpers/printHelper");

const removeImage = (filePath) => {
  filePath = path.join(__dirname, "../..", filePath);
  fs.unlink(filePath, (err) => new Error(err));
};

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

  findOne: (req, res) => {
    const id = req.params.id;
    console.log(id);
    productsModel
      .getProductsById(id)
      .then((result) => {
        if (result < 1) {
          helper.printError(
            res,
            400,
            `Cannot find one product with id = ${id}`
          );
          return;
        }
        helper.printSuccess(res, 200, "Find one product successfully", result);
      })
      .catch((err) => {
        helper.printError(res, 500, err.message);
      });
  },

  create: async (req, res) => {
    let image;
    if (!req.file) {
      image = "images\\default_products.jpg";
    } else {
      image = req.file.path;
    }

    const { name, price, stock, category, description, size } = req.body;

    const data = {
      name,
      price,
      image,
      stock,
      category,
      description,
      size,
    };

    productsModel
      .createProduct(data)
      .then((result) => {
        if (result.affectedRows === 0) {
          helper.printError(res, 400, "Error creating products");
          return;
        }
        {
          helper.printSuccess(res, 200, "Create product successfully", result);
        }
      })
      .catch((err) => {
        helper.printError(res, 500, err.message);
      });
  },

  delete: (req, res) => {
    const id = req.params.id;
    productsModel
      .findProduct(id, "delete")
      .then((result) => {
        const image = result[0].image;
        if (image !== "images\\default_products.jpg") {
          removeImage(image);
        }
        return productsModel.deleteProduct(id);
      })
      .then((result) => {
        helper.printSuccess(res, 200, "Product has been deleted", {});
      })
      .catch((err) => {
        if (err.message === "Internal server error") {
          helper.printError(res, 500, err.message);
        }
        helper.printError(res, 400, err.message);
      });
  },
};
