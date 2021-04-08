const fs = require("fs");
// import MomentJS
const moment = require("moment");
// import model
const ordersModel = require("../models/ordersModel");
// import helper
const helper = require("../helpers/printHelper");

// export setiap controllers order
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
      helper.printError(res, 500, "Internal Server Error");
    }
  },

  readAll: async (req, res) => {
    try {
      // Ambil Query dari URL
      const limit = req.query.limit ? req.query.limit : "5";
      const sort = req.query.sort ? req.query.sort : "desc";
      const range = req.query.range ? toUpper(req.query.range) : "YEAR";
      const page = req.query.page ? req.query.page : "1";
      const offset = page === 1 ? 0 : (page - 1) * limit;
      const user = req.query.user ? req.query.user : "%";
      const pending = req.query.pending ? req.query.pending : "%";
      // Ambil Dari Modal pakai Await
      const allIncome = await ordersModel.totalIncome();
      const total = await ordersModel.totalItems(range, pending, user);
      const tdyIncome = await ordersModel.totalRange("day");
      const incomeYesterday = await ordersModel.totalYesterday();
      const ordersAll = await ordersModel.totalOrders("YEAR", pending);
      const ordersLastweek = await ordersModel.totalLastWeek();
      const ordersThisWeek = await ordersModel.totalOrders("WEEK", pending);
      ordersModel
        .allOrder(offset, limit, sort, range, user, pending)
        .then((response) => {
          if (response.length != 0) {
            const pagination = {
              // Halaman yang sedang diakses
              page,
              // Batasan Banyaknya hasil per halaman
              limit,
              // range data yang sedang ditampilkan
              range,
              // Banyaknya Invoices yang terdaftar
              allOrders: ordersAll[0].total,
              // Banyak Order Minggu ini
              thisWeekOrders: ordersThisWeek[0].total,
              // Banyak Order Minggu kemarin
              lastWeekOrders: ordersLastweek[0].total,
              // Order Gain Lastweek
              gainOrders:
                ((ordersThisWeek[0].total - ordersLastweek[0].total) /
                  ordersLastweek[0].total) *
                100,
              // Banyaknya Orders Yang Sesuai
              totalResult: total[0].total,
              // Jumlah Halaman
              totalPages: Math.ceil(total[0].total / limit),
              // Jumlah Total Pemasukan
              totalIncome: Number(allIncome[0].totalIncome),
              // Jumlah Pemasukan Hari Ini
              todaysIncome: Number(tdyIncome[0].totalIncome),
              // Jumlah Pemasukan Kemarin
              YesterdayIncome: Number(incomeYesterday[0].yesterdayIncome),
              // Kenaikan Penjualan
              gainIncome: (
                ((tdyIncome[0].totalIncome -
                  incomeYesterday[0].yesterdayIncome) /
                  incomeYesterday[0].yesterdayIncome) *
                100
              ).toFixed(2),
            };
            // Kalau hasilnya bukan array kosong
            helper.printPaginateDetai(
              res,
              200,
              "Display All Order Success",
              pagination,
              response
            );
          } else {
            // Kalau hasilnya array kosong
            helper.printError(res, 400, "No data on this page");
          }
        })
        .catch((err) => {
          // Kalau Ada salah di Query
          console.log(err.message);
          helper.printError(res, 400, "Wrong Query Given");
        });
    } catch (err) {
      // Kalau ada salah lainnya
      console.log(err.message);
      helper.printError(res, 500, "Internal Server Error");
    }
  },

  // Tampilkan Detail Item Tiap Invoices
  readDetail: (req, res) => {
    try {
      // Ambil data dari parameter
      const inv = req.params.inv;
      ordersModel
        .detailBody(inv)
        .then((response) => {
          if (response.length != 0) {
            ordersModel
              .detailHead(inv)
              .then((headRes) => {
                // Kalau ada datanya
                helper.printSuccess(res, 200, "Show Detail Data Success", {
                  head: headRes,
                  body: response,
                });
              })
              .catch((err) => {
                // Kalau salah parameternya
                helper.printError(res, 400, "Wrong Parameter Type");
              });
          } else {
            // kalau tidak ada datanya
            helper.printError(res, 400, "Data Not Found, Wrong Invoice");
          }
        })
        .catch((err) => {
          // Kalau salah parameternya
          helper.printError(res, 400, "Wrong Parameter Type");
        });
    } catch (err) {
      // Kalau ada salah lainnya
      helper.printError(res, 500, "Internal Server Error");
    }
  },

  //update orders
  updateOrders: (req, res) => {
    try {
      const inv = req.params.inv;
      const { isPending, cashierName } = req.body;
      const thisDate = moment().format("YYYY-MM-DDThh:mm:ss.ms");
      const data = {
        isPending,
        updated_at: thisDate,
      };
      const dataHead = {
        ...data,
        cashierName,
      };
      ordersModel
        .updateBodyOrder(data, inv)
        .then((response) => {
          if (response.affectedRows != 0) {
            ordersModel
              .updateHeadOrder(dataHead, inv)
              .then((response) => {
                if (response.affectedRows != 0) {
                  // Kalau berhasil mengupdate
                  helper.printSuccess(
                    res,
                    200,
                    "Update Order Success",
                    response
                  );
                } else {
                  // Kalau salah ID
                  helper.printError(res, 400, "Nothing Updated, Wrong ID");
                }
              })
              .catch((err) => {
                // Kalau misalkan ada error dari model
                helper.printError(res, 400, "Wrong Data Type Given");
              });
          } else {
            // Kalau salah ID
            helper.printError(res, 400, "Nothing Updated, Wrong ID");
          }
        })
        .catch((err) => {
          // Kalau misalkan ada error dari model
          helper.printError(res, 400, "Wrong Data Type Given");
        });
    } catch (err) {
      // Kalau ada salah lainnya
      helper.printError(res, 500, "Internal Server Error");
    }
  },

  // Hapus order berdasarkan invoice
  delete: (req, res) => {
    try {
      const inv = req.params.inv;
      console.log(inv);
      ordersModel
        .deleteOrder(inv)
        .then((response) => {
          if (response.affectedRows != 0) {
            // Kalau ada yang terhapus
            helper.printSuccess(res, 200, "Add New Order Success", response);
          } else {
            // Kalau tidak ada yang terhapus
            helper.printError(res, 400, "Nothing Deleted, Wrong Invoice");
          }
        })
        .catch((err) => {
          // Kalau ada salah di parameternya
          helper.printError(res, 400, "Wrong Parameter Type");
        });
    } catch (err) {
      // Kalau ada salah lainnya
      console.log(err.message);
      helper.printError(res, 500, "Internal Server Error");
    }
  },
};
