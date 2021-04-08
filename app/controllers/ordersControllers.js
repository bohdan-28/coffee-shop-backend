const fs = require("fs");
const ordersModel = require("../models/ordersModel");
const helper = require("../helpers/printHelper");

//Export setiap controllers order
module.exports = {
  create: (req, res) => {
    try {
      // Ambil data dari body
      const data = req.body;
      // Inisialisasi Checker
      let dataChecker = false;
      for (let i = 0; i < data.length; i++) {
        if (
          data[i].inv &&
          data[i].userID &&
          data[i].userName &&
          data[i].productName &&
          data[i].productImage &&
          data[i].size &&
          data[i].amount &&
          data[i].price &&
          data[i].orderType &&
          data[i].orderDetails &&
          data[i].orderPhone &&
          data[i].paymentType
        ) {
          dataChecker = true;
        } else {
          dataChecker = false;
          break;
        }
      }
      if (dataChecker) {
        let total = 0;
        for (let i = 0; i < data.length; i++) {
          total = total + data[i].price * data[i].amount;
        }
        const dataHead = {
          inv: data[0].inv,
          userName: data[0].userName,
          orderType: data[0].orderType,
          orderDetails: data[0].orderDetails,
          orderPhone: data[0].orderPhone,
          paymentType: data[0].paymentType,
          total: total,
        };
        ordersModel
          .createBodyOrder(data)
          .then(async () => {
            // Post Head Data
            await ordersModel
              .createHeadOrder(dataHead)
              .then((result) => {
                helper.printSuccess(res, 200, "Add New Order Success", result);
              })
              // Kalau berhasil menambahkan
              .catch((err) => {
                console.log(err.message);
                helper.printError(res, 400, "Update Head error");
              });
          })
          .catch((err) => {
            // Kalau ada tipe data yang salah
            helper.printError(res, 400, "Wrong Data Type Given");
          });
      } else {
        // Kalau ada data yang kosong
        helper.printError(res, 400, "Please Fill All Field");
      }
    } catch (err) {
      // Kalau ada salah lainnya
      helper.printError(res, 400, "Internal Server Error");
    }
  },
};
