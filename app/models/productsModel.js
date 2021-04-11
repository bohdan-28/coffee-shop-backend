const connection = require("../configs/dbConfig");

module.exports = {
  getAllProducts: (queryPage, queryPerPage, keyword, sortBy, order) => {
    return new Promise((resolve, reject) => {
      connection.query(
        "SELECT COUNT(*) AS totalData FROM products LEFT JOIN categories ON products.categoryID = categories.id WHERE products.name LIKE ? OR categories.name = ?",
        [`%${keyword}%`, keyword],
        (err, result) => {
          let totalData, page, perPage, totalPage;
          if (err) {
            reject(new Error("Internal server error"));
          } else {
            totalData = result[0].totalData;
            page = queryPage ? parseInt(queryPage) : 1;
            perPage = queryPerPage ? parseInt(queryPerPage) : 5;
            totalPage = Math.ceil(totalData / perPage);
          }
          const firstData = perPage * page - perPage;
          connection.query(
            `SELECT products.id, products.name as name, categories.name as category, products.price, products.image, products.description, products.size, products.deliveryMethod, 
            products.stock, products.totalSale, products.categoryID, products.hourStart, products.hourEnd, products.created_at FROM products LEFT JOIN categories ON products.categoryID = categories.id WHERE products.name LIKE ? OR categories.name = ? ORDER BY ${sortBy} ${order} LIMIT ?, ?`,
            [`%${keyword}%`, keyword, firstData, perPage],
            (err, result) => {
              if (err) {
                console.log(err);
                reject(new Error("Internal server error"));
              } else {
                resolve([totalData, totalPage, result, page, perPage]);
              }
            }
          );
        }
      );
    });
  },

  getAllProductsFavourite: (queryPage, queryPerPage, sortBy, order) => {
    console.log("ini", sortBy);
    return new Promise((resolve, reject) => {
      connection.query(
        "SELECT COUNT(*) AS totalData FROM products LEFT JOIN categories ON products.categoryID = categories.id WHERE products.isFavorit = true",
        (err, result) => {
          let totalData, page, perPage, totalPage;
          if (err) {
            console.log(err);
            reject(new Error("Internal server error"));
          } else {
            totalData = result[0].totalData;
            page = queryPage ? parseInt(queryPage) : 1;
            perPage = queryPerPage ? parseInt(queryPerPage) : 5;
            totalPage = Math.ceil(totalData / perPage);
          }
          const firstData = perPage * page - perPage;
          connection.query(
            `SELECT products.id as id, products.name as name, categories.name as category, products.price, products.image, products.description, products.size, products.deliveryMethod, 
            products.stock, products.totalSale, products.categoryID, products.hourStart, products.hourEnd, products.created_at FROM products LEFT JOIN categories ON products.categoryID = categories.id WHERE products.isFavorit = true ORDER BY ${sortBy} ${order} LIMIT ?, ?`,
            [firstData, perPage],
            (err, result) => {
              if (err) {
                reject(new Error("Internal server error"));
              } else {
                resolve([totalData, totalPage, result, page, perPage]);
              }
            }
          );
        }
      );
    });
  },

  getProductsById: (id) => {
    return new Promise((resolve, reject) => {
      connection.query(
        `SELECT products.id, products.name as name, categories.name as category, products.price, products.image, products.description, products.size, products.deliveryMethod, 
        products.stock, products.totalSale, products.categoryID, products.hourStart, products.hourEnd, products.created_at FROM products LEFT JOIN categories ON products.categoryID = categories.id  WHERE products.id = ?`,
        id,
        (err, result) => {
          if (!err) {
            resolve(result);
          } else {
            reject(new Error("Internal server error"));
          }
        }
      );
    });
  },

  createProduct: (data) => {
    return new Promise((resolve, reject) => {
      connection.query(
        `INSERT INTO products set ?`,
        data,

        (err, result) => {
          if (!err) {
            connection.query(
              "SELECT * FROM products WHERE id = ?",
              result.insertId,
              (err, result) => {
                if (!err) {
                  resolve(result);
                } else {
                  reject(new Error("Internal server error"));
                }
              }
            );
          } else {
            reject(new Error("Internal server error"));
          }
        }
      );
    });
  },

  updateProduct: (id, data) => {
    return new Promise((resolve, reject) => {
      connection.query(
        "UPDATE products SET ? WHERE id = ?",
        [data, id],
        (err, result) => {
          if (!err) {
            connection.query(
              "SELECT * FROM products WHERE id = ?",
              id,
              (err, result) => {
                if (!err) {
                  resolve(result);
                } else {
                  reject(new Error("Internal server error"));
                }
              }
            );
          } else {
            reject(new Error("Internal server error"));
          }
        }
      );
    });
  },

  deleteProduct: (id) => {
    return new Promise((resolve, reject) => {
      connection.query(
        "DELETE FROM products WHERE id = ?",
        id,
        (err, result) => {
          if (!err) {
            resolve(result);
          } else {
            reject(new Error("Internal server error"));
          }
        }
      );
    });
  },

  findProduct: (id, message) => {
    return new Promise((resolve, reject) => {
      connection.query(
        "SELECT * FROM products WHERE id = ?",
        id,
        (err, result) => {
          if (!err) {
            if (result.length == 1) {
              resolve(result);
            } else {
              reject(new Error(`Cannot ${message} product with id = ${id}`));
            }
          } else {
            reject(new Error("Internal server error"));
          }
        }
      );
    });
  },
};
