//membuat koneksi dengan database
const connection = require("../configs/dbConfig");

//Export setiap model orders
module.exports = {
  //menambah body order baru
  createBodyOrder: (data) => {
    return new Promise((resolve, reject) => {
      let sql = data.map(
        (item) =>
          `('${item.inv}', '${item.userID}', '${item.userName}', '${item.productName}', '${item.productImage}', '${item.size}', ${item.amount}, ${item.price})`
      );

      connection.query(
        `INSERT INTO order_body (inv, userID, userName, productName, productImage, size, amount, price) VALUES ${sql}`,
        (error, result) => {
          if (error) {
            console.log("ini dari body order", error.message);
            reject(new Error(error));
          } else {
            resolve(result);
          }
        }
      );
    });
  },

  // menambah head order
  createHeadOrder: (data) => {
    return new Promise((resolve, reject) => {
      connection.query(
        `INSERT INTO order_head (inv, userName, orderType, orderDetails, orderPhone, paymentType, total)
      VALUE (${data.inv}, '${data.userName}', '${data.orderType}', '${data.orderDetails}', '${data.orderPhone}', '${data.paymentType}', ${data.total})`,
        (error, result) => {
          if (error) {
            console.log("ini dari head order", error.message);
            reject(new Error(error));
          } else {
            console.log(result);
            resolve(result);
          }
        }
      );
    });
  },
};
