//membuat koneksi dengan database
const connection = require("../configs/dbConfig");

//Export setiap model orders
module.exports = {
  // menambah head order
  createHeadOrder: (data) => {
    return new Promise((resolve, reject) => {
      connection.query("INSERT INTO order_head SET ?", data, (err, result) => {
        if (!err) {
          resolve(data);
        } else {
          reject(new Error("Internal server error"));
        }
      });
    });
  },

  //menambah body order baru
  createBodyOrder: (data) => {
    return new Promise((resolve, reject) => {
      connection.query("INSERT INTO order_body SET ?", data, (err, result) => {
        if (!err) {
          resolve(data);
        } else {
          reject(new Error("Internal server error"));
        }
      });
    });
  },

  updateStock: (stock, id) => {
    return new Promise((resolve, reject) => {
      connection.query(
        "UPDATE products SET stock = stock - ? WHERE id = ?",
        [stock, id],
        (err, result) => {
          if (!err) {
            resolve(result);
          } else {
            reject(new Error("Internal srver error stock"));
          }
        }
      );
    });
  },

  updateTotalSale: (stock, id) => {
    return new Promise((resolve, reject) => {
      connection.query(
        "UPDATE products SET totalSale = totalSale + ? WHERE id = ?",
        [stock, id],
        (err, result) => {
          if (!err) {
            resolve(result);
          } else {
            reject(new Error("Internal srver error stock"));
          }
        }
      );
    });
  },

  createCart: (data) => {
    return new Promise((resolve, reject) => {
      connection.query("INSERT INTO cart SET ?", data, (err, result) => {
        if (!err) {
          resolve(data);
        } else {
          reject(new Error("Internal server error"));
        }
      });
    });
  },

  deleteCart: (id) => {
    return new Promise((resolve, reject) => {
      connection.query("DELETE FROM cart WHERE id = ?", id, (err, result) => {
        if (!err) {
          resolve(result);
        } else {
          reject(new Error("Internal server error"));
        }
      });
    });
  },

  allOrder: (offset, limit, sort, range, user, pending) => {
    return new Promise((resolve, reject) => {
      let sql = `SELECT MIN(order_head.inv) AS inv, order_head.created_at, order_head.cashierName as cashier, order_head.userName as customer
        , GROUP_CONCAT(' ',order_body.productName,' (',order_body.size,') x ',order_body.amount) as orders , order_head.total as total, order_head.orderType, order_head.orderDetails, order_head.orderPhone, order_head.paymentType, order_head.isPending, order_head.created_at, order_head.updated_at 
        FROM order_head LEFT JOIN order_body ON order_head.inv = order_body.inv WHERE order_body.isPending LIKE '${pending}' AND userID LIKE '${user}' AND `;
      if (range == "DAY" || range == "day") {
        sql =
          sql +
          ` CAST(order_head.created_at AS DATE) = CURDATE() GROUP BY order_head.inv ORDER BY order_head.created_at ${sort} LIMIT ${offset}, ${limit}`;
      } else {
        sql =
          sql +
          ` order_head.created_at BETWEEN date_sub(now(),INTERVAL 1 ${range}) and now() 
                  GROUP BY order_head.inv ORDER BY order_head.created_at ${sort} LIMIT ${offset}, ${limit}`;
      }
      connection.query(sql, (error, result) => {
        if (error) {
          reject(new Error(error));
        } else {
          resolve(result);
        }
      });
    });
  },

  detailHead: (inv) => {
    return new Promise((resolve, reject) => {
      connection.query(
        `SELECT inv, cashierName as cashier, userName as customer, orderType, orderDetails, orderPhone, paymentType, total, isPending, created_at, updated_at from order_head WHERE inv = ${inv}`,
        (error, result) => {
          if (error) {
            reject(new Error(error));
          } else {
            resolve(result);
          }
        }
      );
    });
  },
  detailBody: (inv) => {
    return new Promise((resolve, reject) => {
      connection.query(
        `SELECT id, productName as product, productImage as image, size, amount, price FROM order_body where inv = ${inv}`,
        (error, result) => {
          if (error) {
            reject(new Error(error));
          } else {
            resolve(result);
          }
        }
      );
    });
  },

  //updatebodyorder
  updateHeadOrder: (data, inv) => {
    return new Promise((resolve, reject) => {
      connection.query(
        `UPDATE order_head SET ? WHERE inv=?`,
        [data, inv],
        (error, result) => {
          if (error) {
            reject(new Error(error));
          } else {
            resolve(result);
          }
        }
      );
    });
  },

  //update head order
  updateBodyOrder: (data, inv) => {
    return new Promise((resolve, reject) => {
      connection.query(
        `UPDATE order_body SET ? WHERE inv=?`,
        [data, inv],
        (error, result) => {
          if (error) {
            reject(new Error(error));
          } else {
            resolve(result);
          }
        }
      );
    });
  },

  // Hapus Order Berdasarkan Invoice
  deleteOrder: (inv) => {
    return new Promise((resolve, reject) => {
      connection.query(
        `DELETE order_body, order_head FROM order_head INNER JOIN order_body 
        WHERE order_body.inv=${inv} AND order_head.inv=${inv}`,
        (error, result) => {
          if (error) {
            console.log("error delete", error.message);
            reject(new Error(error));
          } else {
            resolve(result);
          }
        }
      );
    });
  },

  // Total Pemasukan dari Awal
  totalIncome: () => {
    return new Promise((resolve, reject) => {
      connection.query(
        `SELECT sum(total) as totalIncome FROM order_head WHERE isPending = 0`,
        (error, result) => {
          if (error) {
            reject(new Error(error));
          } else {
            resolve(result);
          }
        }
      );
    });
  },

  // Banyaknya Order yang Terjadi
  totalItems: (range, pending, user) => {
    return new Promise((resolve, reject) => {
      connection.query(
        `SELECT COUNT(DISTINCT order_head.inv) as total FROM order_head LEFT JOIN order_body ON order_head.inv = order_body.inv WHERE order_head.isPending LIKE '${pending}' AND  order_body.userID LIKE '${user}' AND order_body.created_at BETWEEN date_sub(now(),INTERVAL 1 ${range}) and now()`,
        (error, result) => {
          if (error) {
            reject(new Error(error));
          } else {
            resolve(result);
          }
        }
      );
    });
  },
  // Total Pemasukan Sesuai Range
  totalRange: (range) => {
    return new Promise((resolve, reject) => {
      let sql = "";
      if (range == "DAY" || "day") {
        sql = `SELECT SUM(total) as totalIncome FROM order_head WHERE CAST(created_at AS DATE) = CURDATE() AND isPending LIKE '0'`;
      } else {
        sql = `SELECT sum(total) as totalIncome FROM order_head WHERE isPending LIKE '0' AND created_at BETWEEN date_sub(now(),INTERVAL 1 ${range}) and now()`;
      }
      connection.query(sql, (error, result) => {
        if (error) {
          reject(new Error(error));
        } else {
          resolve(result);
        }
      });
    });
  },

  // Yesterday Income
  totalYesterday: () => {
    return new Promise((resolve, reject) => {
      connection.query(
        `SELECT sum(total) as yesterdayIncome FROM order_head WHERE isPending LIKE '0' AND DATE(created_at) < CURDATE() && DATE(created_at) > CURRENT_DATE - 2`,
        (error, result) => {
          if (error) {
            reject(new Error(error));
          } else {
            resolve(result);
          }
        }
      );
    });
  },

  // Banyaknya Order yang Terjadi Minggu Kemarin
  totalLastWeek: () => {
    return new Promise((resolve, reject) => {
      connection.query(
        `SELECT COUNT(DISTINCT inv) as total FROM order_head WHERE isPending LIKE '0' AND DATE(created_at) < CURDATE()-7 && DATE(created_at) > CURRENT_DATE - 14`,
        (error, result) => {
          if (error) {
            reject(new Error(error));
          } else {
            resolve(result);
          }
        }
      );
    });
  },

  // Banyak Items yang sesuai
  // Banyaknya Order yang Terjadi
  totalOrders: (range, pending) => {
    return new Promise((resolve, reject) => {
      connection.query(
        `SELECT COUNT(inv) as total FROM order_head WHERE isPending LIKE '${pending}' AND created_at BETWEEN date_sub(now(),INTERVAL 1 ${range}) and now()`,
        (error, result) => {
          if (error) {
            reject(new Error(error));
          } else {
            resolve(result);
          }
        }
      );
    });
  },

  getUser: (idUser) => {
    return new Promise((resolve, reject) => {
      connection.query(
        "SELECT users.id FROM users WHERE id = ?",
        idUser,
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

  getCart: (user) => {
    return new Promise((resolve, reject) => {
      connection.query(
        `SELECT * FROM cart WHERE userName = ?`,
        `${user}`,
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
