const fs = require("fs");
// import MomentJS
const moment = require("moment");
// import model
const ordersModel = require("../models/ordersModel");
// import helper
const helper = require("../helpers/printHelper");

// export setiap controllers order
module.exports = {
  create: async (req, res) => {
    const arrCart = req.body.arrCart;
    const idProduct = req.body.idProduct;
    const idUser = req.body.idUser;
    const userName = req.body.userName;
    const orderType = req.body.orderType;
    const orderDetails = req.body.orderDetails;
    const orderPhone = req.body.orderPhone;
    const paymentType = req.body.paymentType;
    const total = req.body.total;
    const qty = req.body.qty;

    try {
      const getUser = await ordersModel.getUser(idUser);
      if (getUser < 1) {
        helper.printError(res, 400, "Id user not found!");
        return;
      }
    } catch (err) {
      helper.printError(res, 500, err.message);
    }
    const invoice = new Date().getTime();
    const data = {
      inv: invoice,
      cashierName: "Admin",
      userName: userName,
      orderType: orderType,
      orderDetails: orderDetails,
      orderPhone: orderPhone,
      paymentType: paymentType,
      isPending: true,
      total: total,
    };

    ordersModel
      .createHeadOrder(data)
      .then(async (result) => {
        if (result.affectedRows === 0) {
          helper.printError(res, 400, "Error orders");
          return;
        }
        await ordersModel.updateStock(qty, idProduct);
        await ordersModel.updateTotalSale(qty, idProduct);
        arrCart.map((data, index) => {
          const orderBody = {
            inv: invoice,
            userID: idUser,
            userName: data.userName,
            productName: data.productName,
            productImage: data.productImage,
            size: data.size,
            amount: data.amount,
            price: data.price,
            isPending: true,
          };
          ordersModel.createBodyOrder(orderBody);
        });
        arrCart.forEach((data, index) => {
          ordersModel.deleteCart(data.id);
        });
        helper.printSuccess(res, 200, "Orders successfully", result);
      })
      .catch((err) => {
        helper.printError(res, 500, err.message);
      });
  },

  createCart: (req, res) => {
    const {
      userName,
      orderType,
      orderDetails,
      orderPhone,
      productName,
      productImage,
      price,
    } = req.body;
    const cart = req.body.cart;
    const result = [];
    cart.map((data, index) => {
      const dataCart = {
        userName,
        orderType,
        orderDetails,
        orderPhone,
        productName,
        productImage,
        price,
        size: data.size,
        amount: data.amount,
      };
      result.push(dataCart);
      ordersModel.createCart(dataCart);
    });
    helper.printSuccess(res, 200, "Create cart successfully", result);
  },

  findCart: (req, res) => {
    const userName = req.params.user;

    ordersModel
      .getCart(userName)
      .then((result) => {
        if (result < 1) {
          helper.printError(res, 400, "Cart not found");
          return;
        }
        helper.printSuccess(res, 200, "Find cart successfully", result);
      })
      .catch((err) => {
        helper.printError(res, 500, err.message);
      });
  },

  readAll: async (req, res) => {
    console.log(req.auth);
    try {
      // Ambil Query dari URL
      const perPage = req.query.perPage ? req.query.perPage : "5";
      const sort = req.query.sort ? req.query.sort : "desc";
      const range = req.query.range ? toUpper(req.query.range) : "YEAR";
      const page = req.query.page ? req.query.page : "1";
      const offset = page === 1 ? 0 : (page - 1) * perPage;
      const user = req.query.user ? req.query.user : "%";
      const pending = req.query.pending ? req.query.pending : "%";
      // Ambil Dari Modal pakai Await
      // const allIncome = await ordersModel.totalIncome();
      const total = await ordersModel.totalItems(range, pending, user);
      // const tdyIncome = await ordersModel.totalRange("day");
      // const incomeYesterday = await ordersModel.totalYesterday();
      // const ordersAll = await ordersModel.totalOrders("YEAR", pending);
      // const ordersLastweek = await ordersModel.totalLastWeek();
      // const ordersThisWeek = await ordersModel.totalOrders("WEEK", pending);
      ordersModel
        .allOrder(offset, perPage, sort, range, user, pending)
        .then((response) => {
          if (response.length != 0) {
            // const pagination = {
            // Halaman yang sedang diakses
            // page,
            // Batasan Banyaknya hasil per halaman
            // perPage,
            // range data yang sedang ditampilkan
            // range,
            // Banyaknya Invoices yang terdaftar
            // allOrders: ordersAll[0].total,
            // Banyak Order Minggu ini
            // thisWeekOrders: ordersThisWeek[0].total,
            // Banyak Order Minggu kemarin
            // lastWeekOrders: ordersLastweek[0].total,
            // Order Gain Lastweek
            // gainOrders:
            //   ((ordersThisWeek[0].total - ordersLastweek[0].total) /
            //     ordersLastweek[0].total) *
            //   100,
            // Banyaknya Orders Yang Sesuai
            // totalData: total[0].total,
            // Jumlah Halaman
            // totalPage: Math.ceil(total[0].total / perPage),
            // Jumlah Total Pemasukan
            // totalIncome: Number(allIncome[0].totalIncome),
            // Jumlah Pemasukan Hari Ini
            // todaysIncome: Number(tdyIncome[0].totalIncome),
            // Jumlah Pemasukan Kemarin
            // YesterdayIncome: Number(incomeYesterday[0].yesterdayIncome),
            // Kenaikan Penjualan
            // gainIncome: (
            //   ((tdyIncome[0].totalIncome -
            //     incomeYesterday[0].yesterdayIncome) /
            //     incomeYesterday[0].yesterdayIncome) *
            //   100
            // ).toFixed(2),
            // };
            // Kalau hasilnya bukan array kosong
            // helper.printPaginateDetail(
            //   res,
            //   200,
            //   "Display All Order Success",
            //   pagination,
            //   response
            // );
            totalData = total[0].total;
            // Jumlah Halaman
            totalPage = Math.ceil(total[0].total / perPage);

            helper.printPaginate(
              res,
              200,
              "Display All Order Success",
              totalData,
              totalPage,
              response,
              page,
              perPage
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
                helper.printError(res, 400, "Wrong Parameter Type ");
              });
          } else {
            // kalau tidak ada datanya
            helper.printError(res, 400, "Data Not Found, Wrong Invoice");
          }
        })
        .catch((err) => {
          // Kalau salah parameternya
          console.log(err.message);
          helper.printError(res, 400, "Wrong Parameter Type");
        });
    } catch (err) {
      // Kalau ada salah lainnya
      helper.printError(res, 500, "Internal Server Error");
    }
  },
  //tampilkan order body per user
  getHistory: (req, res) => {
    try {
      // Ambil data dari parameter
      const id = req.auth.id;
      ordersModel
        .detailHisto(id)
        .then((response) => {
          if (response.length != 0) {
            helper.printSuccess(res, 200, "Show Detail Data Success", {
              body: response,
            });
          } else {
            // kalau tidak ada datanya
            helper.printError(res, 400, "Data Not Found");
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
  //delete berdasar order id
  deleteHisto: async (req, res) => {
    const id = req.params.id;
    const order = req.body.order;

    try {
      for (let i = 0; i < order.length; i++) {
        const result = await ordersModel.deleteOrder(order[i], id);
        if (result.affectedRows === 0) {
          helper.printError(res, 400, "Error deleting order history");
          return;
        }
      }
      helper.printSuccess(res, 200, "Order history has been deleted", {});
    } catch (err) {
      helper.printError(res, 500, err.message);
    }
  },
};
