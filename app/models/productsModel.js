const connection = require("../configs/dbConfig");

// Export setiap model products
module.exports = {
  getAllProducts: (queryPage, queryPerPage, keyword, sortBy, order) => {
    return new Promise((resolve, reject) => {
      connection.query(
        "SELECT COUNT(*) AS totalData FROM products WHERE name LIKE ? OR category LIKE ?",
        [`%${keyword}%`, `%${keyword}%`],
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
            `SELECT * FROM products WHERE name LIKE ? OR category LIKE ? ORDER BY ${sortBy} ${order} LIMIT ?, ?`,
            [`%${keyword}%`, `%${keyword}%`, firstData, perPage],
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
    });
  },
};
